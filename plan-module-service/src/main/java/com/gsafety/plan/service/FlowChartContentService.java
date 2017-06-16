package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.FlowChartContent;
import com.gsafety.plan.po.Preplan;

public interface FlowChartContentService extends IBaseService{

    FlowChartContent getUniqueByPreplanSn(Preplan p);
    void deleteFLContentByPlanSn(Preplan p);
}
