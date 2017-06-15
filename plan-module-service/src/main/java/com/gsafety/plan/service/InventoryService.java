package com.gsafety.plan.service;

import net.sf.json.JSONArray;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.EmergencyResponseTeam;
import com.gsafety.plan.po.Hazard;
import com.gsafety.plan.po.Inventory;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.ProtectionObject;

public interface InventoryService extends IBaseService{
	String getPage(int pageNumber, int pageSize,String clickType,double lo,double la);
	String getPageHazard(int pageNumber, int pageSize,String clickType);
	String getPageEmergencyResponseTeam(int pageNumber, int pageSize,String clickType);
	String getPageProtectionObject(int pageNumber, int pageSize,String clickType);
	public JSONArray getMapInventory();
	public JSONArray getMapVicinity();
	Inventory getByInventoryIType(String iType);
	
}
