package com.gsafety.plan.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface DrillService extends IBaseService{
	
	public JSONObject queryAreaCodeByOrgCode(String orgCode);
	public String queryDrill( String areaOrgCode, int pageNumber,
			int pageSize);
}
