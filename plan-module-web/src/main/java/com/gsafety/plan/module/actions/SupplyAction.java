package com.gsafety.plan.module.actions;



import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;










import com.gsafety.cloudframework.common.ui.list.action.ListAction;
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
     private String supplyName;
     private String supplySn;
     private JSONArray jsonArray = new JSONArray();
     
	
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
}