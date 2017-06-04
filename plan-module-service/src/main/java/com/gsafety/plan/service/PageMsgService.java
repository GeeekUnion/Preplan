package com.gsafety.plan.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.PageMsg;

public interface PageMsgService extends IBaseService{
    JSONArray getTree(String pmType);

    JSONObject getPageMsgByOrder(String order);

	JSONArray getOrderPageMsg(String pmType);
	
	JSONArray getSonMsg(PageMsg pm);
	JSONArray getParentMsg();

}
