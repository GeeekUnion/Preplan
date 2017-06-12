package com.gsafety.plan.module.actions;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
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
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.PictureServise;



public class PictureAction extends ListAction<Picture>{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource
	private PictureServise pictureService;
	
	private int id;
    private String imgUrl;//图片链接

    private String err = "";  
    private String msg;              //返回信息  
    private File filedata;           //上传文件  
    private String filedataFileName; //文件名 
    private JSONObject jsonObject = new JSONObject();
    private JSONArray jsonArray = new JSONArray();
    
    private String preplanSn;//预案sn

    /**
     * 上传图片
     * */
    public String uploadImg(){
          //获取response、request对象  
        ActionContext ac = ActionContext.getContext();  
        HttpServletResponse response = (HttpServletResponse) ac.get(ServletActionContext.HTTP_RESPONSE);  
        HttpServletRequest request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);  

        response.setContentType("text/html;charset=utf-8");  
 
        //这里的路径设置，在我的电脑上传路径是：D:\apache-tomcat-7063\wtpwebapps\plan\WEB-INF\img。      
        String newSaveRealFilePath = ServletActionContext.getServletContext().getRealPath("/img");
        
        //String newSaveRealFilePath=saveRealFilePath.substring(0,saveRealFilePath.lastIndexOf("\\"))+"\\ROOT\\img";
        System.out.println(newSaveRealFilePath);//这里是上传的路径
        
        File fileDir = new File(newSaveRealFilePath);  
        if (!fileDir.exists()) { //如果不存在 则创建   
            fileDir.mkdirs();  
        }  
        
        String newFileName= UUID.randomUUID().toString();//新文件名
        newFileName=newFileName+"."+filedataFileName.substring(filedataFileName.lastIndexOf(".")+1);
        System.out.println("文件名："+newFileName);//获得后缀名
        
        File savefile = new File(newSaveRealFilePath , newFileName); //存入root文件夹下
        
        try {  
            FileUtils.copyFile(filedata, savefile);  
        } catch (IOException e) {  
            err = "错误"+e.getMessage();  
            e.printStackTrace();  
        }  
        String fileName = "\\plan\\img\\"+newFileName;// /plan/img  (文件名)
        jsonObject.put("err", err);
        jsonObject.put("msg", fileName);        
         //返回msg信息  
        return "jsonObject"; 
    }
    
    /**
     * 保存图片路径到数据库
     * */
    public String savePirture(){
    	jsonObject.put("status", "error");
    	if(imgUrl!=null && preplanSn!=null){
    		Preplan p=new Preplan();
    		p.setPreplanSn(preplanSn);
    		Picture oldPic=pictureService.getPicByPlanSn(p);    
    		//如果新增
    		if(null!=oldPic){
    			oldPic.setImgUrl(imgUrl);  
    			pictureService.update(oldPic);    			
    		}else{
    			Picture pic=new Picture();
        		pic.setImgUrl(imgUrl);
        		pic.setPreplanSn(p);
        		pictureService.save(pic);
    		}
    		
    		jsonObject.put("status", "ok");
    	}    	
    	return "jsonObject";
    	
    }

    /**
     * 保存图片路径到数据库
     * */
    public String getPicByPlanSn(){
    	if( preplanSn!=null){
    		Preplan p=new Preplan();
    		p.setPreplanSn(preplanSn);
    		Picture pic=pictureService.getPicByPlanSn(p); 
    		if(null != pic){
    			jsonObject.put("imgUrl", pic.getImgUrl());
        		jsonArray.add(jsonObject);
    		}
    		
    	}    	
    	return "jsonArray";
    	
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

	public String getPreplanSn() {
		return preplanSn;
	}

	public void setPreplanSn(String preplanSn) {
		this.preplanSn = preplanSn;
	}

	

	

}
