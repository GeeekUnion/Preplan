package com.gsafety.plan.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.dao.IBaseDAO;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Privilege;
import com.gsafety.plan.service.PrivilegeService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class PrivilegeServiceImpl extends BaseServiceImpl implements PrivilegeService{
	@Resource(name="baseDAO")
	 protected IBaseDAO baseDAO;
	
	public IBaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(IBaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}
	
	//根据HQL语句查询列表
	@Override
	public List<Privilege> query() {
		// TODO Auto-generated method stub
		
		IBaseDAO bDao =super.baseDAO;

	    String hql = " from Privilege p ";
	    List<Privilege> pList = baseDAO.getListByHql(hql, Privilege.class);
		
		System.out.println("service已执行");
		return pList;
		
	}


    @Override
    public String getPageBySql(int pageNumber, int pageSize) {
        // TODO Auto-generated method stub
        String hql = "from Privilege p";
        PageResult pResult = baseDAO.getPageByHql(hql,pageNumber,pageSize,Privilege.class);
        List<Privilege> pList =(List<Privilege>) pResult.getList();
        JSONArray array = new JSONArray();
        for(Privilege p : pList) {
            JSONObject jo = new JSONObject();
            jo.put("id", p.getId());
            jo.put("PrivilegeOperation", p.getPrivilegeOperation());
            jo.put("RecordStatus", p.getRecordStatus());
            jo.put("ParentID", p.getParentID());
            array.add(jo);
        }
        String str="{\"total\":"+pResult.getPager().getRecordCount()+",\"rows\":"+array.toString()+"}";
        System.out.println(str);
        return str;
    }
	
	
}
