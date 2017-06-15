package com.gsafety.plan.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.base.dao.IBaseDAO;
import com.gsafety.cloudframework.common.base.page.PageResult;
import com.gsafety.cloudframework.common.base.service.impl.BaseServiceImpl;
import com.gsafety.plan.po.EmergencyResponseTeam;
import com.gsafety.plan.po.Hazard;
import com.gsafety.plan.po.Inventory;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.ProtectionObject;
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
    //所有的map页面，地图加载产生的查询，都在这个方法下
	@Override
	public String getPage(int pageNumber, int pageSize,String clickType,double lo,double la) {
		String str="";
		JSONArray array = new JSONArray();
		System.out.println(lo);
		System.out.println(la);
			String sql=" select inventory_longitude as longitude,inventory_latitude as latitude,inventory_name as name,inventory_sn as sn ,id ,inventory_iType as iType,inventory_pri,inventory_priPhone from pre_inventory  where sqrt(( (("+lo
					+"-pre_inventory.inventory_longitude)*PI()*12656*cos((("+la+"+pre_inventory.inventory_latitude)/2)*PI()/180)/180)  *  (("+lo
					+"-pre_inventory.inventory_longitude)*PI()*12656*cos ((("+la+"+pre_inventory.inventory_latitude)/2)*PI()/180)/180)  )  +  (  (("+la
					+"-pre_inventory.inventory_latitude)*PI()*12656/180)  *  (("+la+"-pre_inventory.inventory_latitude)*PI()*12656/180)))<22";
		    ArrayList<Object[]> List =(ArrayList<Object[]>) baseDAO.getListBySql(sql);
			PageResult pResult = baseDAO.getPageBySql(sql, pageNumber, pageSize);
			for(int i=0;i<List.size();i++){
				JSONObject jo = new JSONObject();
				jo.put("longitude", List.get(i)[0]);
				jo.put("latitude", List.get(i)[1]);
				jo.put("name", List.get(i)[2]);
				jo.put("sn", List.get(i)[3]);
				jo.put("id", List.get(i)[4]);
				jo.put("iType", List.get(i)[5]);
				jo.put("inventoryPrincipal", List.get(i)[6]);
				jo.put("inventoryPrincipalPhone", List.get(i)[7]);
					array.add(jo);
			}	
		str="{\"recordsTotal\":"+pResult.getPager().getRecordCount()+",\"data\":"+array.toString()+"}"; 
        System.out.println(str);    
        return str;
	}
	@Override
	public String getPageHazard(int pageNumber, int pageSize, String clickType) {
		String str="";
		JSONArray array = new JSONArray();
			String sql="select hazard_longitude as longitude,hazard_latitude as latitude,hazard_name as name,hazard_sn as sn ,id ,hazard_iType as iType from pre_hazard  where sqrt(( ((117.147683-hazard_longitude)*PI()*12656*cos(((34.220772+hazard_latitude)/2)*PI()/180)/180)  *  ((117.147683-hazard_longitude)*PI()*12656*cos (((34.220772+hazard_latitude)/2)*PI()/180)/180)  )  +  (  ((34.220772-hazard_latitude)*PI()*12656/180)  *  ((34.220772-hazard_latitude)*PI()*12656/180)))<22";
		    ArrayList<Object[]> List =(ArrayList<Object[]>) baseDAO.getListBySql(sql);
			PageResult pResult = baseDAO.getPageBySql(sql, pageNumber, pageSize);
			for(int i=0;i<List.size();i++){
				JSONObject jo = new JSONObject();
				jo.put("longitude", List.get(i)[0]);
				jo.put("latitude", List.get(i)[1]);
				jo.put("name", List.get(i)[2]);
				jo.put("sn", List.get(i)[3]);
				jo.put("id", List.get(i)[4]);
				jo.put("iType", List.get(i)[5]);
					array.add(jo);
			}	
		str="{\"recordsTotal\":"+pResult.getPager().getRecordCount()+",\"data\":"+array.toString()+"}"; 
        System.out.println(str);    
        return str;
	}
	@Override
	public String getPageEmergencyResponseTeam(int pageNumber, int pageSize,
			String clickType) {
		String str="";
		JSONArray array = new JSONArray();
			String sql="select emergencyResponseTeam_longitude as longitude,emergencyResponseTeam_latitude as latitude,emergencyResponseTeam_name as name,emergencyResponseTeam_sn as sn, id ,emergencyResponseTeam_iType as iType from pre_emergencyresponseteam where sqrt(( ((117.147683-emergencyResponseTeam_longitude)*PI()*12656*cos(((34.220772+emergencyResponseTeam_latitude)/2)*PI()/180)/180)  *  ((117.147683-emergencyResponseTeam_longitude)*PI()*12656*cos (((34.220772+emergencyResponseTeam_latitude)/2)*PI()/180)/180)  )  +  (  ((34.220772-emergencyResponseTeam_latitude)*PI()*12656/180)  *  ((34.220772-emergencyResponseTeam_latitude)*PI()*12656/180)))<22";
		    ArrayList<Object[]> List =(ArrayList<Object[]>) baseDAO.getListBySql(sql);
			PageResult pResult = baseDAO.getPageBySql(sql, pageNumber, pageSize);
			for(int i=0;i<List.size();i++){
				JSONObject jo = new JSONObject();
				jo.put("longitude", List.get(i)[0]);
				jo.put("latitude", List.get(i)[1]);
				jo.put("name", List.get(i)[2]);
				jo.put("sn", List.get(i)[3]);
				jo.put("id", List.get(i)[4]);
				jo.put("iType", List.get(i)[5]);
					array.add(jo);
			}	
		str="{\"recordsTotal\":"+pResult.getPager().getRecordCount()+",\"data\":"+array.toString()+"}"; 
        System.out.println(str);    
        return str;
	}

	@Override
	public String getPageProtectionObject(int pageNumber, int pageSize,
			String clickType) {
		String str="";
		JSONArray array = new JSONArray();
			String sql="select protectionObject_longitude as longitude,protectionObject_latitude as latitude,protectionObject_name as name,protectionObject_sn as sn ,id ,protectionObject_iType as iType from pre_protectionobject where sqrt(( ((117.147683-protectionObject_longitude)*PI()*12656*cos(((34.220772+protectionObject_latitude)/2)*PI()/180)/180)  *  ((117.147683-protectionObject_longitude)*PI()*12656*cos (((34.220772+protectionObject_latitude)/2)*PI()/180)/180)  )  +  (  ((34.220772-protectionObject_latitude)*PI()*12656/180)  *  ((34.220772-protectionObject_latitude)*PI()*12656/180)))<22";
		    ArrayList<Object[]> List =(ArrayList<Object[]>) baseDAO.getListBySql(sql);
			PageResult pResult = baseDAO.getPageBySql(sql, pageNumber, pageSize);
			for(int i=0;i<List.size();i++){
				JSONObject jo = new JSONObject();
				jo.put("longitude", List.get(i)[0]);
				jo.put("latitude", List.get(i)[1]);
				jo.put("name", List.get(i)[2]);
				jo.put("sn", List.get(i)[3]);
				jo.put("id", List.get(i)[4]);
				jo.put("iType", List.get(i)[5]);
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
		//填22，因为好像距离计算有问题
		 String sql="select inventory_longitude as longitude,inventory_latitude as latitude,inventory_name as name,inventory_sn as sn ,inventory_iType as iType from pre_inventory  where sqrt(( ((117.147683-pre_inventory.inventory_longitude)*PI()*12656*cos(((34.220772+pre_inventory.inventory_latitude)/2)*PI()/180)/180)  *  ((117.147683-pre_inventory.inventory_longitude)*PI()*12656*cos (((34.220772+pre_inventory.inventory_latitude)/2)*PI()/180)/180)  )  +  (  ((34.220772-pre_inventory.inventory_latitude)*PI()*12656/180)  *  ((34.220772-pre_inventory.inventory_latitude)*PI()*12656/180)))<22"+
				" UNION "+ 
				"select hazard_longitude as longitude,hazard_latitude as latitude,hazard_name as name,hazard_sn as sn,hazard_iType as iType from pre_hazard where sqrt(( ((117.147683-hazard_longitude)*PI()*12656*cos(((34.220772+hazard_latitude)/2)*PI()/180)/180)  *  ((117.147683-hazard_longitude)*PI()*12656*cos (((34.220772+hazard_latitude)/2)*PI()/180)/180)  )  +  (  ((34.220772-hazard_latitude)*PI()*12656/180)  *  ((34.220772-hazard_latitude)*PI()*12656/180)))<22" +
		        " UNION "+
				"select emergencyResponseTeam_longitude as longitude,emergencyResponseTeam_latitude as latitude,emergencyResponseTeam_name as name,emergencyResponseTeam_sn as sn,emergencyResponseTeam_iType as iType from pre_emergencyresponseteam where sqrt(( ((117.147683-emergencyResponseTeam_longitude)*PI()*12656*cos(((34.220772+emergencyResponseTeam_latitude)/2)*PI()/180)/180)  *  ((117.147683-emergencyResponseTeam_longitude)*PI()*12656*cos (((34.220772+emergencyResponseTeam_latitude)/2)*PI()/180)/180)  )  +  (  ((34.220772-emergencyResponseTeam_latitude)*PI()*12656/180)  *  ((34.220772-emergencyResponseTeam_latitude)*PI()*12656/180)))<22" +
		        " UNION "+
				"select protectionObject_longitude as longitude,protectionObject_latitude as latitude,protectionObject_name as name,protectionObject_sn as sn,protectionObject_iType as iType from pre_protectionobject where sqrt(( ((117.147683-protectionObject_longitude)*PI()*12656*cos(((34.220772+protectionObject_latitude)/2)*PI()/180)/180)  *  ((117.147683-protectionObject_longitude)*PI()*12656*cos (((34.220772+protectionObject_latitude)/2)*PI()/180)/180)  )  +  (  ((34.220772-protectionObject_latitude)*PI()*12656/180)  *  ((34.220772-protectionObject_latitude)*PI()*12656/180)))<22" ;


		 // String sql="select inventory_longitude,inventory_latitude,inventory_name,inventory_sn from pre_inventory";
        ArrayList<Object[]> List =(ArrayList<Object[]>) baseDAO.getListBySql(sql);
        JSONArray array = new JSONArray();
		for(int i=0;i<List.size();i++){
			JSONObject jo = new JSONObject();
			
			jo.put("longitude", List.get(i)[0]);
			jo.put("latitude", List.get(i)[1]);
			jo.put("name", List.get(i)[2]);
			jo.put("sn", List.get(i)[3]);
			jo.put("iType", List.get(i)[4]);
		    //获取Sn里面的第一个char，以此来区分不同的资源点类型
			   try {
			   String iType=(String) List.get(i)[3];
			    char fisrtChar=iType.charAt(0);
				switch(fisrtChar){
				case 'a':
					jo.put("type","inventory" );
					break;
				case 'b':
					jo.put("type","hazard" );
					break;
				case 'c':
					jo.put("type","emergencyResponseTeam" );
					break;
				case 'd':
					jo.put("type","protectionObject" );
					break;	
				default:
				    jo.put("type","inventory" );
				}
			} catch (Exception e) {
				System.out.println("iType不存在或者iType的命名不规范，iType首字母不是a/b/c/d等");
			}
			array.add(jo);
		}
		 return array;
	}

	  @Override
	    public Inventory getByInventoryIType(String iType) {
	        Cnds cnds1 = Cnds.me(Inventory.class);
	        WhereSet set = ConditionBuilder.whereSet(ConditionBuilder.eq("iType", iType));
	        cnds1.and(set);      
	        return baseDAO.getUniqueByCnds(cnds1);
	    }
	  
	
	
	
	
	

}