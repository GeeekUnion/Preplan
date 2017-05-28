package com.gsafety.plan.service.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
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
    public JSONArray getTree() {
        Cnds cnds=Cnds.me(PageMsg.class);   
        List<PageMsg> pmMsgList=baseDAO.getListByCnds(cnds);
        JSONArray jsonArray=new JSONArray();
        for(PageMsg pm:pmMsgList) {
            JSONObject jo=new JSONObject();
            jo.put("id", pm.getId());
            jo.put("order", pm.getOrder());
            jo.put("text", pm.getTitle());//title
            jo.put("textDesc", pm.getTitleDesc());//titleDesc
            
            
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
     * @return 页面必要信息
     * */
    @Override
    public JSONObject getPageMsgByOrder(String order) {
        JSONObject jo=new JSONObject();
        Cnds cnds=Cnds.me(PageMsg.class); 
        cnds.and(ConditionBuilder.eq("order",order));
        PageMsg pm=baseDAO.getUniqueByCnds(cnds);
        if(null!=pm) {
            Cnds cnds2=Cnds.me(PageMsg.class);
            cnds2.and(ConditionBuilder.eq("id",pm.getSupId()));
            PageMsg supPm=baseDAO.getUniqueByCnds(cnds2); 
            jo.put("supOrder",supPm.getOrder());//父顺序
            jo.put("supTitle",supPm.getTitle());//父标题
            jo.put("supTitleDesc", supPm.getTitleDesc());//父标题描述
        }
        jo.put("moduleOrder",pm.getOrder());
        jo.put("moduleTitle",pm.getTitle());//子标题

        return jo;
    }

}
