package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface MissionService extends IBaseService{

	String getPage(int pageNumber, int pageSize);

	String getPageMis(int pageNumber, int pageSize);
}
