package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Event;
import com.gsafety.plan.service.EventService;
@Namespace("/preplan")
public class EventAction extends ListAction<Event>{

	//注入service
	@Resource
	private EventService eventService;
	
	private int id;
	private String eventSn;
	private String eventName;
	private Timestamp eventOccurTime;
	private String eventOccurPlace;
	
	private int page;
	private int rows;
	
	private JSONObject jsonObject = new JSONObject();
	
	
	
	public PrintWriter out() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		return out;
	}
	//启动预案页面，查询事件属性
	public String queryByPage() throws IOException{
		String str=eventService.queryEvent(page, rows);
		out().print(str);
		out().flush();
		out().close();
		return "jsonArray";
	}
	//增加event，未完成
	public String save(){
		jsonObject.put("status", "ok");
		Event event = new Event();
		try{
			event.setEventName(eventName);
			event.setEventOccurPlace(eventOccurPlace);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			event.setEventOccurTime(Timestamp.valueOf(sdf.format(System.currentTimeMillis())));
			String eventSn=new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(System.currentTimeMillis() );
			event.setEventSn(eventSn);
			eventService.save(event);
		}catch(Exception e){
			jsonObject.put("status", "nook");
		}
		return "jsonObject";
	}
	
	
	
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEventSn() {
		return eventSn;
	}
	public void setEventSn(String eventSn) {
		this.eventSn = eventSn;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public Timestamp getEventOccurTime() {
		return eventOccurTime;
	}
	public void setEventOccurTime(Timestamp eventOccurTime) {
		this.eventOccurTime = eventOccurTime;
	}
	public String getEventOccurPlace() {
		return eventOccurPlace;
	}
	public void setEventOccurPlace(String eventOccurPlace) {
		this.eventOccurPlace = eventOccurPlace;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public JSONObject getJsonObject() {
		return jsonObject;
	}
	public void setJsonObject(JSONObject jsonObject) {
		this.jsonObject = jsonObject;
	}
	
	
	
	
	
}
