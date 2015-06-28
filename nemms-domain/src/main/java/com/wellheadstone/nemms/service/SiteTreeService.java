package com.wellheadstone.nemms.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.dao.SiteDao;
import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.po.SitePo;

/**
 * 报表树服务类
 */
@Service
public class SiteTreeService extends BaseService<SiteDao, SitePo> {
	@Resource
	private SiteService siteService;

	@Autowired
	public SiteTreeService(SiteDao dao) {
		super(dao);
	}

	public void dragNode(int sourceId, int targetId, int sourcePid) {
		// 修改source节点的pid与path，hasChild值
		this.dao.updatePid(sourceId, targetId);
		this.siteService.setHasChild(targetId);
		this.dao.updatePath(sourceId, this.siteService.getPath(targetId, sourceId));
		// 递归修改source节点的所有子节点的path值
		this.rebuildPathById(sourceId);
		// 修改source节点的父节点hasChild值
		this.dao.updateHasChild(sourcePid, this.dao.countChildBy(sourcePid) > 0);
	}

	public SitePo pasteNode(int sourceId, int targetId, String createUser) {
		SitePo entity = this.dao.queryByKey(sourceId);
		int count = this.dao.countChildBy(targetId, entity.getName());
		if (count > 0) {
			entity.setName(String.format("%s_复件%s", entity.getName(), count));
		}
		entity.setPid(targetId);
		entity.setCreateUser(createUser);
		entity.setId(this.dao.insertWithId(entity));
		return this.dao.queryByKey(entity.getId());
	}

	public void rebuildPathById(int id) {
		List<SitePo> enities = this.dao.queryByPid(id);
		for (SitePo entity : enities) {
			String path = this.siteService.getPath(entity.getPid(), entity.getId());
			this.dao.updateHasChild(entity.getPid(), path.split(",").length > 1);
			this.dao.updatePath(entity.getId(), path);
			this.rebuildPathById(entity.getId());
		}
	}

	public void cloneNode(int sourceId, int targetId, int dsId) {
		List<SitePo> children = this.dao.queryAllChild(sourceId);
		for (SitePo child : children) {
			if (child.getId() == sourceId) {
				child.setPid(targetId);
				int newId = this.dao.insertWithId(child);
				this.recursionCloneNode(children, newId, child.getId(), dsId);
			}
		}
	}

	private void recursionCloneNode(List<SitePo> children, int newPid, int srcPid, int dsId) {
		for (SitePo child : children) {
			if (child.getPid() == srcPid) {
				child.setPid(newPid);
				int newId = this.addWithId(child);
				this.recursionCloneNode(children, newId, child.getId(), dsId);
			}
		}
	}

	public void rebuildAllPath() {
		List<SitePo> entities = this.dao.query();
		this.rebuildPath(entities);
	}

	private void rebuildPath(List<SitePo> entities) {
		for (SitePo entity : entities) {
			String path = this.siteService.getPath(entity.getPid(), entity.getId());
			this.dao.updateHasChild(entity.getPid(), path.split(",").length > 1);
			this.dao.updatePath(entity.getId(), path);
		}
	}
}