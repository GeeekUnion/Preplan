package com.gsafety.plan.service;



import java.util.List;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.ResourceRecord;



public interface ResourceRecordService extends IBaseService{

	String getPage(int pageNumber, int pageSize);

    List<ResourceRecord> getListByPpsn(Mission misnModel);
    
    String getByReSn(String missionSn,int pageNumber, int pageSize);

    void updateById(ResourceRecord rr);

}
