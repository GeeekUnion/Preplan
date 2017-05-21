package com.gsafety.plan.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.basecode.po.EmsOrg;
import com.gsafety.cloudframework.common.base.dao.IBaseDAO;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.service.DepartmentService;
@Service
public class DepartmentServiceImpl extends BaseServiceImpl implements DepartmentService{
    @Resource(name="baseDAO")
    protected IBaseDAO baseDAO;
    /**
     *根据org id查询 org 
     */
    @Override
    public String getOrg(EmsOrg orgSet) {      
        String sql="select ORG_CODE,ORG_NAME,ORG_AREA_CODE from fw_t_ems_org where ORG_CODE="+"\'"+orgSet.getOrgCode()+"\'";
        Object[] obj= (Object[]) baseDAO.getUniqueBySql(sql);
        JSONObject jo = new JSONObject();
        jo.put("orgCode",obj[0]);
        jo.put("orgName",obj[1]);
        jo.put("orgAreaCode",obj[2]);
        String str=jo.toString();
        return str;
    }

}
