package com.gsafety.plan.service;

import net.sf.json.JSONObject;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.po.Preplan;

public interface PreplanService extends IBaseService{

    String getPageList(int page, int rows);

    void updateById(Preplan ppModel,String pd);

    Preplan getByPpSn(String ppSn);

    String getPageListByUser(int page, int rows, Person p);

	String queryPreplanReviewListByUser(Person p);

	JSONObject queryReviewsMsg(String orgCode);

}
