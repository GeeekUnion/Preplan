package com.gsafety.plan.module.actions;

import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.User;
import com.gsafety.plan.service.UserService;

@Namespace("/preplan")
public class UserAction extends ListAction<User>{
	//用于封装会话session
	protected Map<String, Object> session;
  
	@Resource
	private UserService userService;
	private int id;
	private String username;
	private String password;
	private String resource;     
	
	private JSONObject jsonObject=new JSONObject();
	private JSONArray jsonArray=new JSONArray();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
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
	
	
	//登录
//		public String login() {
//			//Person person=personService.getByPersonSn(personSn);
//			User user =userService.get
//			Boolean right=false;
//			if(user!=null){ 
//				if(password.equals(user.getPassword())){
//					right=true;
//				}else{
//					right=false;
//				}
//			}
//			if(right){
//				session.put("userSn", user.getUsername());			
//			
//				jsonObject.put("status", "ok");
//			}else{
//				jsonObject.put("status", "nook");
//			}
//			return "jsonObject";
//		}
	
	
	
}
