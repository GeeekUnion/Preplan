package com.gsafety.plan.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.hibernate.LobHelper;
import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.SqlParams;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.Reviews;
import com.gsafety.plan.service.ReviewsService;
@Service
public class ReviewsServiceImpl extends BaseServiceImpl implements ReviewsService {

	@Override
	public Reviews getUniqueByPreplanSn(String preplanSn) {
		Map<String, Object> hashMap = new HashMap<String, Object>();
		Preplan ppModel=new Preplan();
		ppModel.setPreplanSn(preplanSn);
        hashMap.put("preplanSn", ppModel);
        String hql=" from Reviews r where r.preplanSn=:preplanSn";
		return baseDAO.getUniqueByHql(hql, hashMap, Reviews.class);
	}

    @Override
    public void deleteReviewsByPreplanSn(String preplanSn) {
        Map<String, Object> hashMap = new HashMap<String, Object>();
        Preplan ppModel=new Preplan();
        ppModel.setPreplanSn(preplanSn);
        hashMap.put("preplanSn", ppModel);
        String hql="delete from Reviews r where r.preplanSn=:preplanSn";
        baseDAO.deleteByHql(hql, hashMap);
        
    }



	
}
