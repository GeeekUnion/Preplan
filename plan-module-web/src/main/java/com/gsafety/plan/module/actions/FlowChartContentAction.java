package com.gsafety.plan.module.actions;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.FlowChartContent;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.FlowChartContentService;
import com.gsafety.plan.service.PreplanService;
@Namespace("/preplan")
public class FlowChartContentAction extends ListAction<FlowChartContent>{
    
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Resource 
    private FlowChartContentService  flowChartContentService;
    @Resource
    private PreplanService preplanService;  
    
    private JSONArray jsonArray = new JSONArray();
    private JSONObject jsonObject = new JSONObject();
    private String id;
    private String content;//内容
    private String preplanSn;//预案sn  
    
    /**
     * 保存流程图内容
     * @param preplanSn 
     * @param content
     * */
    public String  saveFlowChartContent() {
        if(preplanSn!=null){
            jsonObject.put("status", "error");
            Preplan p=preplanService.getByPpSn(preplanSn);
            FlowChartContent oldF = flowChartContentService.getUniqueByPreplanSn(p);
            if(oldF!=null) {
                oldF.setContent(content);
                flowChartContentService.update(oldF);
            }else {
                FlowChartContent f=new FlowChartContent();
                f.setContent(content);
                f.setPreplanSn(p);
                flowChartContentService.save(f);
            }
            jsonObject.put("status", "ok");
        }
        return "jsonObject";
        
    }
    
    public String getFlowChartContentByPreplanSn() {
        Preplan p=preplanService.getByPpSn(preplanSn);
        FlowChartContent oldF = flowChartContentService.getUniqueByPreplanSn(p);
        if(oldF!=null) {
            jsonObject.put("content", oldF.getContent());
            return "jsonObject";
        }
        jsonObject.put("content", "");
        return "jsonObject";
    }
    
    
    
    
    public FlowChartContentService getFlowChartContentService() {
        return flowChartContentService;
    }
    public void setFlowChartContentService(
            FlowChartContentService flowChartContentService) {
        this.flowChartContentService = flowChartContentService;
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
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getPreplanSn() {
        return preplanSn;
    }
    public void setPreplanSn(String preplanSn) {
        this.preplanSn = preplanSn;
    }

    
    
    
    
}
