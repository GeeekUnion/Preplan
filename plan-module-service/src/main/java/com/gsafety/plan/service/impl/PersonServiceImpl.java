package com.gsafety.plan.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.basecode.po.EmsOrg;
import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.cloudframework.common.base.util.encrypt.DESCoder;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.service.PersonService;
import com.gsafety.cloudframework.login.business.IEmsPrivsBusiness;
import com.gsafety.cloudframework.login.util.LoginActionHelper;
import com.gsafety.cloudframework.menu.po.EmsMenu;
import com.gsafety.cloudframework.priv.util.vo.PrivBean;
import com.gsafety.cloudframework.runtime.vo.EmsPrivVo;
import com.gsafety.cloudframework.runtime.vo.EmsUserVo;
import com.gsafety.cloudframework.runtime.vo.SessionBean;
import com.gsafety.cloudframework.system.service.constant.AuthConstant;
import com.gsafety.cloudframework.user.po.EmsUser;
@Service
public class PersonServiceImpl extends BaseServiceImpl implements
PersonService{
	
	@Resource
	private IEmsPrivsBusiness emsPrivsBusiness;
	
	@Override
	public Person getPersonByUname(String username, String password) {
		// TODO Auto-generated method stub
		Cnds cnds1 = Cnds.me(EmsUser.class);
		WhereSet set = ConditionBuilder.whereSet(ConditionBuilder.eq("loginName", username));
		cnds1.and(set);
		EmsUser eu = (EmsUser) baseDAO.getUniqueByCnds(cnds1);
		Person pr=new Person();     
		if(null != eu) {
		        Cnds cndsOrg = Cnds.me(EmsOrg.class);
		        WhereSet setOrg = ConditionBuilder.whereSet(ConditionBuilder.eq("orgCode", eu.getOrgCode()));
		        cndsOrg.and(setOrg);
		        EmsOrg org =baseDAO.getUniqueByCnds(cndsOrg);
		        EmsMenu defaultMenu =new EmsMenu();		        		        
		        try {   
		            LoginActionHelper.sessionBeanHandler(null, eu, org, defaultMenu);
		            pr.setPassword(DESCoder.decrypt(eu.getPassword(), AuthConstant.PASSWORD_KEY));
		            pr.setLoginName(eu.getName());
		            pr.setOrgCode(org.getOrgCode());
		        } catch (Exception e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        }   
		}

		
		
		return pr;
	}

}
