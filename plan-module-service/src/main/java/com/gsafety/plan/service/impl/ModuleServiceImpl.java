package com.gsafety.plan.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Module;
import com.gsafety.plan.service.ModuleService;
@Service
public class ModuleServiceImpl extends BaseServiceImpl implements ModuleService{

    @Override
    public JSONObject queryModulePagerByPpsn(int page, int rows, String preplanSn) {      
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
    /*@name 根据预案SN返回模块列表不带分页
     * 
     * */
    @Override
    public List<Module> getListByPpsn(String ppSn) {
        // TODO Auto-generated method stub
        Map<String, Object> hashMap = new HashMap<String, Object>();
        String hql = "from Module m where m.preplanSnM.preplanSn=:preplanSn";
        hashMap.put("preplanSn",ppSn);
        return baseDAO.getListByHql(hql,hashMap,Module.class);
    }
    @Override
    public Module getUniqueByPpsnOrder(String preplanSn, String order) {
        Map<String, Object> hashMap = new HashMap<String, Object>();
        String hql = "from Module m where m.preplanSnM.preplanSn=:preplanSn and m.order=:order";
        hashMap.put("preplanSn",preplanSn);
        hashMap.put("order",order);  
        Module md=baseDAO.getUniqueByHql(hql,hashMap,Module.class);
        return md;
    }
    
    /*@name 根据预案SN。type返回模块列表不带分页
     * 
     * */
	@Override
	public JSONObject queryListByPpsnType(String preplanSn, String pType) {		
		JSONObject joMax = new JSONObject();
		if(preplanSn==null || preplanSn.length()<=0 ) {           
	        joMax.put("total", 0);
	        joMax.put("rows","[]");
        }
        else {
            Map<String, Object> hashMap = new HashMap<String, Object>();
            String hql = "from Module m where m.preplanSnM.preplanSn=:preplanSn and m.type=:type";
            hashMap.put("preplanSn",preplanSn);
            hashMap.put("type",pType);
            List<Module> mList= baseDAO.getListByHql(hql,hashMap,Module.class); 
            int countSize=mList.size();            
            JSONArray marray = new JSONArray();
            if(countSize>0){
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
            }                        
            joMax.put("total", countSize);
            joMax.put("rows",marray);
        }
        

        return joMax;
	}

}
