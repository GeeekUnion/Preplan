package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Module;
import com.gsafety.plan.service.ModuleService;
;

@Namespace("/preplan")
public class ModuleAction extends ListAction<Module> {

	@Resource
	private ModuleService moduleService;
	private JSONObject jsonObject = new JSONObject();
	private JSONArray jsonArray = new JSONArray();
	private int page;
	private int rows;
	//预案的
	private String preplanSn;                       

	/*
	 *@param  preplanSn
	 *@return pagerList(模块带分页)
	 * */
	public String queryModuleByPpsn() {
	    
	    return "jsonArray";
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


    public JSONArray getJsonArray() {
        return jsonArray;
    }


    public void setJsonArray(JSONArray jsonArray) {
        this.jsonArray = jsonArray;
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


    public String getPreplanSn() {
        return preplanSn;
    }


    public void setPreplanSn(String preplanSn) {
        this.preplanSn = preplanSn;
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
