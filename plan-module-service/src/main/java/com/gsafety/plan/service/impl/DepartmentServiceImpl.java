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
     *根据org id查询查询上级 
     */
    @Override
    public String getOrg(EmsOrg orgSet) {   
    	String sql="select ORG_CODE,ORG_NAME,ORG_AREA_CODE from fw_t_ems_org where ORG_CODE="+"\'"+orgSet.getOrgCode()+"\'";
        Object[] obj= (Object[]) baseDAO.getUniqueBySql(sql);//获得原Org
        JSONObject jo = new JSONObject();
        String oldOrgAreaCode=(String) obj[2];
        boolean qiyepd=false;//如果是一级企业
        if(oldOrgAreaCode.length()==4 && "02".equals(oldOrgAreaCode.substring(0, 2))){
        	qiyepd=true;
        }
        if("01".equals(oldOrgAreaCode) || qiyepd){//最高级政府或者一级企业
        	jo.put("orgCode",obj[0]);
            jo.put("orgName",obj[1]);
            jo.put("orgAreaCode",oldOrgAreaCode);           
        }else{
        	int lastIndex=oldOrgAreaCode.length()-2;
        	String newSql="select ORG_CODE,ORG_NAME,ORG_AREA_CODE from fw_t_ems_org where ORG_AREA_CODE="+"\'"+oldOrgAreaCode.substring(0,lastIndex)+"\'";
        	Object[] newObj= (Object[]) baseDAO.getUniqueBySql(newSql);//获得新Org
        	jo.put("orgCode",newObj[0]);
            jo.put("orgName",newObj[1]);
            jo.put("orgAreaCode",newObj[2]);  
        }
        
        
        String str=jo.toString(); 
        return str;
    }
    
    /**
     *根据org id查询查org_area_code
     */
    @Override
    public String getOrgAreaCodeById(String orgCode) {   
    	String sql="select ORG_AREA_CODE from fw_t_ems_org where ORG_CODE="+"\'"+orgCode+"\'";
        String orgAreaCode =(String) baseDAO.getUniqueBySql(sql);
        return orgAreaCode;
    }

}
