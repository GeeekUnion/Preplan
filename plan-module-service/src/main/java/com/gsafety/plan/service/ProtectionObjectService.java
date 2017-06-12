package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.ProtectionObject;

public interface ProtectionObjectService extends IBaseService{

	ProtectionObject getByProtectionObjectIType(String iType);

}
