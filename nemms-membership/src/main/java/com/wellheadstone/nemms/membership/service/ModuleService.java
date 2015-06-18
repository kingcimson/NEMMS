package com.wellheadstone.nemms.membership.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.membership.dao.ModuleDao;
import com.wellheadstone.nemms.membership.po.ModulePo;

@Service
public class ModuleService extends BaseService<ModuleDao, ModulePo> {
	private static Map<Integer, ModulePo> moduleMap;
	private static byte[] lock = new byte[0];

	@Autowired
	public ModuleService(ModuleDao dao) {
		super(dao);
		this.getModuleMap();
	}

	public void reloadCache() {
		moduleMap.clear();
		moduleMap = this.getModuleMap();
	}

	private Map<Integer, ModulePo> getModuleMap() {
		synchronized (lock) {
			if (moduleMap == null || moduleMap.size() == 0) {
				moduleMap = this.dao.query().stream().collect(Collectors.toMap(ModulePo::getModuleId, Function.identity()));
			}
			return moduleMap;
		}
	}

	public List<ModulePo> getAllModules() {
		return moduleMap.values().stream().collect(Collectors.toList());
	}

	public List<ModulePo> getModules(String moduleIds) {
		if (StringUtils.isBlank(moduleIds)) {
			return new ArrayList<ModulePo>();
		}

		// 0表示返回所有系统模块
		if (moduleIds.equals("0")) {
			return this.getAllModules();
		}

		String[] ids = StringUtils.split(moduleIds, ',');
		List<ModulePo> modules = new ArrayList<ModulePo>(ids.length);
		for (String id : ids) {
			int mId = Integer.valueOf(id);
			if (moduleMap.containsKey(mId))
				modules.add(moduleMap.get(mId));
		}
		return modules;
	}

	public List<ModulePo> getChildModules(int moduleId) {
		return moduleMap.values().stream()
				.filter(x -> x.getParentId() == moduleId)
				.sorted((x, y) -> x.getSequence() > y.getSequence() ? 1 : -1)
				.collect(Collectors.toList());
	}

	public boolean hasChildren(int moduleId) {
		if (moduleMap.containsKey(moduleId)) {
			return moduleMap.get(moduleId).isHasChild();
		}
		return false;
	}

	public int addModule(ModulePo entity) {
		int newId = this.dao.insertWithId(entity);
		this.setHasChild(entity.getParentId());
		this.dao.updatePath(newId, this.getPath(entity.getParentId(), newId));
		return newId;
	}

	public boolean remove(int id, int pid) {
		this.dao.deleteByKey(id);
		if (this.hasChild(pid)) {
			return true;
		}
		return this.dao.updateHasChild(pid, false) > 0;
	}

	public void dragNode(int sourceId, int targetId, int sourcePid) {
		// 修改source节点的pid与path，hasChild值
		this.dao.updatePid(sourceId, targetId);
		this.setHasChild(targetId);
		this.dao.updatePath(sourceId, this.getPath(targetId, sourceId));
		// 递归修改source节点的所有子节点的path值
		this.rebuildPathById(sourceId);
		// 修改source节点的父节点hasChild值
		this.dao.updateHasChild(sourcePid, this.dao.countChildBy(sourcePid) > 0);
	}

	public ModulePo pasteNode(int sourceId, int targetId, String createUser) {
		ModulePo entity = this.dao.queryByKey(sourceId);
		int count = this.dao.countChildBy(targetId, entity.getName());
		if (count > 0) {
			entity.setName(String.format("%s_复件%s", entity.getName(), count));
		}
		entity.setParentId(targetId);
		entity.setModuleId(this.dao.insertWithId(entity));
		return this.dao.queryByKey(entity.getModuleId());
	}

	public boolean hasChild(int pid) {
		return this.dao.countChildBy(pid) > 0;
	}

	public String getPath(int pid, int id) {
		if (pid <= 0) {
			return "" + id;
		}
		return this.dao.queryPath(pid) + "," + id;
	}

	public void setHasChild(int pid) {
		if (pid > 0) {
			this.dao.updateHasChild(pid, true);
		}
	}

	public void rebuildPathById(int id) {
		List<ModulePo> enities = this.dao.queryByPid(id);
		for (ModulePo entity : enities) {
			String path = this.getPath(entity.getParentId(), entity.getModuleId());
			this.dao.updateHasChild(entity.getParentId(), path.split(",").length > 1);
			this.dao.updatePath(entity.getModuleId(), path);
			this.rebuildPathById(entity.getModuleId());
		}
	}
}