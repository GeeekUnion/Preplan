package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Hazard;

public interface HazardService extends IBaseService{

	Hazard getByHazardIType(String iType);

}
