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
import com.gsafety.plan.po.ResourceRecord;
import com.gsafety.plan.service.ResourceRecordService;
/**
 * @author Administrator
 *
 */
@Namespace("/preplan")
public class ResourceRecordAction extends ListAction<ResourceRecord> {

	@Resource
	private ResourceRecordService resourceRecordService;
	private String name;
	private JSONObject jsonObject = new JSONObject();
	private JSONArray jsonArray = new JSONArray();
	private int page;
	private int rows;
	
	private String resourceName;
	private String resourceNumber;
	private String resourceUnit;
	private String resourceSn;
	private String missionSnR;
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public ResourceRecordService getResourceRecordService() {
		return resourceRecordService;
	}

	public void setResourceRecordService(ResourceRecordService resourceRecordService) {
		this.resourceRecordService = resourceRecordService;
	}

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getResourceNumber() {
		return resourceNumber;
	}

	public void setResourceNumber(String resourceNumber) {
		this.resourceNumber = resourceNumber;
	}

	public String getResourceUnit() {
		return resourceUnit;
	}

	public void setResourceUnit(String resourceUnit) {
		this.resourceUnit = resourceUnit;
	}

	public String getResourceSn() {
		return resourceSn;
	}

	public void setResourceSn(String resourceSn) {
		this.resourceSn = resourceSn;
	}

	

	public String getMissionSnR() {
		return missionSnR;
	}

	public void setMissionSnR(String missionSnR) {
		this.missionSnR = missionSnR;
	}

	public String execute() {
		    return "main";
		  }

	public void fine(){
		System.out.println("110");
	}
	
	
	
	public PrintWriter out() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		return out;
	}
	//查询调动资源记录
	public String queryByPage() throws IOException{
		String str=resourceRecordService.getPage(page, rows);
		out().print(str);
		out().flush();
		out().close();
		return "jsonArray";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

