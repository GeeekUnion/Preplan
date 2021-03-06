package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.*;
import com.gsafety.plan.service.EmergencyResponseTeamService;
import com.gsafety.plan.service.HazardService;
import com.gsafety.plan.service.InventoryService;
import com.gsafety.plan.service.ProtectionObjectService;

@Namespace("/preplan")
public class InventoryAction extends ListAction<Inventory> {
	 @Resource
	 private  InventoryService inventoryService;
	 @Resource
	 private HazardService hazardService;
	 @Resource
	 private EmergencyResponseTeamService emergencyResponseTeamService;
	 @Resource
	 private ProtectionObjectService protectionObjectService;
	 
	 private int id;
	 private String code; //用来转化成id的
	 private String inventoryPrincipal;   //负责人
	 private String inventoryPrincipalPhone;  //负责人电话
	 private String inventoryName;
	 private String inventorySn;      
	 private Double longitude;   //经度
	 private Double latitude;    //纬度
   
	 private Double lo;   //传过来的event经度
	 private Double la;    //传过来的event纬度
	 private String idType;              //判断各种资源点类型
  
	
	 
	 
     private String  clickType;
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
	
    public String queryAllInventory(){
    	jsonArray=inventoryService.getMapInventory();
    	return "jsonArray";
    	
    }

    //查询符合经纬度的东西
    public String queryVicinity() throws IOException{
        jsonArray=inventoryService.getMapVicinity(lo,la);
 		return "jsonArray";

    }
    
   //查询所有10公里内的Inventory
 	public String queryByPage() throws IOException{
 		String str="";
 		//根据关键词，决定查询类型
 		if(clickType==null||clickType==""){
 			str=inventoryService.getPage(page, rows,clickType,lo,la);
 		}else if(clickType.equalsIgnoreCase("inventory")){
 			str=inventoryService.getPage(page, rows,clickType,lo,la);
 		}else if(clickType.equalsIgnoreCase("hazard")){
 			 str=inventoryService.getPageHazard(page, rows,clickType,lo,la);
 		}else if(clickType.equalsIgnoreCase("emergencyResponseTeam")){
 			 str=inventoryService.getPageEmergencyResponseTeam(page, rows,clickType,lo,la);
 		}else if(clickType.equalsIgnoreCase("protectionObject")){
 			 str=inventoryService.getPageProtectionObject(page, rows,clickType,lo,la);
 		}

 		out().print(str);
 		out().flush();
 		out().close();
 		return "jsonArray";
 	}
 	
 	
 	
 	
 	//根据id获得对应inventory
 	public String queryInventoryById(){
 		Inventory i = inventoryService.get(Inventory.class, id);
 		jsonObject.put("inventoryName", i.getInventoryName()); 
 		jsonObject.put("inventorySn", i.getInventorySn());
 		jsonObject.put("longitude", i.getLongitude());
 		jsonObject.put("latitude", i.getLatitude());
 		jsonObject.put("inventoryPrincipal", i.getInventoryPrincipal());
 		jsonObject.put("inventoryPrincipalPhone", i.getInventoryPrincipalPhone());
 		return "jsonObject";
 	}
 	
 	
 	
 	
 	
 	//新增Inventory
    public String save(){
    	System.out.println(idType);
		jsonObject.put("status", "ok");
		Inventory i =new Inventory();
		Hazard h = new Hazard();
		EmergencyResponseTeam em =new EmergencyResponseTeam();
		ProtectionObject p= new ProtectionObject() ;
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		if(idType.equalsIgnoreCase("inventory")){
			try{
				DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
				LocalDateTime time = LocalDateTime.now();
				String localTime = df.format(time);
				
				String iType='a'+ UUID.randomUUID().toString().substring(0, 6);
			    i.setLatitude(latitude);
			    i.setLongitude(longitude);
			    i.setInventoryName(inventoryName);
			    i.setInventoryPrincipal(inventoryPrincipal);
			    i.setInventoryPrincipalPhone(inventoryPrincipalPhone);
			    i.setInventorySn(localTime);
			    i.setiType(iType);
				inventoryService.save(i);
			}catch(Exception e){
				jsonObject.put("status", "nook");
			}
		}else if(idType.equalsIgnoreCase("hazard")){
			try {
				DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
				LocalDateTime time = LocalDateTime.now();
				String localTime = df.format(time);
				
				String iType='b'+ UUID.randomUUID().toString().substring(0, 6);
				h.setHazardName(inventoryName);
				h.setHazardSn(localTime);
				h.setiType(iType);
			    h.setLatitude(latitude);
			    h.setLongitude(longitude);
			    h.getLatitude();
			    h.getLongitude();
				h.setPrincipal(inventoryPrincipal);
				h.setPrincipalPhone(inventoryPrincipalPhone);
				hazardService.save(h);
			} catch (Exception e) {
				jsonObject.put("status", "nook");
			}
		}else if(idType.equalsIgnoreCase("emergencyResponseTeam")){
			try {
				DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
				LocalDateTime time = LocalDateTime.now();
				String localTime = df.format(time);
				String iType='c'+ UUID.randomUUID().toString().substring(0, 6);
				em.setLongitude(longitude);
				em.setLatitude(latitude);
				em.setEmergencyResponseTeamName(inventoryName);
				em.setEmergencyResponseTeamSn(localTime);
				em.setPrincipal(inventoryPrincipal);
				em.setPrincipalPhone(inventoryPrincipalPhone);
				em.setiType(iType);
				emergencyResponseTeamService.save(em);
			} catch (Exception e) {
				jsonObject.put("status", "nook");
			}
		}else if(idType.equalsIgnoreCase("protectionObject")){
          try {
        	  DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
				LocalDateTime time = LocalDateTime.now();
				String localTime = df.format(time);  
        	String iType='d'+ UUID.randomUUID().toString().substring(0, 6);
			p.setiType(iType);
			p.setLatitude(latitude);
			p.setLongitude(longitude);
			p.setPrincipal(inventoryPrincipal);
			p.setPrincipalPhone(inventoryPrincipalPhone);
			p.setProtectionObjectName(inventoryName);
			p.setProtectionObjectSn(localTime);
			protectionObjectService.save(p);
			} catch (Exception e) {
				jsonObject.put("status", "nook");
			}
		}
		
		return "jsonObject";
	}
 	//删除选定Inventory
    public String deleteInventory(){
    	jsonObject.put("status", "ok");
		try{
			System.out.println(idType);
			if(idType==null||idType==""){
				
			}else{
				char t =idType.charAt(0);
				System.out.println(t);
			if(t=='a'){
				Inventory i = inventoryService.getByInventoryIType(idType);
				inventoryService.delete(i);
				System.out.println("成功删除");
			}else if(t=='b'){
				Hazard i = hazardService.getByHazardIType(idType);
				hazardService.delete(i);
			}else if(t=='c'){
				EmergencyResponseTeam i = emergencyResponseTeamService.getByEmergencyResponseTeamIType(idType);
				emergencyResponseTeamService.delete(i);
			}else if(t=='d'){
				ProtectionObject i = protectionObjectService.getByProtectionObjectIType(idType);
				protectionObjectService.delete(i);
			}	
			}
			
		}catch(Exception e){
			jsonObject.put("status", "nook");
		}
		return "jsonObject";
	}
  //修改资源点
    public String update(){
    	jsonObject.put("status", "ok");
		try{
			Inventory i = inventoryService.get(Inventory.class,id);
			i.setLatitude(latitude);
			i.setLongitude(longitude);
			i.setInventoryName(inventoryName);
			i.setInventoryPrincipal(inventoryPrincipal);
			i.setInventoryPrincipalPhone(inventoryPrincipalPhone);
		    i.setInventorySn(inventorySn);
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






		




		public String getInventorySn() {
			return inventorySn;
		}




		public void setInventorySn(String inventorySn) {
			this.inventorySn = inventorySn;
		}




		



		

		public Double getLongitude() {
			return longitude;
		}

		public void setLongitude(Double longitude) {
			this.longitude = longitude;
		}

		public Double getLatitude() {
			return latitude;
		}

		public void setLatitude(Double latitude) {
			this.latitude = latitude;
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

		public String getClickType() {
			return clickType;
		}

		public void setClickType(String clickType) {
			this.clickType = clickType;
		}

		public String getCode() {
			return code;
		}

		public void setCode(String code) {
			this.code = code;
		}

		public String getIdType() {
			return idType;
		}

		public void setIdType(String idType) {
			this.idType = idType;
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

		public String getInventoryName() {
			return inventoryName;
		}

		public void setInventoryName(String inventoryName) {
			this.inventoryName = inventoryName;
		}

		public Double getLo() {
			return lo;
		}

		public void setLo(Double lo) {
			this.lo = lo;
		}

		public Double getLa() {
			return la;
		}

		public void setLa(Double la) {
			this.la = la;
		}
		
		

		
}
