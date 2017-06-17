package com.gsafety.plan.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.PreplanLog;
import com.gsafety.plan.service.PreplanLogService;
@Service
public class PreplanLogServiceImpl extends BaseServiceImpl implements PreplanLogService{
    /**
     * 根据预案Sn查询预案编制日志列表
     * @param preplanSn
     * @return jsonArray
     * */
    @Override
    public JSONArray queryListByPreplanSn(Preplan preplanSn) {
        
        Map<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("preplanSn", preplanSn);
        String hql="from PreplanLog p where p.preplanSn=:preplanSn";
        List<PreplanLog>plList=baseDAO.getListByHql(hql, hashMap, PreplanLog.class);
        JSONArray  plJsArray=new JSONArray();
        for(PreplanLog p: plList) {
            JSONObject jo=new JSONObject();
            jo.put("preplanLogTime", p.getPreplanLogTime());
            jo.put("orgCode", p.getOrgCode());
            plJsArray.add(jo);
        }
        return plJsArray;
    }

}
