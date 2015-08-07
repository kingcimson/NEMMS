package com.wellheadstone.nemms.dao;

import java.sql.Types;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.wellheadstone.nemms.data.SortType;
import com.wellheadstone.nemms.data.criterion.Restrictions;
import com.wellheadstone.nemms.data.jdbc.BaseDao;
import com.wellheadstone.nemms.po.ConfigDictPo;

/**
 * 配置字典表数据访问实现类
 */
@Repository
public class ConfigDictDao extends BaseDao<ConfigDictPo> {

	public ConfigDictDao() {
		super(ConfigDictPo.EntityName, ConfigDictPo.Id);
	}

	public List<ConfigDictPo> queryAllItem() {
		String[] columnNames = new String[] {
				ConfigDictPo.Id, ConfigDictPo.Name, ConfigDictPo.Key,
				ConfigDictPo.Pid, ConfigDictPo.Value, ConfigDictPo.Sequence
		};
		return this.query("pid,sequence", SortType.ASC, columnNames);
	}

	public ConfigDictPo queryBy(int pid, String key) {
		String condition = Restrictions.equal(ConfigDictPo.Pid, "?")
				.append(Restrictions.And)
				.append(Restrictions.equal(ConfigDictPo.Key, "?")).toString();
		Object[] args = new Object[] { pid, key };
		return this.queryOne(condition, args);
	}

	public List<ConfigDictPo> queryBy(int pid) {
		String sqlTemplate = "SELECT t.*,(SELECT if(count(*)>0,1,0) FROM %1$s t1 WHERE t1.pid = t.id) as has_child FROM %1$s t WHERE pid=? order by t.sequence desc";
		return this.queryForList(String.format(sqlTemplate, ConfigDictPo.EntityName),
				new Object[] { pid }, new int[] { Types.INTEGER }, ConfigDictPo.class);
	}

	public List<ConfigDictPo> queryBy(String key) {
		String sqlTemplate = "select t1.* from %1$s t1 INNER JOIN %1$s t2 on t1.pid = t2.id where t2.key=? order by t1.sequence asc";
		return this.queryForList(String.format(sqlTemplate, ConfigDictPo.EntityName),
				new Object[] { key }, new int[] { Types.VARCHAR }, ConfigDictPo.class);
	}
}
