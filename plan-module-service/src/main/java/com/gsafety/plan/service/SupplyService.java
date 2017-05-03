package com.gsafety.plan.service;

import net.sf.json.JSONArray;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface SupplyService extends IBaseService{
	public String getPageByCode(int pageNumber, int pageSize,String code);
	
	
	
	
	public JSONArray getMapSupply();

	
}
