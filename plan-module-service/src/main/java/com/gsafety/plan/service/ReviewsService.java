package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Reviews;

public interface ReviewsService extends IBaseService{

	Reviews getUniqueByPreplanSn(String preplanSn);

}
