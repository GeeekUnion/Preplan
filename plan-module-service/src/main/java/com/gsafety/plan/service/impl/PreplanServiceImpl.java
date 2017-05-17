package com.gsafety.plan.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Domain;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.PreplanService;
import com.opensymphony.xwork2.ActionContext;

import freemarker.template.Template;
@Service
public class PreplanServiceImpl extends BaseServiceImpl implements PreplanService{

    @Override
    public String getPageList(int page, int rows) {
        // TODO Auto-generated method stub
        String hql = "from Preplan p";
        PageResult pResult = baseDAO.getPageByHql(hql,page,rows,Preplan.class);
        List<Preplan> pList =(List<Preplan>) pResult.getList();
        ActionContext.getContext().put("planList",pList);//预案列表
        JSONArray array = new JSONArray();
        for(Preplan p : pList) {
            JSONObject jo = new JSONObject();
            jo.put("id",p.getId());
            jo.put("preplanUid",p.getPreplanUID());
            jo.put("preplanName",p.getPreplanName());  
            jo.put("responDept",p.getResponDept()); 
            jo.put("preplanSn",p.getPreplanSn());                                                    
            if(p.getPreplanTime() != null) {
                jo.put("preplanTime",p.getPreplanTime().toString().split(" ")[0]); 
            }
            else {
                jo.put("preplanTime",""); 
            }
            jo.put("preplanUID",p.getPreplanUID());
            jo.put("preplanDesc",p.getPreplanDesc());
            
            //获得预案类型
            if(p.getDomain() != null) {
                Set<Domain> d=p.getDomain();
                Iterator<Domain> dModel = d.iterator();
                while(dModel.hasNext()){
                    Domain dmSingle =dModel.next();
                    jo.put("preplanType",dmSingle.getDomainName());
                }
            } 
            array.add(jo);
        }
        String str="{\"total\":"+pResult.getPager().getRecordCount()+",\"rows\":"+array.toString()+"}";
        System.out.println(str);
        return str;
    }

    @Override
    public void updateById(Preplan ppModel,String pd) {
        // TODO Auto-generated method stub
        
        if(pd==null) {
            Map<String, Object> hashMap = new HashMap<String, Object>();
            String hql = "update Preplan p set p.preplanName=:preplanName,p.preplanDesc=:preplanDesc,p.responDept=:responDept where p.id=:id";            
            hashMap.put("preplanName",ppModel.getPreplanName());
            hashMap.put("preplanDesc",ppModel.getPreplanDesc());
            hashMap.put("responDept",ppModel.getResponDept());
            hashMap.put("id",ppModel.getId());
            baseDAO.updateByHql(hql,hashMap);
        }
        else {
            Map<String, Object> hashMap = new HashMap<String, Object>();
            String hql = "update Preplan p set p.preplanName=:preplanName,p.preplanDesc=:preplanDesc,p.responDept=:responDept,p.preplanUID=:preplanUID where p.id=:id";            
            hashMap.put("preplanName",ppModel.getPreplanName());
            hashMap.put("preplanDesc",ppModel.getPreplanDesc());
            hashMap.put("responDept",ppModel.getResponDept());
            hashMap.put("preplanUID",ppModel.getPreplanUID());
            hashMap.put("id",ppModel.getId());
            baseDAO.updateByHql(hql,hashMap);
        }
       
    }

    @Override
    public Preplan getByPpSn(String ppSn) {
        // TODO Auto-generated method stub
        Cnds cnds1 = Cnds.me(Preplan.class);
        WhereSet set = ConditionBuilder.whereSet(ConditionBuilder.eq("preplanSn", ppSn));
        cnds1.and(set);      
        return baseDAO.getUniqueByCnds(cnds1);
    }

}
