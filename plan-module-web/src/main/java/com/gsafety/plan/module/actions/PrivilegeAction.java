package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Privilege;
import com.gsafety.plan.service.PrivilegeService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Namespace("/preplan")
public class PrivilegeAction extends ListAction<Privilege>{
    //注入service
	@Resource
	private PrivilegeService privilegeService;
	private String returnpd;
	private int parentId;
	private String priMaster;
	private int priKey;
	private int page;
	private int rows;
	

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

    public String getPriMaster() {
		return priMaster;
	}

	public void setPriMaster(String priMaster) {
		this.priMaster = priMaster;
	}

	public int getPriKey() {
		return priKey;
	}

	public void setPriKey(int priKey) {
		this.priKey = priKey;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getReturnpd() {
		return returnpd;
	}

	public void setReturnpd(String returnpd) {
		this.returnpd = returnpd;
	}

	// 输出
	public PrintWriter out() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		return out;
	}
	public String queryPrivilege() throws IOException{
        String str =privilegeService.getPageBySql(page,rows);
//		List<Privilege> pList=privilegeService.query();
//		JSONArray array = new JSONArray();
//	    for(Privilege p : pList){
//	    	JSONObject jo = new JSONObject();  
//			jo.put("id", p.getId());
//			jo.put("PrivilegeOperation", p.getPrivilegeOperation());
//			jo.put("RecordStatus", p.getRecordStatus());
//			jo.put("ParentID", p.getParentID());
//			array.add(jo);
//	    }
//	    String str = array.toString();
		out().print(str);
		out().flush();
		out().close();
		return "jsonArray";
	}
	
	public void test() {
	    System.out.println("120");
	}

}
