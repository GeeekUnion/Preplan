package com.gsafety.plan.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Domain;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.PreplanService;
@Service
public class PreplanServiceImpl extends BaseServiceImpl implements PreplanService{

    @Override
    public String getPageList(int page, int rows) {
        // TODO Auto-generated method stub
        String hql = "from Preplan p";
        PageResult pResult = baseDAO.getPageByHql(hql,page,rows,Preplan.class);
        List<Preplan> pList =(List<Preplan>) pResult.getList();
        JSONArray array = new JSONArray();
        for(Preplan p : pList) {
            JSONObject jo = new JSONObject();
            jo.put("id", p.getId());
            jo.put("preplanName",p.getPreplanName());
            jo.put("responDept",p.getResponDept());
            jo.put("preplanSn",p.getPreplanSn());
            
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

}
