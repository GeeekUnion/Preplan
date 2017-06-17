package com.gsafety.plan.service;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.PreplanLog;

public interface PreplanLogService extends IBaseService{
   JSONObject queryListByPreplanSn(Preplan preplanSn);
}
