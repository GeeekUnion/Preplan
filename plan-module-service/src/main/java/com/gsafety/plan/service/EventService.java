package com.gsafety.plan.service;

import net.sf.json.JSONArray;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface EventService extends IBaseService{
	String queryEvent(int pageNumber, int pageSize);
	JSONArray queryAllEvent();
}
