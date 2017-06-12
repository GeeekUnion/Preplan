package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.Picture;
import com.gsafety.plan.po.Preplan;

public interface PictureServise extends IBaseService{

	Picture getPicByPlanSn(Preplan p);
	void deletePicByPlanSn(Preplan p);

}
