package com.gsafety.plan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.dao.IBaseDAO;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Supply;
import com.gsafety.plan.service.SupplyService;
@Service
public class SupplyServiceImpl extends BaseServiceImpl implements SupplyService{
	@Resource(name="baseDAO")
	 protected IBaseDAO baseDAO;
	
	public IBaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(IBaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}
	 public String getAllSupply(){
		 String hql="from Supply s";
		 List<Supply> sList= (List<Supply>) baseDAO.getListByHql(hql);
		 JSONArray array = new JSONArray();
		 for(Supply s:sList){
			 JSONObject jo = new JSONObject();
			 jo.put("supplyName", s.getSupplyName());
			 jo.put("supplySn", s.getSupplySn());
			 jo.put("supplyNumber", s.getSupplyNumber());
			 jo.put("id", s.getId());
			 jo.put("supplyLatitude", s.getSupplyLatitude());
			 jo.put("supplyLongitude", s.getSupplyLongitude());
			 jo.put("supplyPrincipal", s.getSupplyPrincipal());
			 jo.put("supplyPrincipalPhone", s.getSupplyPrincipalPhone());
			 array.add(jo);	 
		 }
 
		 String str=array.toString();
	        return str;
	 }
     //返回类型不一样
	@Override
	public JSONArray getMapSupply() {
		 String hql="from Supply s";
		 List<Supply> sList= (List<Supply>) baseDAO.getListByHql(hql);
		 JSONArray array = new JSONArray();
		 for(Supply s:sList){
			 JSONObject jo = new JSONObject();
			 jo.put("supplyName", s.getSupplyName());
			 jo.put("supplySn", s.getSupplySn());
			 jo.put("supplyNumber", s.getSupplyNumber());
			 jo.put("id", s.getId());
			 jo.put("supplyLatitude", s.getSupplyLatitude());
			 jo.put("supplyLongitude", s.getSupplyLongitude());
			 jo.put("supplyPrincipal", s.getSupplyPrincipal());
			 jo.put("supplyPrincipalPhone", s.getSupplyPrincipalPhone());
			 array.add(jo);	 
		 }
	        return array;
		
	}

	
}
