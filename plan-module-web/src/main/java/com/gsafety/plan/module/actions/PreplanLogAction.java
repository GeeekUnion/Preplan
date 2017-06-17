package com.gsafety.plan.module.actions;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.SessionAware;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.PreplanLog;
import com.gsafety.plan.service.PreplanLogService;

public class PreplanLogAction extends ListAction<PreplanLog>implements SessionAware{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    @Resource
    private PreplanLogService  preplanLogService;
    
    //用于封装会话session
    protected Map<String, Object> session;
    
    private String preplanSn;//对应预案sn
    private Timestamp preplanLogTime;//编制历史
    private String orgCode;//编制人code
    private JSONObject jsonObject = new JSONObject();
    private JSONArray jsonArray = new JSONArray();
    
    /**
     * 根据预案Sn查询预案编制日志列表
     * @param preplanSn
     * @return jsonArray
     * */
    public String queryListByPreplanSn() {
        if(preplanSn!=null){
            Preplan p=new Preplan();
            p.setPreplanSn(preplanSn);
            jsonArray=preplanLogService.queryListByPreplanSn(p);
                       
        }        
        return "jsonArray";       
    } 
    
    /**
     * 根据预案Sn查询保存预案编制日志记录
     * @param preplanSn
     *
     * */
    public String  savePLLog() {        
        try {
            orgCode=session.get("preplanOrgCode").toString();
            if(preplanSn!=null){
                Preplan p=new Preplan();
                p.setPreplanSn(preplanSn);
                PreplanLog pl=new PreplanLog();
                //获得当前预案时间
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                System.out.println(sdf);
                System.out.println(Timestamp.valueOf(sdf.format(System.currentTimeMillis())));
                pl.setPreplanLogTime(Timestamp.valueOf(sdf.format(System.currentTimeMillis())));
                pl.setOrgCode(orgCode);
                pl.setPreplanSn(p);
                preplanLogService.save(pl);
                jsonObject.put("status", "ok");
                           
            }
            
        } catch (Exception e) {
            jsonObject.put("status", "error");
            e.printStackTrace();
        }
        return "jsonObject"; 
    }
    
    public Map<String, Object> getSession() {
        return session;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    public PreplanLogService getPreplanLogService() {
        return preplanLogService;
    }
    public void setPreplanLogService(PreplanLogService preplanLogService) {
        this.preplanLogService = preplanLogService;
    }
    public String getPreplanSn() {
        return preplanSn;
    }
    public void setPreplanSn(String preplanSn) {
        this.preplanSn = preplanSn;
    }
    public Timestamp getPreplanLogTime() {
        return preplanLogTime;
    }
    public void setPreplanLogTime(Timestamp preplanLogTime) {
        this.preplanLogTime = preplanLogTime;
    }
    public String getOrgCode() {
        return orgCode;
    }
    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
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
    
    
    

}
