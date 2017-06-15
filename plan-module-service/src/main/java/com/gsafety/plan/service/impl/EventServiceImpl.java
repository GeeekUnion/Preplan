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
import com.gsafety.plan.po.Event;
import com.gsafety.plan.po.Inventory;
import com.gsafety.plan.service.EventService;
@Service
public class EventServiceImpl extends BaseServiceImpl implements EventService{
	@Resource(name="baseDAO")
	 protected IBaseDAO baseDAO;

	public IBaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(IBaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}
	
	//查询事件
	public String queryEvent(int pageNumber,int pageSize){
		String str="";
		String hql="from Event e";
		PageResult pResult = baseDAO.getPageByHql(hql,pageNumber,pageSize,Event.class);
		@SuppressWarnings("unchecked")
		List<Event> eList=(List<Event>) pResult.getList();
		JSONArray array =new JSONArray();
		for(Event e :eList){
			JSONObject jo =new JSONObject();
			jo.put("id", e.getId());
			jo.put("eventSn", e.getEventSn());
			jo.put("eventName", e.getEventName());
			Timestamp timestamp=e.getEventOccurTime();
			if(timestamp!=null){
				String timestamp2 = timestamp.toString();
			jo.put("eventOccurTime", timestamp2);
			}else{
				jo.put("eventOccurTime", "");
			}
			jo.put("longitude", e.getLongitude());
			jo.put("latitude", e.getLatitude());
			jo.put("eventOccurPlace", e.getEventOccurPlace());
			array.add(jo);
		}
		str="{\"recordsTotal\":"+pResult.getPager().getRecordCount()+",\"data\":"+array.toString()+"}"; 
        return str;
	}

	@Override
	public JSONArray queryAllEvent() {
		 String hql="from Event e";
		 List<Event> sList= (List<Event>) baseDAO.getListByHql(hql);
		 JSONArray array = new JSONArray();
		 for(Event p:sList){
			 JSONObject jo = new JSONObject();
			    jo.put("id", p.getId());
			    jo.put("eventName", p.getEventName());
			    jo.put("eventOccurPlace", p.getEventOccurPlace());
			    jo.put("eventOccurTime", p.getEventOccurTime());
			    jo.put("eventSn", p.getEventSn());
			    jo.put("latitude", p.getLatitude());
			    jo.put("longitude", p.getLongitude());
					array.add(jo);
		 }
	        return array;
	}
	
	
	
	
}
