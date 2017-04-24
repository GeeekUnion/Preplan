package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Person;

public interface PersonService extends IBaseService {

	Person getPersonByUname(String username, String password);

}
