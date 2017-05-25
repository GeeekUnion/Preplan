package com.gsafety.plan.service.impl;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.service.PageMsgService;
@Service
public class PageMsgServiceImpl extends BaseServiceImpl implements PageMsgService{
    
    /**
     * 获得pageMsg的树列表
     * */
    @Override
    public JSONArray getTree() {
        //baseDAO.getListByCnds();
        return null;
    }

}
