package com.gsafety.plan.service;

import net.sf.json.JSONArray;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface PageMsgService extends IBaseService{
    JSONArray getTree();

}
