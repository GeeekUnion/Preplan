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
	public String queryDrill(String orgCode,int pageNumber,int pageSize) {
		String str="";
		JSONArray array = new JSONArray();
		    String hql="";
		    PageResult pResult = baseDAO.getPageByHql(hql,pageNumber,pageSize,Event.class);
			@SuppressWarnings("unchecked")
			List<Drill> List=(List<Drill>) pResult.getList();
			for(Drill d:List){
			JSONObject jo = new JSONObject();
			//没那么简单
			jo.put("id", d.getId());
			jo.put("drillSn", d.getDrillSn());
			jo.put("drillTime", d.getDrillTime());
			jo.put("drillContent", d.getDrillContent());
			jo.put("drillNumOfParticipants", d.getDrillNumOfParticipants());
			jo.put("drillPreplanName", d.getPreplan());
			
					array.add(jo);
			}	
		str="{\"recordsTotal\":"+pResult.getPager().getRecordCount()+",\"data\":"+array.toString()+"}"; 
        System.out.println(str);    
        return str;
	}
}
