package com.gsafety.plan.module.actions;



import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;










import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.util.encrypt.DESCoder;
import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.service.PersonService;
import com.gsafety.plan.service.PreplanService;

/**
 * @author Administrator
 * @param <EmsUserService>
 *
 */
@Namespace("/preplan")
public class PersonAction extends ListAction<Person> {
	
	 @Resource
	 private PersonService personService;   
	
	private String username;
	private String password;
	private String jsonObject;
	
	/**
	 * 预警管理登录
	 * @param username,password
	 * @return
	 */
	public String login(){
		System.out.println(username+':'+password);
		if(StringUtils.isNotEmpty(username)) {
			Person pr=personService.getPersonByUname(username,password);	
			if(password.equals(pr.getPassword())){
				jsonObject="ok";
			}else{
				jsonObject="error";		
			}
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
    

}

