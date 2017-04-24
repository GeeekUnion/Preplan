package com.gsafety.plan.service.impl;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.service.PersonService;
@Service
public class PersonServiceImpl extends BaseServiceImpl implements
PersonService{

	@Override
	public Person getPersonByUname(String username, String password) {
		// TODO Auto-generated method stub
		String sql="select * from FW_T_EMS_USER emsuser where emsuser.LOGIN_NAME = "+"\'"+username+"\'";
		Object[] obj=(Object[]) baseDAO.getUniqueBySql(sql);		
		Person pr=new Person();		
		if( obj == null){
			
		}else{
			String psw=(String) obj[3];
			System.out.println("psw"+psw);
			pr.setPassword(psw);
		}
		return pr;
	}

}
