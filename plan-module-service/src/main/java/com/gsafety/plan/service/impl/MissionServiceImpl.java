package com.gsafety.plan.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.dao.IBaseDAO;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Domain;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.MissionService;
@Service
public class MissionServiceImpl extends BaseServiceImpl implements MissionService{
	@Resource(name="baseDAO")
	 protected IBaseDAO baseDAO;
	
	public IBaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(IBaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}
	
	@Override
	public String getPage(int pageNumber, int pageSize) {
		String hql=" from Preplan p";
		
		PageResult pResult = baseDAO.getPageByHql(hql,pageNumber,pageSize,Preplan.class);
		List<Preplan> pList= (List<Preplan>)  pResult.getList();
		JSONArray array = new JSONArray();
		for(Preplan p:pList){
			JSONObject jo = new JSONObject();
			jo.put("preplanSn", p.getPreplanSn());
			jo.put("preplanName", p.getPreplanName());
			
			Timestamp timestamp = p.getPreplanTime();
			if (timestamp != null) {
				String timestamp2 = timestamp.toString();
				jo.put("preplanTime", timestamp2);
			} else {
				jo.put("preplanTime", "");
			}
			array.add(jo);
		}
		String str="{\"total\":"+pResult.getPager().getRecordCount()+",\"rows\":"+array.toString()+"}";
		
      
        return str;
	}

}
