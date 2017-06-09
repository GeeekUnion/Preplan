package com.gsafety.plan.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface DrillService extends IBaseService{
	public String queryDrill(String orgCode,int pageNumber,int pageSize);
	public String queryAreaCodeByOrgCode(String orgCode);
}
