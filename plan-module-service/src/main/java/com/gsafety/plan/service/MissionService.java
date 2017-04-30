package com.gsafety.plan.service;

import java.util.List;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Preplan;

public interface MissionService extends IBaseService{

	

	String getPageMis(int pageNumber, int pageSize);

    List<Mission> getListByPpsn(Preplan ppModel);

    void updateById(Mission m);
    
    public Mission getByMissionSn(String missionSn);
    
    String getPage(int pageNumber, int pageSize);
}
