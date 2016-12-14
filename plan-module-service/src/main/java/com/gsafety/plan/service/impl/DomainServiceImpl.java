package com.gsafety.plan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.base.dao.IBaseDAO;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Domain;
import com.gsafety.plan.po.Privilege;
import com.gsafety.plan.service.DomainService;
@Service
public class DomainServiceImpl extends BaseServiceImpl implements DomainService{
    @Resource(name="baseDAO")
    protected IBaseDAO baseDAO;
    public IBaseDAO getBaseDAO() {
        return baseDAO;
    }
    public void setBaseDAO(IBaseDAO baseDAO) {
        this.baseDAO = baseDAO;
    }
    @Override
    public String queryAllDomainName() {
        // TODO Auto-generated method stub
        String hql = " from Domain d";
        List<Domain> dResult = baseDAO.getListByHql(hql,Domain.class);
        JSONArray array = new JSONArray();
        for(Domain d :dResult) {
            JSONObject jo = new JSONObject();
            jo.put("id", d.getId());
            jo.put("domain_sn", d.getDomainSn());
            jo.put("domain_name", d.getDomainName());
            jo.put("domain_type", d.getDomainType());
            jo.put("domain_desc", d.getDomainDesc());
            array.add(jo);
        }
        String str=array.toString();
        System.out.println(str);
        return str;
       
    }

}
