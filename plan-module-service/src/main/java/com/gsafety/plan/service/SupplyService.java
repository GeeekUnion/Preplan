package com.gsafety.plan.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface SupplyService extends IBaseService{
	public JSONObject getPageByCode(int pageNumber, int pageSize,String code);
	public String  getPageByCode2(int pageNumber, int pageSize,String code);
	
	
	
	public JSONArray getMapSupply();

	
}
