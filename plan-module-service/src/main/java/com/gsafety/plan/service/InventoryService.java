package com.gsafety.plan.service;

import net.sf.json.JSONArray;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface InventoryService extends IBaseService{
	String getPage(int pageNumber, int pageSize,String clickType);
	public JSONArray getMapInventory();
	public JSONArray getMapVicinity();
}
