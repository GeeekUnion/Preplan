package com.gsafety.plan.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.dao.IBaseDAO;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Inventory;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Preplan;
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
			 jo.put("supplyUnit", s.getSupplyUnit());
			 jo.put("id", s.getId());
			 jo.put("supplyLatitude", s.getSupplyLatitude());
			 jo.put("supplyLongitude", s.getSupplyLongitude());
			 jo.put("supplyPrincipal", s.getSupplyPrincipal());
			 jo.put("supplyPrincipalPhone", s.getSupplyPrincipalPhone());
			 array.add(jo);	 
		 }
	        return array;
		
	}

//	@Override
//	public String getPageByCode(int pageNumber, int pageSize,String code) {
//		
//		String hql="  from Supply s where s.inventorySnM.inventorySn="+code;
//		//不是getpageByHql吗方法
//		PageResult pResult = baseDAO.getPageByHql(hql,pageNumber,pageSize,Supply.class);
//		
//		List<Supply> sList= (List<Supply>)  pResult.getList();
//		 JSONArray array = new JSONArray();
//		 for(Supply s:sList){
//			 JSONObject jo = new JSONObject();
//			 jo.put("supplyName", s.getSupplyName());
//			 jo.put("supplySn", s.getSupplySn());
//			 jo.put("supplyNumber", s.getSupplyNumber());
//			 jo.put("supplyUnit", s.getSupplyUnit());
//			 jo.put("id", s.getId());
//			 array.add(jo);	 
//		 }
//		 String str="{\"total\":"+pResult.getPager().getRecordCount()+",\"rows\":"+array.toString()+"}";
//	        return str;
//		
//	}
	@Override
	public String getPageByCode(int pageNumber, int pageSize,String code) {
		Inventory iModel = new Inventory();
		iModel.setInventorySn(code);
		Map<String ,Object> map =new HashMap<String ,Object>();
		 map.put("inventorySnM", iModel);
		String hql="  from Supply s where s.inventorySnM.inventorySn=:code";
		 List<Supply> sList =baseDAO.getListByHql(hql, map, Supply.class);
		 JSONArray array = new JSONArray();
		 int total=0;
		 for(Supply s:sList){
			 JSONObject jo = new JSONObject();
			 jo.put("supplyName", s.getSupplyName());
			 jo.put("supplySn", s.getSupplySn());
			 jo.put("supplyNumber", s.getSupplyNumber());
			 jo.put("supplyUnit", s.getSupplyUnit());
			 jo.put("id", s.getId());
			 total+=1;
			 array.add(jo);	 
		 }
		 String str="{\"total\":"+total+",\"rows\":"+array.toString()+"}";
	        return str;
		
	}
	

	
}
