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
import com.gsafety.plan.po.Inventory;
import com.gsafety.plan.po.Supply;
import com.gsafety.plan.service.InventoryService;
import com.gsafety.plan.service.SupplyService;
/**
 * @author Administrator
 *
 */
@Namespace("/preplan")
public class SupplyAction extends ListAction<Supply> {
     @Resource
     private SupplyService supplyService;
     @Resource
     private InventoryService inventoryService;  
     private int id;
     private String supplyName;
     private String supplySn;
     private int supplyNumber;
     private String supplyUnit;
//     private String supplyLatitude;
//     private String supplyLongitude;
//     private String supplyPrincipal;
//     private String supplyPrincipalPhone;
     private String  code;         //代指iventory的sn
   
     private int idInventory; //代指iventory的id
     private int page;
     private int rows;
     private JSONArray jsonArray = new JSONArray();
     private JSONObject jsonObject = new JSONObject();
	
   //查询所有
  	public String queryByPage() throws IOException{
  		
  		
  		String str=supplyService.getPageByCode2(page, rows,code);
  		out().print(str);
		out().flush();
		out().close();
		return "jsonArray";
  	}

  	
    //地图里，查询所有supply
  //暂时没用
    public String querySupply(){
        jsonArray =supplyService.getMapSupply();
		return "jsonArray";
    }
	//新增资源
    public String save(){
		jsonObject.put("status", "ok");
		Supply s = new Supply();
		System.out.println(code);
		
		try{
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			s.setSupplyName(supplyName);
			s.setSupplyNumber(supplyNumber);
			s.setSupplySn(uuid);
			s.setSupplyUnit(supplyUnit);
			//id没传值进来？
			Inventory i =inventoryService.get(Inventory.class,idInventory);
			s.setInventorySnM(i);
			supplyService.save(s);
		}catch(Exception e){
			jsonObject.put("status", "nook");
		}
		return "jsonObject";
	}
    //删除某个资源
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
   //地图里，修改某个资源
    public String update(){
    	jsonObject.put("status", "ok");
		try{
			System.out.println(id);
			Supply s = supplyService.get(Supply.class,id);
			s.setSupplyName(supplyName);
			s.setSupplyNumber(supplyNumber);
			s.setSupplyUnit(supplyUnit);
			supplyService.update(s);
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
//	public String getSupplyLatitude() {
//		return supplyLatitude;
//	}
//	public void setSupplyLatitude(String supplyLatitude) {
//		this.supplyLatitude = supplyLatitude;
//	}
//	public String getSupplyLongitude() {
//		return supplyLongitude;
//	}
//	public void setSupplyLongitude(String supplyLongitude) {
//		this.supplyLongitude = supplyLongitude;
//	}
//	public String getSupplyPrincipal() {
//		return supplyPrincipal;
//	}
//	public void setSupplyPrincipal(String supplyPrincipal) {
//		this.supplyPrincipal = supplyPrincipal;
//	}
//	public String getSupplyPrincipalPhone() {
//		return supplyPrincipalPhone;
//	}
//	public void setSupplyPrincipalPhone(String supplyPrincipalPhone) {
//		this.supplyPrincipalPhone = supplyPrincipalPhone;
//	}
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	


	public InventoryService getInventoryService() {
		return inventoryService;
	}


	public void setInventoryService(InventoryService inventoryService) {
		this.inventoryService = inventoryService;
	}


	public int getIdInventory() {
		return idInventory;
	}


	public void setIdInventory(int idInventory) {
		this.idInventory = idInventory;
	}
	
	
	
}