package com.gsafety.plan.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.basecode.po.EmsOrg;
import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Domain;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.PreplanService;
import com.opensymphony.xwork2.ActionContext;

import freemarker.template.Template;
@Service
public class PreplanServiceImpl extends BaseServiceImpl implements PreplanService{

    @Override
    public String getPageList(int page, int rows) {
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
        String str="{\"recordsTotal\":"+pResult.getPager().getRecordCount()+",\"data\":"+array.toString()+"}";
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

    @Override
    public String getPageListByUser(int page, int rows, Person ps) {  
        Map<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("responDept",ps.getOrgCode());
        //hashMap.put("preplanStatus", "已完成");
        //String sql="SELECT * from pre_preplan AS p WHERE p.ems_org_code= "+"\'"+ps.getOrgCode()+"\'";
        String hql = "from Preplan p where p.responDept=:responDept";
        PageResult pResult = baseDAO.getPageByHql(hql,page,rows,hashMap,Preplan.class);
        List<Preplan> pList =(List<Preplan>) pResult.getList();
        String str="";
        if(pList.size()>0) {
            Cnds cndsOrg = Cnds.me(EmsOrg.class);
            WhereSet setOrg = ConditionBuilder.whereSet(ConditionBuilder.eq("orgCode", ps.getOrgCode()));
            cndsOrg.and(setOrg);
            EmsOrg org =baseDAO.getUniqueByCnds(cndsOrg);
            JSONArray array = new JSONArray();


            for(Preplan p : pList) {
                JSONObject jo = new JSONObject();
                jo.put("id",p.getId());
                jo.put("preplanUid",p.getPreplanUID());
                jo.put("preplanName",p.getPreplanName());  
                jo.put("responDept",org.getOrgName()); 
                jo.put("preplanSn",p.getPreplanSn()); 
                jo.put("status",p.getPreplanStatus()); 
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
            str="{\"recordsTotal\":"+pResult.getPager().getRecordCount()+",\"data\":"+array.toString()+"}";
          
            
            
        }else {
            str="{\"recordsTotal\":"+0+",\"data\":"+null+"}";
        }
        System.out.println(str);    
        return str;
        
    }
    
    /**
     *TODO(根据登录的用户查询预案审核列表)
     *@param Person(emsUser)
     **/
	@Override
	public String queryPreplanReviewListByUser(Person ps) {
		 Map<String, Object> hashMap = new HashMap<String, Object>();
	        hashMap.put("reviewOrg",ps.getOrgCode());	      
	        String hql = "from Preplan p where p.reviewOrg=:reviewOrg";
	        List<Preplan> pList = baseDAO.getListByHql(hql,hashMap,Preplan.class);
	        String str="";
	        if(pList.size()>0) {
	            Cnds cndsOrg = Cnds.me(EmsOrg.class);
	            WhereSet setOrg = ConditionBuilder.whereSet(ConditionBuilder.eq("orgCode", ps.getOrgCode()));
	            cndsOrg.and(setOrg);
	            EmsOrg org =baseDAO.getUniqueByCnds(cndsOrg);
	            JSONArray array = new JSONArray();

                for(Preplan p : pList) {
                    JSONObject jo = new JSONObject();
                    jo.put("id",p.getId());
                    jo.put("preplanUid",p.getPreplanUID());
                    jo.put("preplanName",p.getPreplanName());  
                    jo.put("responDept",org.getOrgName()); 
                    jo.put("preplanSn",p.getPreplanSn()); 
                    jo.put("status",p.getPreplanStatus()); 
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
                str="{\"recordsTotal\":"+pList.size()+",\"data\":"+array.toString()+"}";

	            
	              
	        }else {
	            str="{\"recordsTotal\":"+0+",\"data\":"+null+"}";
	        }
	        System.out.println(str); 
	        return str;
	}

	@Override
	public JSONObject queryReviewsMsg(String orgCode) {
		Cnds cnds=Cnds.me(Preplan.class);
		WhereSet set = ConditionBuilder.whereSet(ConditionBuilder.eq("reviewOrg", orgCode));
		set.and(ConditionBuilder.eq("preplanStatus", "待审核"));
		cnds.and(set);
		List<Preplan> pList=baseDAO.getListByCnds(cnds);
		JSONObject myJo=new JSONObject();
		JSONArray jsonArray=new JSONArray();
		if(pList.size()>0){
			for(Preplan p :pList){
				JSONObject jo=new JSONObject();
				jo.put("preplanSn", p.getPreplanSn());
				jo.put("preplanName", p.getPreplanName());
				jsonArray.add(jo);
			}
			myJo.put("size",pList.size());
			myJo.put("preplanList", jsonArray);
		}else{
			myJo.put("size", 0);
		}
		
		return myJo;
	}

}
