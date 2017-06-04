package com.gsafety.plan.module.actions;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.PageMsg;
import com.gsafety.plan.service.PageMsgService;

@Namespace("/preplan")
public class PageMsgAction extends ListAction<PageMsg>{
    
    @Resource
    private PageMsgService pageMsgService;
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    private JSONObject jsonObject = new JSONObject();
    private JSONArray jsonArray = new JSONArray();
    private int id;//唯一标识
    private String title;//标题
    private String titleDesc;//标题
    private boolean isSupTitle;//是否父标题
    private int supId;//父ID
    private String order;//显示顺序
    private String requireContent;//要求内容
    private String exampleContent;//示例内容
    private boolean requireCheck;//编写要求有无
    private boolean exampleCheck;//示例有无
    private boolean srcCheck;//资源有无
    private String code;//...
    private String type;//全案 1、简案2
    
    /**
     * 获得树的jsonArray
     * */
    public String getTree() {
    	String pmType="1";
    	if(null!=type && type.length()>0){
    		pmType=type;
    	}
        jsonArray=pageMsgService.getTree(pmType);
        return "jsonArray";
    }
    
    
    /**
     * 根据order获得页面信息
     * */
    public String getPageMsgByOrder() {
        if(null!=order && order.length()>0) {
            jsonObject=pageMsgService.getPageMsgByOrder(order);
        }
        
        return "jsonObject";
    }
    
    /**
     * 获得pageMsg所有标题的列表（子标题在父标题下）
     * */
    public String getOrderPageMsg() {
    	String pmType="1";//默认1
    	if(null!=type && type.length()>0){
    		pmType=type;
    	}
    	jsonArray=pageMsgService.getOrderPageMsg(pmType);        
        return "jsonArray";
    }
    
    
    
    
    
    
    
    
    public String getCode() {
        return code;
    }


    public void setCode(String code) {
        this.code = code;
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
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getTitleDesc() {
        return titleDesc;
    }
    public void setTitleDesc(String titleDesc) {
        this.titleDesc = titleDesc;
    }
    public boolean isSupTitle() {
        return isSupTitle;
    }
    public void setSupTitle(boolean isSupTitle) {
        this.isSupTitle = isSupTitle;
    }
    public int getSupId() {
        return supId;
    }
    public void setSupId(int supId) {
        this.supId = supId;
    }
    public String getOrder() {
        return order;
    }
    public void setOrder(String order) {
        this.order = order;
    }
    public String getRequireContent() {
        return requireContent;
    }
    public void setRequireContent(String requireContent) {
        this.requireContent = requireContent;
    }
    public String getExampleContent() {
        return exampleContent;
    }
    public void setExampleContent(String exampleContent) {
        this.exampleContent = exampleContent;
    }
    public boolean isRequireCheck() {
        return requireCheck;
    }
    public void setRequireCheck(boolean requireCheck) {
        this.requireCheck = requireCheck;
    }
    public boolean isExampleCheck() {
        return exampleCheck;
    }
    public void setExampleCheck(boolean exampleCheck) {
        this.exampleCheck = exampleCheck;
    }
    public boolean isSrcCheck() {
        return srcCheck;
    }
    public void setSrcCheck(boolean srcCheck) {
        this.srcCheck = srcCheck;
    }


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}
    

}
