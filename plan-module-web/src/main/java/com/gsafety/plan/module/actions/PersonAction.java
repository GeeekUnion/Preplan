package com.gsafety.plan.module.actions;



import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.interceptor.SessionAware;



import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.service.DepartmentService;
import com.gsafety.plan.service.PersonService;


/**
 * @author Administrator
 * @param <EmsUserService>
 *
 */
@Namespace("/preplan")
public class PersonAction extends ListAction<Person> implements SessionAware {
	
	 @Resource
	 private PersonService personService;   
	
	 @Resource
	 private DepartmentService departmentService; 
	 
	private String username;
	private String password;
	private String orgAreaCode;
	private String jsonObject;
	//用于封装会话session
	protected Map<String, Object> session;  
	
	/**
	 * 预警管理登录
	 * @param username,password
	 * @return
	 */
	public String login(){
		
		if(StringUtils.isNotEmpty(username)) {
			Person pr=personService.getPersonByUname(username,password);	
			if(password.equals(pr.getPassword())){
				String myOrgAreaCode=departmentService.getOrgAreaCodeById(pr.getOrgCode());
				if(orgAreaCode.equals(myOrgAreaCode.substring(1,2))){//如果校验正确
				    session.put("preplanOrgCode",pr.getOrgCode()); 			    			   
				    session.put("preplanUsername",pr.getLoginName()); 
				    jsonObject="ok";
				}else{
					jsonObject="nook";
				}
 
			    
				
			}else{
				jsonObject="error";		
			}
		}		
		return "jsonObject";
	}
	public String loginOut(){
    	if(null != session) {
    		session.clear();
    		jsonObject="ok";
    	}
		return "jsonObject";
	}
	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
    public String getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(String jsonObject) {
        this.jsonObject = jsonObject;
    }
    
	public String getOrgAreaCode() {
		return orgAreaCode;
	}
	public void setOrgAreaCode(String orgAreaCode) {
		this.orgAreaCode = orgAreaCode;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
    

}

