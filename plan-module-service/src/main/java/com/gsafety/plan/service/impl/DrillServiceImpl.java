package com.gsafety.plan.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.dao.IBaseDAO;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Drill;
import com.gsafety.plan.po.Event;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.DrillService;
import com.gsafety.plan.service.InventoryService;

@Service
public class DrillServiceImpl extends BaseServiceImpl implements DrillService {
	@Resource(name="baseDAO")
	 protected IBaseDAO baseDAO;

	public IBaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(IBaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}

	@Override
	public String queryDrill(String areaOrgCode,int pageNumber,int pageSize) {
		String str="";
		JSONArray array = new JSONArray();
		   
		    String hql="from Drill d where d.areaOrgCode like '"+areaOrgCode+"%'";
		    System.out.println(hql);
		    PageResult pResult = baseDAO.getPageByHql(hql,pageNumber,pageSize,Drill.class);
			
			List<Drill> List=(List<Drill>) pResult.getList();
			for(Drill d:List){
			JSONObject jo = new JSONObject();
			//没那么简单
			jo.put("id", d.getId());
			jo.put("drillSn", d.getDrillSn());
			jo.put("drillTime", d.getDrillTime().toString());
			jo.put("drillContent", d.getDrillContent());
			jo.put("drillNumOfParticipants", d.getDrillNumOfParticipants());
			jo.put("drillPreplanName", d.getPreplan().getPreplanName());
			jo.put("orgName", d.getDrillDepartment());
				array.add(jo);
			}	
		str="{\"recordsTotal\":"+pResult.getPager().getRecordCount()+",\"data\":"+array.toString()+"}"; 
        System.out.println(str);    
        return str;
	}

	@Override
	public JSONObject queryAreaCodeByOrgCode(String orgCode) {
		 String sql="select ORG_AREA_CODE,ORG_NAME from fw_t_ems_org where ORG_CODE="+"\'"+orgCode+"\'";
		Object[] ob =(Object[]) baseDAO.getUniqueBySql(sql);
		JSONObject jo = new JSONObject();
		 jo.put("areaOrgCode", ob[0]);
		 jo.put("orgName", ob[1]);
		 return jo;
	}
   //
	@Override
	public JSONArray queryPlan(String orgCode) {
		 String hql="from Preplan p where p.responDept like '"+orgCode+"%'";
		 System.out.println(hql);
		ArrayList <Preplan> List= (ArrayList<Preplan>) baseDAO.getListBySql(hql, Preplan.class);
		JSONArray array =new JSONArray();
		for(Preplan d:List){
			JSONObject jo = new JSONObject();
			jo.put("preplanName", d.getPreplanName());
			jo.put("preplanSn", d.getPreplanSn());
				array.add(jo);
		}	
		 return array;
	}
	
}
