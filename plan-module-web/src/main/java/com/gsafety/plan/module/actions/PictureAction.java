package com.gsafety.plan.module.actions;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Picture;



public class PictureAction extends ListAction<Picture>{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
    private String imgUrl;//图片链接

    private String err = "";  
    private String msg;              //返回信息  
    private File filedata;           //上传文件  
    private String filedataFileName; //文件名 
    private JSONObject jsonObject = new JSONObject();
    private JSONArray jsonArray = new JSONArray();

    public String uploadImg(){
          //获取response、request对象  
        ActionContext ac = ActionContext.getContext();  
        HttpServletResponse response = (HttpServletResponse) ac.get(ServletActionContext.HTTP_RESPONSE);  
        HttpServletRequest request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);  

        response.setContentType("text/html;charset=utf-8");  

//        PrintWriter out = null;  
//        try {  
//            out = response.getWriter();  
//        } catch (IOException e1) {  
//            e1.printStackTrace();  
//        }  
        /*这里的路径设置，在我的电脑上传路径是：D:\apache-tomcat-7063\wtpwebapps\plan\WEB-INF\img。
        */
        String saveRealFilePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/img");  
        System.out.println(saveRealFilePath );//这里是上传的路径
        File fileDir = new File(saveRealFilePath);  
        if (!fileDir.exists()) { //如果不存在 则创建   
            fileDir.mkdirs();  
        }  
        File savefile = new File(saveRealFilePath , filedataFileName);  
        try {  
            FileUtils.copyFile(filedata, savefile);  
        } catch (IOException e) {  
            err = "错误"+e.getMessage();  
            e.printStackTrace();  
        }  
        String fileName = request.getContextPath() + "/img/" + filedataFileName;  

        //msg = "{\"err\":\"" + err + "\",\"msg\":\"" + fileName + "\"}";  
        jsonObject.put("err", err);
        jsonObject.put("msg", fileName);        
         //返回msg信息  
        return "jsonObject"; 
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getErr() {
		return err;
	}

	public void setErr(String err) {
		this.err = err;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public File getFiledata() {
		return filedata;
	}

	public void setFiledata(File filedata) {
		this.filedata = filedata;
	}

	public String getFiledataFileName() {
		return filedataFileName;
	}

	public void setFiledataFileName(String filedataFileName) {
		this.filedataFileName = filedataFileName;
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
