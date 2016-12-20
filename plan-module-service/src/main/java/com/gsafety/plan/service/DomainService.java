package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Domain;

public interface DomainService extends IBaseService{

    String queryAllDomainName();

    Domain getBySn(String ppType);

}
