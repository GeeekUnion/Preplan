package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.MissionService;
import com.gsafety.plan.service.PreplanService;

@Namespace("/preplan")
public class MissionAction extends ListAction<Mission> {

	@Resource
	private MissionService missionService;
	private JSONObject jsonObject = new JSONObject();
	private JSONArray jsonArray = new JSONArray();
	private int page;
	private int rows;
	//预案的
	private int id;
	private String preplanSn;                       
	private String preplanName;
	private Timestamp preplanTime;
	private String responDept;
	
	
	
	public PrintWriter out() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		return out;
	}
	//启动预案页面，查询预案属性
	public String queryByPage() throws IOException{
		
		String str=missionService.getPage(page, rows);
		
		out().print(str);
		out().flush();
		out().close();
		return "jsonArray";
	}
	
	
	//执行情况页面，根据预案Sn，查询对应任务属性
	public String queryByPreSn() throws IOException{
		
		String str="";
		out().print(str);
		out().flush();
		out().close();
		return "jsonArray";
}
	 //查看预案详情中查看任务
    public String queryMissionByPpsn() throws IOException {
        Preplan ppModel=new Preplan();
        ppModel.setPreplanSn(preplanSn);
        //根据预案Sn查询任务列表
        List<Mission> misnList= missionService.getListByPpsn(ppModel);
        JSONArray array = new JSONArray();
       
        if(misnList.size()>0) {
          //封装任务列表
            for(Mission m : misnList) {
                JSONObject jo = new JSONObject();
                jo.put("missionId",m.getId());
                jo.put("missionOrder",m.getMissionOrder());
                jo.put("missionName",m.getMissionName());
                jo.put("missionDept",m.getResponDept());
                jo.put("missionSn",m.getMissionSn());
                jo.put("missionStatus", m.getMissionStatus());
                array.add(jo);               
            }
        }
        
        
        //输出资源到页面
        String misstr = array.toString();
        out().print(misstr);
        out().flush();
        out().close();   
        return "jsonArray";
    }
	//根据mission的id获得mission,没有put所有的属性
    public String queryBymissionSn(){
        JSONObject jo = new JSONObject();
        jsonArray = new JSONArray();
        System.out.println(id);
    	Mission m = missionService.get(Mission.class,id);
    	if(m!=null){
    		jo.put("missionDefault", m.getMissionDefault());
    		jo.put("missionMethod", m.getMissionMethod());
    		jo.put("missionName", m.getMissionName());
    		jo.put("missionSn", m.getMissionSn());
    		jo.put("missionStatus", m.getMissionStatus());
    		jsonArray.add(jo);
    	}else{
    		System.out.println("错误！！！！！！");
    	}
    	
    	return "jsonArray";
    }
    
    
    
    
    
	
	
	public String getResponDept() {
		return responDept;
	}
	public void setResponDept(String responDept) {
		this.responDept = responDept;
	}
	public MissionService getMissionService() {
		return missionService;
	}
	public void setMissionService(MissionService missionService) {
		this.missionService = missionService;
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
	public String getPreplanName() {
		return preplanName;
	}
	public void setPreplanName(String preplanName) {
		this.preplanName = preplanName;
	}
	public Timestamp getPreplanTime() {
		return preplanTime;
	}
	public void setPreplanTime(Timestamp preplanTime) {
		this.preplanTime = preplanTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
