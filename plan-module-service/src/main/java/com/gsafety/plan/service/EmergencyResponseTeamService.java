package com.gsafety.plan.service;

import com.gsafety.cloudframework.common.base.service.IBaseService;
import com.gsafety.plan.po.EmergencyResponseTeam;

public interface EmergencyResponseTeamService extends IBaseService{

	EmergencyResponseTeam getByEmergencyResponseTeamIType(String iType);

}
