package com.gsafety.plan.service;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Module;

public interface ModuleService extends IBaseService{

    JSONObject queryModulePagerByPpsn(int page, int rows, String preplanSn);

    List<Module> getListByPpsn(String ppSn);

}
