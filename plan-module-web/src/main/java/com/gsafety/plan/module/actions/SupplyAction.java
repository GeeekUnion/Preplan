package com.gsafety.plan.module.actions;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;













import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Event;
import com.gsafety.plan.po.Supply;
import com.gsafety.plan.service.SupplyService;
/**
 * @author Administrator
 *
 */
@Namespace("/preplan")
public class SupplyAction extends ListAction<Supply> {
     @Resource
     private SupplyService supplyService;
     private int id;
     private String supplyName;
     private String supplySn;
     private int supplyNumber;
     private String supplyUnit;
     private String supplyLatitude;
     private String supplyLongitude;
     private String supplyPrincipal;
     private String supplyPrincipalPhone;
     private JSONArray jsonArray = new JSONArray();
     private JSONObject jsonObject = new JSONObject();
	
	//查询所有的supply
    public String queryAllSupply() throws IOException{
    	String str=supplyService.getAllSupply();
		out().print(str);
		out().flush();
		out().close();
		return "jsonArray";
    }
    //地图里，查询所有supply
    public String querySupply(){
        jsonArray =supplyService.getMapSupply();
		return "jsonArray";
    }
	//地图里，新增资源
    public String save(){
		jsonObject.put("status", "ok");
		Supply s = new Supply();
		try{
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			s.setSupplyLatitude(supplyLatitude);
			s.setSupplyLongitude(supplyLongitude);
			s.setSupplyName(supplyName);
			s.setSupplyNumber(supplyNumber);
			s.setSupplyPrincipal(supplyPrincipal);
			s.setSupplyPrincipalPhone(supplyPrincipalPhone);
			s.setSupplySn(uuid);
			s.setSupplyUnit(supplyUnit);
			supplyService.save(s);
		}catch(Exception e){
			jsonObject.put("status", "nook");
		}
		return "jsonObject";
	}
    //地图里，删除某个资源点
    public String delete(){
    	jsonObject.put("status", "ok");
		try{
			System.out.println(id);
			Supply s = supplyService.get(Supply.class,id);
			supplyService.delete(s);
		}catch(Exception e){
			jsonObject.put("status", "nook");
		}
		return "jsonObject";
	}
    
    
    
    
    
    
    
    public JSONArray getJsonArray() {
		return jsonArray;
	}
	public void setJsonArray(JSONArray jsonArray) {
		this.jsonArray = jsonArray;
	}
	public SupplyService getSupplyService() {
		return supplyService;
	}
	public void setSupplyService(SupplyService supplyService) {
		this.supplyService = supplyService;
	}
	public String getSupplyName() {
		return supplyName;
	}
	public void setSupplyName(String supplyName) {
		this.supplyName = supplyName;
	}
	public String getSupplySn() {
		return supplySn;
	}
	public void setSupplySn(String supplySn) {
		this.supplySn = supplySn;
	}
	public PrintWriter out() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		return out;
	}
	public JSONObject getJsonObject() {
		return jsonObject;
	}
	public void setJsonObject(JSONObject jsonObject) {
		this.jsonObject = jsonObject;
	}
	
	public int getSupplyNumber() {
		return supplyNumber;
	}
	public void setSupplyNumber(int supplyNumber) {
		this.supplyNumber = supplyNumber;
	}
	public String getSupplyLatitude() {
		return supplyLatitude;
	}
	public void setSupplyLatitude(String supplyLatitude) {
		this.supplyLatitude = supplyLatitude;
	}
	public String getSupplyLongitude() {
		return supplyLongitude;
	}
	public void setSupplyLongitude(String supplyLongitude) {
		this.supplyLongitude = supplyLongitude;
	}
	public String getSupplyPrincipal() {
		return supplyPrincipal;
	}
	public void setSupplyPrincipal(String supplyPrincipal) {
		this.supplyPrincipal = supplyPrincipal;
	}
	public String getSupplyPrincipalPhone() {
		return supplyPrincipalPhone;
	}
	public void setSupplyPrincipalPhone(String supplyPrincipalPhone) {
		this.supplyPrincipalPhone = supplyPrincipalPhone;
	}
	public String getSupplyUnit() {
		return supplyUnit;
	}
	public void setSupplyUnit(String supplyUnit) {
		this.supplyUnit = supplyUnit;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
}