package com.gsafety.plan.service.impl;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.cloudframework.common.base.util.encrypt.DESCoder;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.service.PersonService;
import com.gsafety.cloudframework.system.service.constant.AuthConstant;
import com.gsafety.cloudframework.user.po.EmsUser;
@Service
public class PersonServiceImpl extends BaseServiceImpl implements
PersonService{

	@Override
	public Person getPersonByUname(String username, String password) {
		// TODO Auto-generated method stub
		Cnds cnds1 = Cnds.me(EmsUser.class);
		WhereSet set = ConditionBuilder.whereSet(ConditionBuilder.eq("loginName", username));
		cnds1.and(set);
		EmsUser eu = (EmsUser) baseDAO.getUniqueByCnds(cnds1);
		Person pr=new Person();		
		try {
			System.out.println(password.equals(DESCoder.decrypt(eu.getPassword(), AuthConstant.PASSWORD_KEY)));
			pr.setPassword(DESCoder.decrypt(eu.getPassword(), AuthConstant.PASSWORD_KEY));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return pr;
	}

}
