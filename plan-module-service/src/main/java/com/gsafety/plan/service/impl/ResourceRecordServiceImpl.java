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
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.ResourceRecord;
import com.gsafety.plan.service.ResourceRecordService;


@Service
public class ResourceRecordServiceImpl extends BaseServiceImpl implements ResourceRecordService{
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
		String hql=" from ResourceRecord r";
		PageResult pResult = baseDAO.getPageByHql(hql,pageNumber,pageSize,ResourceRecord.class);
		List<ResourceRecord> pList= (List<ResourceRecord>)  pResult.getList();
		JSONArray array = new JSONArray();
		for(ResourceRecord p:pList){
			JSONObject jo = new JSONObject();
			 jo.put("resourceName", p.getResourceName());
			 jo.put("resourceNumber", p.getResourceNumber());
			 jo.put("resourceUnit", p.getResourceUnit());
			 jo.put("resourceSn", p.getResourceSn());
			 jo.put("missionSn", p.getMissionSnR());
			 
			 
				array.add(jo);
		}
		String str="{\"total\":"+pResult.getPager().getRecordCount()+",\"rows\":"+array.toString()+"}";
        return str;
	}

    @Override
    public List<ResourceRecord> getListByPpsn(Mission misnModel) {
        // TODO Auto-generated method stub
        Map<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("missionSnR", misnModel);
        String hql=" from ResourceRecord r where missionSnR=:missionSnR";
        List<ResourceRecord> mList =baseDAO.getListByHql(hql, hashMap,ResourceRecord.class );
        return mList;
    }
	
	
}
