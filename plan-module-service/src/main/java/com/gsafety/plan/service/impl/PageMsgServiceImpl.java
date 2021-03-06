package com.gsafety.plan.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.PageMsg;
import com.gsafety.plan.service.PageMsgService;
@Service
public class PageMsgServiceImpl extends BaseServiceImpl implements PageMsgService{
    
    /**
     * 获得pageMsg的树列表
     * @return jsonArray
     * */
    @Override
    public JSONArray getTree(String pmType) {
        Cnds cnds=Cnds.me(PageMsg.class); 
        cnds.and(ConditionBuilder.eq("type",pmType));//1全案，2简案
        cnds.asc("order");
        List<PageMsg> pmMsgList=baseDAO.getListByCnds(cnds);
        JSONArray jsonArray=new JSONArray();
        for(PageMsg pm:pmMsgList) {
            JSONObject jo=new JSONObject();
            jo.put("id", pm.getId());
            jo.put("order", pm.getOrder());
            jo.put("text", pm.getTitleNum()+" "+pm.getTitle());//title
            jo.put("textDesc",pm.getTitleDesc());//titleDesc
            
            
            int parentId=pm.getSupId();
            if(parentId==0) {
                jo.put("parent", "#");
            }else {
                jo.put("parent", parentId);
            }
            JSONObject jo2=new JSONObject();
            jo2.put("onclick","changePage("+"\'"+pm.getOrder()+"\'"+")");
            jo.put("a_attr", jo2);
            jsonArray.add(jo);
        }
        return jsonArray;
    }

    /**
     * 根据order获得pageMsg
     * @return 页面必要信息：子标题→父标题
     * */
    @Override
    public JSONObject getPageMsgByOrder(String order) {
        JSONObject jo=new JSONObject();
        Cnds cnds=Cnds.me(PageMsg.class); 
        cnds.and(ConditionBuilder.eq("order",order));
        PageMsg pm=baseDAO.getUniqueByCnds(cnds);
        if(null!=pm && pm.isSupTitleCheck()==false) {//不为空且为子标题
            Cnds cnds2=Cnds.me(PageMsg.class);
            cnds2.and(ConditionBuilder.eq("id",pm.getSupId()));
            PageMsg supPm=baseDAO.getUniqueByCnds(cnds2); 
            jo.put("supOrder",supPm.getOrder());//父顺序
            jo.put("supTitle",supPm.getTitle());//父标题
            jo.put("supModuleTitleNum",supPm.getTitleNum());//父标题号
            jo.put("supTitleDesc", supPm.getTitleDesc());//父标题描述
        }
        jo.put("moduleOrder",pm.getOrder());
        jo.put("moduleTitle",pm.getTitle());//子标题
        jo.put("moduleTitleNum", pm.getTitleNum());//子标题号
        jo.put("isRequireCheck", pm.isRequireCheck());//需求
        jo.put("requireContent", pm.getRequireContent());
        jo.put("isExampleCheck", pm.isExampleCheck());//例子
        jo.put("exampleContent", pm.getExampleContent());
        
        return jo;
    }
    
    /**
     * 获得pageMsg所有标题的列表（子标题在父标题下）
     * @return jsonArray
     * */    
	@Override
	public JSONArray getOrderPageMsg(String pmType) {
		JSONArray jsonArray=new JSONArray();
		Cnds cnds=Cnds.me(PageMsg.class);  
        WhereSet set = ConditionBuilder.whereSet(ConditionBuilder.eq("type", pmType));
        set.and(ConditionBuilder.eq("supTitleCheck",true));
        cnds.and(set);
        List<PageMsg> pmMsgList=baseDAO.getListByCnds(cnds);

        for(PageMsg pm:pmMsgList){
        	JSONObject jo=new JSONObject();
        	JSONArray sonJsonArray=getSonMsg(pm);//获得子标题
        	jo.put("id", pm.getId());
        	jo.put("order", pm.getOrder());
        	jo.put("title", pm.getTitle());
        	jo.put("titleDesc",pm.getTitleDesc());  
        	jo.put("titleNum", pm.getTitleNum());//标题号
        	jo.put("son",sonJsonArray); 
        	jsonArray.add(jo);
        	
        }
		return jsonArray;
	}
	
    /**
     * 获得pageMsg子标题的列表
     * @return jsonArray
     * */
	@Override
	public JSONArray getSonMsg(PageMsg pm) {
		JSONArray jsonArray=new JSONArray();
        Cnds cnds=Cnds.me(PageMsg.class);  
        cnds.and(ConditionBuilder.eq("supId",pm.getId()));
        List<PageMsg> pmMsgList=baseDAO.getListByCnds(cnds);
        for(PageMsg pMsg:pmMsgList){
        	JSONObject jo=new JSONObject();
        	jo.put("id", pMsg.getId());
        	jo.put("order", pMsg.getOrder());
        	jo.put("title", pMsg.getTitle());
        	jo.put("titleDesc",pMsg.getTitleDesc());  
        	jo.put("titleNum", pMsg.getTitleNum());//标题号
        	jsonArray.add(jo);
        }
		return jsonArray;
	}
	
    /**
     * 获得pageMsg父标题的列表
     * @return jsonArray
     * */
	@Override
	public JSONArray getParentMsg() {
		JSONArray jsonArray=new JSONArray();
		return null;
	}

}
