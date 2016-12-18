package com.gsafety.plan.service;

import java.util.List;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Preplan;

public interface MissionService extends IBaseService{

	String getPage(int pageNumber, int pageSize);

	String getPageMis(int pageNumber, int pageSize);

    List<Mission> getListByPpsn(Preplan ppModel);
}
