package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Module;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.ModuleService;
import com.opensymphony.xwork2.ActionContext;
;

@Namespace("/preplan")
public class ModuleAction extends ListAction<Module> {

	@Resource
	private ModuleService moduleService;
	private JSONObject jsonObject = new JSONObject();
	private JSONArray jsonArray = new JSONArray();
	private int page;
	private int rows;

    private String title;//标题
    private String content;//内容
    private String order;//顺序
    private  int id;//唯一标识
	//预案的
	private String preplanSn;                       

	/*@name 查询模块列表（默认，无preplan外键）
	 *@param  preplanSn
	 *@return pagerList(模块带分页)
	 * */
	public String queryModuleByPpsn() {	    
	    jsonObject = moduleService.queryModulePagerByPpsn(page,rows,preplanSn);
	    return "jsonObject";
	}
	
	/*@name 新增或者保存模块 
     *@param  模块属性
     *@returns 
     * */
	public String saveOrUpdateModule() {
	    System.out.println("id："+id+"，"+"order："+order+"，内容："+content);
	    JSONObject jo = new JSONObject();
	    if(preplanSn.isEmpty()) {	        
	        jo.put("status","error");
	        jsonObject=jo;
	    }else {
            Preplan pl=new Preplan();
            pl.setPreplanSn(preplanSn);
            //id为0则是新模块
           if(id==0) {
                Module oldMd=moduleService.getUniqueByPpsnOrder(preplanSn,order);                  
                if(oldMd != null) {
                    oldMd.setContent(content);
                    moduleService.update(oldMd);
                }else{
                    Module md=new Module();
                    String uuidModule = UUID.randomUUID().toString();  
                    md.setOrder(order);
                    md.setContent(content);
                    md.setModuleSn(uuidModule);
                    md.setPreplanSnM(pl);
                    md.setModuleCheck(true);
                    moduleService.save(md);
                }
                
            }
            else {                
                Module md=moduleService.get(Module.class, id);            
                md.setContent(content);
                moduleService.saveOrUpdate(md);
            }
            jo.put("status",preplanSn);
            jsonObject=jo;
	        
	    }	    
	    return "jsonObject"; 
	}
	
	/*@name 删除模块 
     *@param  模块id
     *@returns 
     * */
	public String deleteModuleById(){
	    if(id==0) {
	        
	        
	    }
	    else {
	        Module md=new Module();
	        md.setId(id);
	        moduleService.delete(md);  	        
	    }
	    return "jsonObject";
	}
	
	
	
	
	/*@name 获得模块
     *@param  模块id
     *@returns 模块实体
     * */
    public String getModuleById() {
        Module md=moduleService.get(Module.class, id);
        System.out.println(md);
        jsonObject.put("title",md.getTitle());
        jsonObject.put("content",md.getContent());
        return "jsonObject";             
    }
	
	
	
	
	/*@name 获取更新信息 
     *@param  模块id
     *@returns 
     * */
	public String getUpdateFtl() {
	    System.out.println(id);
	    ActionContext.getContext().put("moduleId",id);//id
        return "updateFtl";	    	    
	}
	
	/*@name 更新模块顺序 
     *@param  模块id
     *@returns 
     * */
    public String updateModuleOrder() {
        Module oldMd=moduleService.get(Module.class, id);
        oldMd.setOrder(order);
        moduleService.save(oldMd);
        return "jsonObject";             
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public ModuleService getModuleService() {
        return moduleService;
    }

    public void setModuleService(ModuleService moduleService) {
        this.moduleService = moduleService;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
	
    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
