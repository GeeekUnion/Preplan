package com.gsafety.plan.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface PageMsgService extends IBaseService{
    JSONArray getTree();

    JSONObject getPageMsgByOrder(String order);

}
