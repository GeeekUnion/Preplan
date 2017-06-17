package com.gsafety.plan.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.FlowChartContent;
import com.gsafety.plan.po.Picture;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.FlowChartContentService;
@Service
public class FlowChartContentServiceImpl extends BaseServiceImpl implements FlowChartContentService{

    @Override
    public FlowChartContent getUniqueByPreplanSn(Preplan p) {
        Map<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("preplanSn", p);
        String hql=" from FlowChartContent f where f.preplanSn=:preplanSn";
        FlowChartContent f=baseDAO.getUniqueByHql(hql, hashMap,FlowChartContent.class);
        return f;
    } 

    @Override
    public void deleteFLContentByPlanSn(Preplan p) {
        Map<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("preplanSn", p);
        String hql="delete from FlowChartContent f where f.preplanSn=:preplanSn";
        baseDAO.deleteByHql(hql, hashMap);    
        
    }

}
