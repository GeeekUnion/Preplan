package com.gsafety.plan.service;

import com.gsafety.cloudframework.basecode.po.EmsOrg;
import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface DepartmentService extends IBaseService{

    String getOrg(EmsOrg orgSet);

}
