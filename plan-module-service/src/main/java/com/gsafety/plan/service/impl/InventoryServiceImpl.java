package com.gsafety.plan.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.dao.IBaseDAO;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.Inventory;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.Supply;
import com.gsafety.plan.service.InventoryService;
import com.gsafety.plan.service.SupplyService;
@Service
public class InventoryServiceImpl extends BaseServiceImpl implements InventoryService{
	@Resource(name="baseDAO")
	 protected IBaseDAO baseDAO;

	public IBaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(IBaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}

	@Override
	public String getPage(int pageNumber, int pageSize) {
		String str="";
		String hql=" from Inventory i";
		PageResult pResult = baseDAO.getPageByHql(hql,pageNumber,pageSize,Inventory.class);
		List<Inventory> pList= (List<Inventory>)  pResult.getList();
		JSONArray array = new JSONArray();
		for(Inventory p:pList){
			JSONObject jo = new JSONObject();
		    jo.put("id", p.getId());
		    jo.put("inventoryName", p.getInventoryName());
		    jo.put("inventorySn", p.getInventorySn());
		    jo.put("latitude", p.getLatitude());
		    jo.put("longitude", p.getLongitude());
		    jo.put("inventoryPrincipal", p.getInventoryPrincipal());
		    jo.put("inventoryPrincipalPhone", p.getInventoryPrincipalPhone());
				array.add(jo);
		}
		 str="{\"recordsTotal\":"+pResult.getPager().getRecordCount()+",\"data\":"+array.toString()+"}";
         System.out.println(str);    
        return str;
	}
	@Override
	public JSONArray getMapInventory() {
		 String hql="from Inventory i";
		 List<Inventory> sList= (List<Inventory>) baseDAO.getListByHql(hql);
		 JSONArray array = new JSONArray();
		 for(Inventory p:sList){
			 JSONObject jo = new JSONObject();
			    jo.put("id", p.getId());
			    jo.put("inventoryName", p.getInventoryName());
			    jo.put("inventorySn", p.getInventorySn());
			    jo.put("latitude", p.getLatitude());
			    jo.put("longitude", p.getLongitude());
			    jo.put("inventoryPrincipal", p.getInventoryPrincipal());
			    jo.put("inventoryPrincipalPhone", p.getInventoryPrincipalPhone());
					array.add(jo);
		 }
	        return array;

}
    //获取地图上的使用者附近的资源等
	@Override
	public JSONArray getMapVicinity() {
		 String sql="select * from pre_inventory where sqrt(( ((117.147683-pre_inventory.inventory_longitude)*PI()*12656*cos(((34.220772+pre_inventory.inventory_latitude)/2)*PI()/180)/180)  *  ((117.147683-pre_inventory.inventory_longitude)*PI()*12656*cos (((34.220772+pre_inventory.inventory_latitude)/2)*PI()/180)/180)  )  +  (  ((34.220772-pre_inventory.inventory_latitude)*PI()*12656/180)  *  ((34.220772-pre_inventory.inventory_latitude)*PI()*12656/180)))<10";
		 
          System.out.println(sql);
		 List<Inventory> sList= baseDAO.getListBySql(sql,Inventory.class);
		
		 
		 JSONArray array = new JSONArray();
		 for(Inventory p:sList){
			 JSONObject jo = new JSONObject();
			    jo.put("id", p.getId());
			    jo.put("inventoryName", p.getInventoryName());
			    jo.put("inventorySn", p.getInventorySn());
			    jo.put("latitude", p.getLatitude());
			    jo.put("longitude", p.getLongitude());
			    jo.put("inventoryPrincipal", p.getInventoryPrincipal());
			    jo.put("inventoryPrincipalPhone", p.getInventoryPrincipalPhone());
					array.add(jo);
		 }
		
		 return array;
	}

}