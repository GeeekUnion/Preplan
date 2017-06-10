package com.gsafety.plan.module.actions;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.Reviews;
import com.gsafety.plan.service.PreplanService;
import com.gsafety.plan.service.ReviewsService;
@Namespace("/preplan")
public class ReviewsAction extends ListAction<Reviews>{
	 @Resource
	 private ReviewsService reviewsService;
	 @Resource
	 private PreplanService preplanService;
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	 private String reviewOrgCode;//审核人
	 private String preplanSn;//对应预案号
	 private String opinion;//意见
	 private String preplanStatus;//预案状态
     private JSONArray jsonArray = new JSONArray();
     private JSONObject jsonObject = new JSONObject();
     /**
      * TODO(保存或者修改review)
      * */
	 public String saveOrUpdateReview(){
		 System.out.println(preplanSn+','+opinion+','+preplanStatus);
		 if(null!=preplanSn && preplanSn.length()>0){
			 Reviews r=reviewsService.getUniqueByPreplanSn(preplanSn);
			if(null!=r){//修改Opinion
				r.setOpinion(opinion);
				reviewsService.update(r);
				
				Preplan p=preplanService.getByPpSn(preplanSn);
				p.setPreplanStatus(preplanStatus);
				preplanService.update(p);
			}else{//新增Opinion
				Reviews rv=new Reviews();
	    		Preplan p=preplanService.getByPpSn(preplanSn);
	    		rv.setOpinion(opinion);
	    		rv.setPreplanSn(p);
				reviewsService.save(rv);
				
				p.setPreplanStatus(preplanStatus);
				preplanService.update(p);
			}
		 }
		 return "jsonObject";
	 } 
	 
     /**
      * TODO(根据预案Sn查看review)
      * @param planSn
      * @return jsonArray review的属性jsonArray
      * */
	 public String getReviewByPlanSn(){
		 jsonObject.put("reviewOpinion","");//防止为空
		 if(preplanSn!=null){
			 Reviews r= reviewsService.getUniqueByPreplanSn(preplanSn);
			 if(r!=null){
				 jsonObject.put("reviewOpinion", r.getOpinion());
			 }
		 }
		 return "jsonObject";
	 }
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getReviewOrgCode() {
		return reviewOrgCode;
	}
	public void setReviewOrgCode(String reviewOrgCode) {
		this.reviewOrgCode = reviewOrgCode;
	}
	public String getPreplanSn() {
		return preplanSn;
	}
	public void setPreplanSn(String preplanSn) {
		this.preplanSn = preplanSn;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
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



	public String getPreplanStatus() {
		return preplanStatus;
	}



	public void setPreplanStatus(String preplanStatus) {
		this.preplanStatus = preplanStatus;
	}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
}
