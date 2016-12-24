package com.gsafety.plan.module.actions;





import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.po.ResourceRecord;
import com.gsafety.plan.po.Supply;
import com.gsafety.plan.service.MissionService;
import com.gsafety.plan.service.PersonService;
import com.gsafety.plan.service.ResourceRecordService;
import com.gsafety.plan.service.SupplyService;
/**
 * @author Administrator
 *
 */
@Namespace("/preplan")
public class ResourceRecordAction extends ListAction<ResourceRecord> {

	//private static final Object ResourceRecord = null;
	@Resource
	private MissionService missionService;
	@Resource
	private ResourceRecordService resourceRecordService;
	@Resource
	private SupplyService supplyService;
	@Resource
	private PersonService personService;
	
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
	private String missionSn;
	private String supplySn;
	private String supplyName;
	
	private String id;
	
	private String code;
	
	
	public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSupplyName() {
		return supplyName;
	}

	public void setSupplyName(String supplyName) {
		this.supplyName = supplyName;
	}

	public MissionService getMissionService() {
		return missionService;
	}

	public void setMissionService(MissionService missionService) {
		this.missionService = missionService;
	}

	public String getSupplySn() {
		return supplySn;
	}

	public void setSupplySn(String supplySn) {
		this.supplySn = supplySn;
	}

	public SupplyService getSupplyService() {
		return supplyService;
	}

	public void setSupplyService(SupplyService supplyService) {
		this.supplyService = supplyService;
	}

	public PersonService getPersonService() {
		return personService;
	}

	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	public String getMissionSn() {
		return missionSn;
	}

	public void setMissionSn(String missionSn) {
		this.missionSn = missionSn;
	}

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
			
				String str=resourceRecordService.getByReSn(missionSn,page, rows);
				out().print(str);
				out().flush();
				out().close();
				return "jsonArray";
		}
		
		public String saveRecord() throws IOException{
			jsonObject.put("status", "ok");
			ResourceRecord resourceRecord = new ResourceRecord();
			try{
				resourceRecord.setResourceSn(supplySn);
				resourceRecord.setResourceName(supplyName);
				resourceRecord.setResourceNumber(resourceNumber);
				resourceRecord.setResourceUnit(resourceUnit);
				resourceRecord.setMissionSnR(missionService.getByMissionSn(missionSn));
				resourceRecordService.save(resourceRecord);
	
			}catch(Exception e){
				jsonObject.put("status", "nook");
			}
			return "jsonObject";
					                               }
		//失败了？？
	    public String  deleteRecord() throws IOException{
	    	jsonObject.put("status", "ok");
	    	try{
	    	String hql="delete  ResourceRecord r where r.id ="+id;
	    	resourceRecordService.delete(hql);
	    	
	    	}catch(Exception e){
	    		jsonObject.put("status", "nook");
	    	}
	    	return "jsonObject";
	    }
	    
	    //保存新资源
	    public String saveSrc() {
	        Mission misnModel =new Mission();
	        misnModel.setMissionSn(code);
            String uuidSrc = UUID.randomUUID().toString();
            ResourceRecord srcModel = new  ResourceRecord();
            srcModel.setResourceName(resourceName);
            srcModel.setResourceNumber(resourceNumber);
            srcModel.setResourceUnit(resourceUnit);
            srcModel.setMissionSnR(misnModel);
            srcModel.setResourceSn(uuidSrc);
            resourceRecordService.save(srcModel);
            System.out.println("保存资源");
	        return "jsonArray";
	    }
	    //更新资源
	    public String updateSrc() {
	          ResourceRecord rr=new  ResourceRecord();
	            rr.setId(Integer.parseInt(code));
	            rr.setResourceName(resourceName);
	            rr.setResourceNumber(resourceNumber);
	            rr.setResourceUnit(resourceUnit);
	            resourceRecordService.updateById(rr); 	        
	        return "jsonArray";
	    }
	    //删除资源
	    public String deleteSrc() {
	        System.out.println(code);
	        ResourceRecord rr=resourceRecordService.get(ResourceRecord.class,Integer.parseInt(code));
	        resourceRecordService.delete(rr);
	        return "jsonArray";
	    }
	    
	
	
	
	
	
	
	
	
	
	
	

}

