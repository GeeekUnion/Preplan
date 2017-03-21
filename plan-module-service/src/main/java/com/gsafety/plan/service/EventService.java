package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface EventService extends IBaseService{
	String queryEvent(int pageNumber, int pageSize);
}
