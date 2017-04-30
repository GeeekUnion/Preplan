package com.gsafety.plan.service.impl;

import java.sql.Timestamp;
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
import com.gsafety.plan.po.Domain;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.service.MissionService;
@Service
public class MissionServiceImpl extends BaseServiceImpl implements MissionService{
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
		String hql=" from Preplan p";
		PageResult pResult = baseDAO.getPageByHql(hql,pageNumber,pageSize,Preplan.class);
		List<Preplan> pList= (List<Preplan>)  pResult.getList();
		JSONArray array = new JSONArray();
		for(Preplan p:pList){
			JSONObject jo = new JSONObject();
			if(p.getEventSn().getEventName()==null||p.getEventSn().getEventName().length()<=0){
				jo.put("eventName", "");
			}else{
				jo.put("eventName", p.getEventSn().getEventName());
			}
			jo.put("preplanSn", p.getPreplanSn());
			jo.put("preplanName", p.getPreplanName());
			Timestamp timestamp = p.getPreplanTime();
			if (timestamp != null) {
				String timestamp2 = timestamp.toString();
				jo.put("preplanTime", timestamp2);
			} else {
				jo.put("preplanTime", "");
			}
			jo.put("responDept", p.getResponDept());
				array.add(jo);
		}
		String str="{\"total\":"+pResult.getPager().getRecordCount()+",\"rows\":"+array.toString()+"}";
        return str;
	}
	
	public String getPageMis(int pageNumber, int pageSize){
		String hql=" from Mission m";
		PageResult pResult = baseDAO.getPageByHql(hql,pageNumber,pageSize,Mission.class);
		List<Mission> pList= (List<Mission>)  pResult.getList();
		JSONArray array = new JSONArray();
		for(Mission p:pList){
			JSONObject jo = new JSONObject();
			jo.put("missionSn", p.getMissionSn());
			jo.put("missionMethod",p.getMissionMethod() );
			jo.put("missionStatus",p.getMissionStatus() );
			jo.put("responDept", p.getResponDept());
			jo.put("responPerson", p.getResponPerson());
				array.add(jo);
		}
		String str="{\"total\":"+pResult.getPager().getRecordCount()+",\"rows\":"+array.toString()+"}";
        return str;
	}

    @Override
    public List<Mission> getListByPpsn(Preplan ppModel) {
        // TODO Auto-generated method stub
        Map<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("preplanSnM", ppModel);
        String hql=" from Mission m where preplanSnM=:preplanSnM order by m.missionOrder";
        List<Mission> mList =baseDAO.getListByHql(hql, hashMap,Mission.class );
        return mList;
    }

    @Override
    public void updateById(Mission m) {
        // TODO Auto-generated method stub
        Map<String, Object> hashMap = new HashMap<String, Object>();
        String hql = "update Mission m set m.missionName=:missionName,m.responDept=:responDept,m.missionOrder=:missionOrder  where m.id=:id";            
        hashMap.put("missionName",m.getMissionName());
        hashMap.put("responDept",m.getResponDept());
        hashMap.put("missionOrder",m.getMissionOrder());
        hashMap.put("id",m.getId());
        baseDAO.updateByHql(hql,hashMap);
    }
    //通过Sn返回mission
	public Mission getByMissionSn(String missionSn){
		String hql="from Mission m where m.missionSn ="+"'"+missionSn+"'";
		Mission m =baseDAO.getUniqueByHql(hql,Mission.class);
		return m;
	}
	//
//	public String getByPreSn(String preplanSn,int pageNumber, int pageSize){
//		 Preplan preModel =new Preplan();
//		 preModel.setPreplanSn(preplanSn);
//		 Map<String ,Object> map =new HashMap<String ,Object>();
//		 map.put("preplanSnM", preModel);
//		 String hql="from Mission m where preplanSnM =:preplanSnM";
//		 List<Mission> miList =baseDAO.getListByHql(hql, map, Mission.class);
//		
//		 JSONArray array = new JSONArray();
//		 int total=0;
//		 if(miList.size()>0){
//			 for(Mission m:miList){
//				 JSONObject jo =new JSONObject();
//				 jo.put("missionDefault", m.getMissionDefault());
//				 jo.put("missionName", m.getMissionName());
//				 jo.put("preplanSnM", m.getPreplanSnM().getPreplanSn());
//				 jo.put("missionSn", m.getMissionSn());
//				 jo.put("missionMethod",m.getMissionMethod() );
//				 jo.put("missionStatus",m.getMissionStatus() );
//			 	 jo.put("responDept", m.getResponDept());
//			 	 jo.put("responPerson", m.getResponPerson());
//			 	    total+=1;
//			     	array.add(jo);
//			 } 
//		 }
//		String str="{\"total\":"+total+",\"rows\":"+array.toString()+"}";
//        return str;
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	
	
	
	


