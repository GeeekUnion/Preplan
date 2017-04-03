package com.gsafety.plan.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Module;
import com.gsafety.plan.service.ModuleService;
@Service
public class ModuleServiceImpl extends BaseServiceImpl implements ModuleService{

    @Override
    public JSONObject queryModulePagerByPpsn(int page, int rows, String preplanSn) {
        // TODO Auto-generated method stub       
        PageResult mResult = new PageResult();
        if(preplanSn==null || preplanSn.length()<=0 ) {           
            String hql = "from Module m where m.moduleCheck = true";
            mResult = baseDAO.getPageByHql(hql,page,rows,Module.class); 
        }
        else {
            Map<String, Object> hashMap = new HashMap<String, Object>();
            String hql = "from Module m where m.preplanSnM.preplanSn=:preplanSn";
            hashMap.put("preplanSn",preplanSn);
            mResult = baseDAO.getPageByHql(hql,page,rows,hashMap,Module.class); 
        }
              
        List<Module> mList= (List<Module>) mResult.getList();
        JSONArray marray = new JSONArray();
        for(Module md: mList) {
            JSONObject jo = new JSONObject();
            jo.put("id",md.getId());
            jo.put("title",md.getTitle());
            jo.put("content", md.getContent());
            jo.put("moduleSn", md.getModuleSn());
            jo.put("order",md.getOrder());
            if(md.getPreplanSnM() ==null) {
                
            }
            else {
                jo.put("modulePreplanSn",md.getPreplanSnM().getPreplanSn()); 
            }           
            marray.add(jo);
        }
        JSONObject joMax = new JSONObject();
        joMax.put("total", mResult.getPager().getRecordCount());
        joMax.put("rows",marray);
        return joMax;
    }

}
