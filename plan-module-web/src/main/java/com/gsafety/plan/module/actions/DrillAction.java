package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.interceptor.SessionAware;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Drill;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.DrillService;
import com.gsafety.plan.service.PreplanService;
@Namespace("/preplan")
public class DrillAction extends ListAction<Drill> implements SessionAware{
	 @Resource
	 private DrillService drillService;
	 @Resource
	 private PreplanService preplanService;
	 private JSONArray jsonArray = new JSONArray();
     private JSONObject jsonObject = new JSONObject();
   //用于封装会话session
     protected Map<String, Object> session;  
     private int page;
     private int rows;
     private int id;
     private String drillSn;
  	 private Timestamp drillTime;
 	 private int drillNumOfParticipants;
     private String areaOrgCode;               //预案的地图编号，方便对应地区查询
     private String drillContent;
 	 private Preplan preplan;
 	 private String drillDepartment;                     //查询部门
     
     private String preplanSn;
     
     public PrintWriter out() throws IOException {
  		HttpServletResponse response = ServletActionContext.getResponse();
  		response.setContentType("text/html");
  		response.setContentType("text/plain; charset=utf-8");
  		PrintWriter out = response.getWriter();
  		return out;
  	}
     //根据用户部门，查询其部门及以下部门的预案演练过程  ,未完成!
     public String queryDrillPage() throws IOException{
    	 String str="";
    	 String orgCode=session.get("preplanOrgCode").toString();
    	 JSONObject jo=drillService.queryAreaCodeByOrgCode(orgCode);
    	 String areaOrgCode =(String) jo.get("areaOrgCode");
    	
    	 
    	 System.out.println(areaOrgCode);
    	 
    	 if(null != areaOrgCode && areaOrgCode.length()>0) {
    		str=drillService.queryDrill(areaOrgCode,page, rows); 
    		out().print(str);
      		out().flush();
      		out().close();
    		return "jsonArray";
    	 }
    	 str=drillService.queryDrill(areaOrgCode,page, rows); 
	    	out().print(str);
	  		out().flush();
	  		out().close();
	    	return "jsonArray";
     }
     public String save(){
    	 jsonObject.put("status", "ok");
    	 Drill d=new Drill();
    	 String uuid = UUID.randomUUID().toString().replaceAll("-", "");
    	 String orgCode=session.get("preplanOrgCode").toString();
    	 JSONObject jo=drillService.queryAreaCodeByOrgCode(orgCode);
    	 String areaOrgCode =(String) jo.get("areaOrgCode");
    	 String orgName =(String) jo.get("orgName");
    	 try {
    		d.setDrillSn(uuid); 
    		d.setAreaOrgCode(areaOrgCode);
    		d.setDrillDepartment(orgName);
    		d.setDrillContent(drillContent);
    		d.setDrillNumOfParticipants(drillNumOfParticipants);
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		d.setDrillTime(Timestamp.valueOf(sdf.format(System.currentTimeMillis()))); 
    	    preplan=preplanService.getByPpSn(preplanSn);
    		d.setPreplan(preplan);
    		drillService.save(d);
		} catch (Exception e) {
			jsonObject.put("status", "nook");
		}
    	  return "jsonObject";
     }
     //获得当前部门可查预案
     public String queryPreplanList(){
    	 String orgCode=session.get("preplanOrgCode").toString();
         if(null != orgCode && orgCode.length()>0) {
            jsonArray=drillService.queryPlan(orgCode);
                     } 
         return "jsonArray";
     }
     
     
     
	public JSONArray getJsonArray() {
		return jsonArray;
	}
	public void setJsonArray(JSONArray jsonArray) {
		this.jsonArray = jsonArray;
	}
	public JSONObject getJsonObject() {
		return jsonObject;
	}
	public void setJsonObject(JSONObject jsonObject) {
		this.jsonObject = jsonObject;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
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
	public DrillService getDrillService() {
		return drillService;
	}
	public void setDrillService(DrillService drillService) {
		this.drillService = drillService;
	}
	public int getDrillNumOfParticipants() {
		return drillNumOfParticipants;
	}
	public void setDrillNumOfParticipants(int drillNumOfParticipants) {
		this.drillNumOfParticipants = drillNumOfParticipants;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDrillSn() {
		return drillSn;
	}
	public void setDrillSn(String drillSn) {
		this.drillSn = drillSn;
	}
	public Timestamp getDrillTime() {
		return drillTime;
	}
	public void setDrillTime(Timestamp drillTime) {
		this.drillTime = drillTime;
	}
	public String getAreaOrgCode() {
		return areaOrgCode;
	}
	public void setAreaOrgCode(String areaOrgCode) {
		this.areaOrgCode = areaOrgCode;
	}
	public String getDrillContent() {
		return drillContent;
	}
	public void setDrillContent(String drillContent) {
		this.drillContent = drillContent;
	}
	public Preplan getPreplan() {
		return preplan;
	}
	public void setPreplan(Preplan preplan) {
		this.preplan = preplan;
	}
	public String getDrillDepartment() {
		return drillDepartment;
	}
	public void setDrillDepartment(String drillDepartment) {
		this.drillDepartment = drillDepartment;
	}
	public PreplanService getPreplanService() {
		return preplanService;
	}
	public void setPreplanService(PreplanService preplanService) {
		this.preplanService = preplanService;
	}
	public String getPreplanSn() {
		return preplanSn;
	}
	public void setPreplanSn(String preplanSn) {
		this.preplanSn = preplanSn;
	}
	
     
}
