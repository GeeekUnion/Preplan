package com.gsafety.plan.service;

import java.util.List;

import com.gsafety.cloudframework.common.base.service.IBaseService;



import com.gsafety.plan.po.Privilege;

import net.sf.json.JSONArray;

public interface PrivilegeService extends IBaseService{

	List<Privilege> query();

    String getPageBySql(int pageNumber, int pageSize);


	
}
