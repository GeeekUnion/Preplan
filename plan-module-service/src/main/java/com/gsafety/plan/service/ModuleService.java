package com.gsafety.plan.service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.base.service.IBaseService;

public interface ModuleService extends IBaseService{

    JSONObject queryModulePagerByPpsn(int page, int rows, String preplanSn);

}
