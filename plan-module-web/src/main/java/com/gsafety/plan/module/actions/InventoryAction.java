package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Inventory;
import com.gsafety.plan.po.Supply;
import com.gsafety.plan.service.InventoryService;


public class InventoryAction extends ListAction<Inventory> {
	 @Resource
	 private  InventoryService inventoryService;
	 private int id;
	 private String inventoryName;
	 private String inventorySn;      
	 private String inventoryLongitude;   //经度
	 private String inventoryLatitude;    //纬度
     private String inventoryPrincipal;   //负责人	
     private String inventoryPrincipalPhone;  //负责人电话
	 
	 private int page;
	 private int rows;
	 private JSONArray jsonArray = new JSONArray();
     private JSONObject jsonObject = new JSONObject();
     
     
     public PrintWriter out() throws IOException {
 		HttpServletResponse response = ServletActionContext.getResponse();
 		response.setContentType("text/html");
 		response.setContentType("text/plain; charset=utf-8");
 		PrintWriter out = response.getWriter();
 		return out;
 	}
	



   //查询所有Inventory
 	public String queryByPage() throws IOException{
 		
 		String str=inventoryService.getPage(page, rows);
 		
 		out().print(str);
 		out().flush();
 		out().close();
 		return "jsonArray";
 	}
 	//新增资源
    public String save(){
		jsonObject.put("status", "ok");
		Inventory i =new Inventory();
		try{
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		    i.setInventoryLatitude(inventoryLatitude);
		    i.setInventoryLongitude(inventoryLongitude);
		    i.setInventoryName(inventoryName);
		    i.setInventoryPrincipal(inventoryPrincipal);
		    i.setInventoryPrincipalPhone(inventoryPrincipalPhone);
		    i.setInventorySn(uuid);
			inventoryService.save(i);
		}catch(Exception e){
			jsonObject.put("status", "nook");
		}
		return "jsonObject";
	}
 	//删除选定Inventory
    public String delete(){
    	jsonObject.put("status", "ok");
		try{
			System.out.println(id);
			Inventory i = inventoryService.get(Inventory.class,id);
			inventoryService.delete(i);
		}catch(Exception e){
			jsonObject.put("status", "nook");
		}
		return "jsonObject";
	}
  //修改资源点
    public String update(){
    	jsonObject.put("status", "ok");
		try{
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			Inventory i = inventoryService.get(Inventory.class,id);
			i.setInventoryLatitude(inventoryLatitude);
			i.setInventoryLongitude(inventoryLongitude);
			i.setInventoryName(inventoryName);
			i.setInventoryPrincipal(inventoryPrincipal);
			i.setInventoryPrincipalPhone(inventoryPrincipalPhone);
		    i.setInventorySn(uuid);
			inventoryService.update(i);
		}catch(Exception e){
			jsonObject.put("status", "nook");
		}
		return "jsonObject";
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




		public InventoryService getInventoryService() {
			return inventoryService;
		}



		public void setInventoryService(InventoryService inventoryService) {
			this.inventoryService = inventoryService;
		}



		public int getId() {
			return id;
		}



		public void setId(int id) {
			this.id = id;
		}






		public String getInventoryName() {
			return inventoryName;
		}




		public void setInventoryName(String inventoryName) {
			this.inventoryName = inventoryName;
		}




		public String getInventorySn() {
			return inventorySn;
		}




		public void setInventorySn(String inventorySn) {
			this.inventorySn = inventorySn;
		}




		public String getInventoryLongitude() {
			return inventoryLongitude;
		}




		public void setInventoryLongitude(String inventoryLongitude) {
			this.inventoryLongitude = inventoryLongitude;
		}




		public String getInventoryLatitude() {
			return inventoryLatitude;
		}




		public void setInventoryLatitude(String inventoryLatitude) {
			this.inventoryLatitude = inventoryLatitude;
		}




		public String getInventoryPrincipal() {
			return inventoryPrincipal;
		}




		public void setInventoryPrincipal(String inventoryPrincipal) {
			this.inventoryPrincipal = inventoryPrincipal;
		}




		public String getInventoryPrincipalPhone() {
			return inventoryPrincipalPhone;
		}




		public void setInventoryPrincipalPhone(String inventoryPrincipalPhone) {
			this.inventoryPrincipalPhone = inventoryPrincipalPhone;
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
}
