package com.wellheadstone.nemms.membership.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wellheadstone.nemms.data.jdbc.BaseService;
import com.wellheadstone.nemms.membership.dao.OperationDao;
import com.wellheadstone.nemms.membership.po.OperationPo;

@Service
public class OperationService extends BaseService<OperationDao, OperationPo> {
	private static Map<String, OperationPo> operationMap;
	private static byte[] lock = new byte[0];

	@Autowired
	public OperationService(OperationDao dao) {
		super(dao);
		this.getOperationMap();
	}

	public void reloadCache() {
		operationMap.clear();
		operationMap = this.getOperationMap();
	}

	private Map<String, OperationPo> getOperationMap() {
		synchronized (lock) {
			if (operationMap == null || operationMap.size() == 0) {
				operationMap = this.dao.queryWithModulePath()
						.stream()
						.collect(Collectors.toMap(OperationPo::getCode, Function.identity()));
			}
			return operationMap;
		}
	}

	public int addOperation(OperationPo entity) {
		int newId = this.dao.insertWithId(entity);
		return newId;
	}

	public List<OperationPo> getOperationMapById(Integer id) {
		List<OperationPo> opList = new ArrayList<OperationPo>();
		for (OperationPo operationPo : operationMap.values()) {
			if (operationPo.getModuleId() == id) {
				opList.add(operationPo);
			}
		}
		return opList;
	}

	public List<OperationPo> getAllOperations() {
		return operationMap.values().stream().collect(Collectors.toList());
	}

	public String getOperationIds(String[] codes)
	{
		if (codes == null || codes.length == 0) {
			return null;
		}

		List<String> optIds = new ArrayList<String>(codes.length);
		for (String code : codes)
		{
			String key = code.trim().toLowerCase();
			if (operationMap.containsKey(key))
				optIds.add(String.valueOf(operationMap.get(key).getOperationId()));
		}

		return StringUtils.join(optIds, ',');
	}

	public String getOperationIds(String operationIds)
	{
		// 如果设置为所有权限
		if (operationIds.contains("all"))
			return "all";

		List<String> idList = Arrays.asList(StringUtils.split(operationIds, ','));
		List<String> treePaths = operationMap.values().stream()
				.filter(x -> idList.contains(String.valueOf(x.getOperationId())))
				.map(y -> y.getPath())
				.collect(Collectors.toList());

		String moduleIds = StringUtils.join(treePaths, ',');
		List<String> moduleIdList = Arrays.asList(StringUtils.split(moduleIds, ','))
				.stream()
				.distinct()
				.collect(Collectors.toList());
		return StringUtils.join(moduleIdList, ',');
	}

	public boolean hasOperationIn(int moduleId)
	{
		return operationMap.values()
				.stream().filter(x -> x.getOperationId() == moduleId)
				.count() > 0;
	}

	public String getModuleIds(String operationIds) {
		// 如果设置为所有权限
		if (operationIds.contains("all")) {
			return "all";
		}

		String[] idSplit = StringUtils.split(operationIds, ',');
		Map<String, OperationPo> operationMap = this.dao.queryWithModulePathForMap();
		List<String> modulePathList = new ArrayList<String>();
		for (String optId : idSplit) {
			OperationPo operation = operationMap.get(optId);
			if (operation != null) {
				modulePathList.addAll(Arrays.asList(StringUtils.split(operation.getPath(), ',')));
			}
		}

		List<String> moduleIds = modulePathList.stream().distinct().collect(Collectors.toList());
		return StringUtils.join(moduleIds, ',');
	}
}