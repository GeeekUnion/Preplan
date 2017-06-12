package com.gsafety.plan.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.base.dao.IBaseDAO;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.EmergencyResponseTeam;
import com.gsafety.plan.service.EmergencyResponseTeamService;
import com.gsafety.plan.service.HazardService;
@Service
public class EmergencyResponseTeamServiceImpl extends BaseServiceImpl implements EmergencyResponseTeamService{
	@Resource(name="baseDAO")
	 protected IBaseDAO baseDAO;

	public IBaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(IBaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}
	@Override
    public EmergencyResponseTeam getByEmergencyResponseTeamIType(String iType) {
        Cnds cnds1 = Cnds.me(EmergencyResponseTeam.class);
        WhereSet set = ConditionBuilder.whereSet(ConditionBuilder.eq("iType", iType));
        cnds1.and(set);      
        return baseDAO.getUniqueByCnds(cnds1);
    }
}
