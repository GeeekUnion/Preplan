package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Drill;
import com.gsafety.plan.service.DrillService;

public class DrillAction extends ListAction<Drill>{
	 @Resource
	 private DrillService drillService;
	 
	 private JSONArray jsonArray = new JSONArray();
     private JSONObject jsonObject = new JSONObject();
   //用于封装会话session
     protected Map<String, Object> session;  
     private int page;
     private int rows;
     
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
    	 if(null != orgCode && orgCode.length()>0) {
    		str=drillService.queryDrill(orgCode,page, rows); 
    		out().print(str);
      		out().flush();
      		out().close();
    		return "jsonArray";
    	 }
	    	out().print(str);
	  		out().flush();
	  		out().close();
	    	return "jsonArray";
     }
     
}
