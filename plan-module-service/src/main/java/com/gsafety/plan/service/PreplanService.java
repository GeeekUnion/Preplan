package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Preplan;

public interface PreplanService extends IBaseService{

    String getPageList(int page, int rows);

    void updateById(Preplan ppModel,String pd);

    Preplan getByPpSn(String ppSn);

}
