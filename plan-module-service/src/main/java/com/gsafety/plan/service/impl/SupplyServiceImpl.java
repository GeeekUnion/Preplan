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
			 //下面是inventory部分
			 jo.put("idIn",s.getInventorySnM().getId() );
			 jo.put("inventoryName",s.getInventorySnM().getInventoryName() );
			 jo.put("code", s.getInventorySnM().getInventorySn());
			 jo.put("inventoryLatitude", s.getInventorySnM().getInventoryLatitude());
			 jo.put("inventoryLongitude", s.getInventorySnM().getInventoryLongitude());
			 jo.put("inventoryPrincipal", s.getInventorySnM().getInventoryPrincipal());
			 jo.put("inventoryPrincipalPhone", s.getInventorySnM().getInventoryPrincipalPhone());
			 array.add(jo);	 
		 }
	        return array;
		
	}

     //输出方式有问题
	@Override
	public JSONObject getPageByCode(int pageNumber, int pageSize,String code) {
		Inventory iModel = new Inventory();
		iModel.setInventorySn(code);
		Map<String ,Object> map =new HashMap<String ,Object>();
		 map.put("inventorySnM", iModel);
		String hql="  from Supply s where s.inventorySnM=:inventorySnM";
		//String hql2="select count(s)  from Supply s where s.inventorySnM.inventorySn="+code;
		
		System.out.println(hql);
		//System.out.println(hql2);
		
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
		  JSONObject jsonObject = new JSONObject();
		  jsonObject.put("row",array);
		  jsonObject.put("total",total );
		 return jsonObject;
		
	}

	@Override
	public String getPageByCode2(int pageNumber, int pageSize, String code) {
		Inventory iModel = new Inventory();
		iModel.setInventorySn(code);
		Map<String ,Object> map =new HashMap<String ,Object>();
		 map.put("inventorySnM", iModel);
		String hql="  from Supply s where s.inventorySnM=:inventorySnM";
		//String hql2="select count(s)  from Supply s where s.inventorySnM.inventorySn="+code;
		
		System.out.println(hql);
		//System.out.println(hql2);
		
		 List<Supply> sList =baseDAO.getListByHql(hql, map, Supply.class);
		 JSONArray array = new JSONArray();
		 int total=0;
		 for(Supply s:sList){
			 JSONObject jo = new JSONObject();
			 jo.put("supplyName", s.getSupplyName());
			 jo.put("supplySn", s.getSupplySn());
			 jo.put("supplyNumber", s.getSupplyNumber());
			 jo.put("supplyUnit", s.getSupplyUnit());
			 jo.put("code", s.getInventorySnM().getInventorySn());
			 jo.put("id", s.getId());
			 total+=1;
			 array.add(jo);	 
		 }
		 String str="{\"total\":"+total+",\"rows\":"+array.toString()+"}";
	        return str;
	}
	

	
}
