package com.gsafety.plan.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Picture;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.PictureServise;
@Service
public class PictureServiceImpl extends BaseServiceImpl implements PictureServise{

	@Override
	public Picture getPicByPlanSn(Preplan p) {
		Map<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("preplanSn", p);
        String hql=" from Picture p where p.preplanSn=:preplanSn";
        Picture pic=baseDAO.getUniqueByHql(hql, hashMap,Picture.class); 
		return pic;
	}

    @Override
    public void deletePicByPlanSn(Preplan p) {
        Map<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("preplanSn", p);
        String hql="delete from Picture p where p.preplanSn=:preplanSn";
        baseDAO.deleteByHql(hql, hashMap);    
        
    }

}
