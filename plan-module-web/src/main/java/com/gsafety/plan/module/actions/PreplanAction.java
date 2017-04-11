package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Domain;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.Privilege;
import com.gsafety.plan.po.ResourceRecord;
import com.gsafety.plan.po.Supply;
import com.gsafety.plan.service.DomainService;
import com.gsafety.plan.service.IPersonService;
import com.gsafety.plan.service.MissionService;
import com.gsafety.plan.service.PersonService;
import com.gsafety.plan.service.PreplanService;
import com.gsafety.plan.service.PrivilegeService;
import com.gsafety.plan.service.ResourceRecordService;
import com.gsafety.plan.service.SupplyService;
import com.opensymphony.xwork2.ActionContext;

@Namespace("/preplan")
public class PreplanAction extends ListAction<Preplan>{
  //注入service
	
    @Resource
    private PreplanService preplanService;   
    @Resource
    private PersonService personService;    
    @Resource
    private SupplyService supplyService;    
    @Resource
    private DomainService domainService;
    @Resource
    private MissionService missionService;
    @Resource
    private ResourceRecordService rrService;
    
    private String code;//传id
    private String ppSn;//值
  

    private String ppName;//预案名字
    private String ppDesc;//预案描述
    private String ppType;//预案分类Sn
    private String ppDept;//预案部门
    private String ppUid;//自定义预案编号
    


    private String misnName;//任务名字
    private String misnDept;//任务部门
    private String misnOrder;//序号


    private int page;
    private int rows;
    
    private String jsonObject;//返回判断
    
    
    
    // 输出
    public PrintWriter out() throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html");
        response.setContentType("text/plain; charset=utf-8");
        PrintWriter out = response.getWriter();
        return out;
    }
    
    //预案页面加载资源
    public String queryAllSrc() {
        //查询人力资源
        Cnds cndsPerson = Cnds.me(Person.class);        
        //查询物资资源
        Cnds cndsSupply = Cnds.me(Supply.class);
        try {
            //封装人力资源
            List<Person> personList = personService.getList(cndsPerson);
            JSONArray array = new JSONArray();
            for(Person p : personList) {
                JSONObject jo = new JSONObject();
                jo.put("group","人力");
                jo.put("SrcName", p.getPersonJob());
                array.add(jo);
            }
            //封装物资资源
            List<Supply> supplyList = supplyService.getList(cndsSupply);
            for(Supply s : supplyList) {
                JSONObject jo = new JSONObject();
                jo.put("group","物资");
                jo.put("SrcName", s.getSupplyName());
                array.add(jo);
            }
            
            //输出资源到页面
            String str = array.toString();
            out().print(str);
            out().flush();
            out().close();           
            
        }
        catch(Exception e){
            System.out.println("error");
        }
       
        return "jsonArray";
    }
    //保存预案
    public String saveOnlyPreplan() {
        Preplan ppModel=new Preplan();
        if(ppSn == null) {
            //获得当前预案时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //获得当前预案UUID（preplan_sn）
            String uuidPreplan = UUID.randomUUID().toString();                        
            ppModel.setPreplanTime(Timestamp.valueOf(sdf.format(System.currentTimeMillis())));
            ppModel.setPreplanSn(uuidPreplan);
        }else {
            ppModel=preplanService.getByPpSn(ppSn);           
            
        }   
        ppModel.setPreplanName(ppName);            
        ppModel.setPreplanDesc(ppDesc);
        ppModel.setResponDept(ppDept);            
        ppModel.setPreplanUID(ppUid);
        try{                  
            //放入预案分类SN(domain_sn)
            Domain dmModel =new Domain();
            dmModel.setDomainSn(ppType); 
                                   
            //二者不为空时存入数据库
            if(dmModel!=null&&ppModel!=null){
                Set<Domain> set = new HashSet<Domain>();
                set.add(dmModel);
                ppModel.setDomain(set);
                jsonObject = ppModel.getPreplanSn();
                if(ppSn == null) {
                    preplanService.save(ppModel);
                }else {
                    preplanService.update(ppModel);
                }
                                
            }else{
                jsonObject = "error";
               System.out.println("出错"); 
            }
        }catch(Exception e){
            jsonObject = "error";
            e.printStackTrace(); 
        }
        return "jsonObject";
    }
    
    //保存预案和相关任务
    public String savePreplan() throws UnsupportedEncodingException {
     
        //获得当前预案时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获得当前预案UUID（preplan_sn）
        String uuidPreplan = UUID.randomUUID().toString();
        Preplan ppModel=new Preplan();
        ppModel.setPreplanName(ppName);
        ppModel.setPreplanTime(Timestamp.valueOf(sdf.format(System.currentTimeMillis())));
        ppModel.setPreplanDesc(ppDesc);
        ppModel.setResponDept(ppDept);
        ppModel.setPreplanSn(uuidPreplan);
        
        
        try{   
            //放入预案分类SN(domain_sn)
            Domain dmModel =new Domain();
            dmModel.setDomainSn(ppType); 
            //二者不为空时存入数据库
            if(dmModel!=null&&ppModel!=null){
                ppModel.getDomain().add(dmModel);
                preplanService.save(ppModel);        
            }else{
               jsonObject = "error";
               System.out.println("出错"); 
            }
        }catch(Exception e){
            jsonObject = "error";
            System.out.println("bug"); 
        }
        
        
        try {
            HttpServletRequest req = ServletActionContext.getRequest();
            req.setCharacterEncoding("UTF-8");
            
            //获得预案数组-----每4个字段存储一个任务的相关信息
            String[] misList = req.getParameterValues("misArray");
            if(misList != null) {
                for(int i=0;i<misList.length;i+=4){
                    Mission misnModel = new Mission();
                    //获得当前任务UUID（mission_sn）
                    String uuidMission = UUID.randomUUID().toString();
                    misnModel.setMissionDefault("0");//默认任务
                    misnModel.setMissionSn(uuidMission);//任务唯一标号
                    misnModel.setPreplanSnM(ppModel);//与预案表关联
                    misnModel.setMissionOrder(misList[i+1]);//任务序号
                    misnModel.setMissionName(misList[i+2]);
                    misnModel.setResponDept(misList[i+3]);
                    missionService.save(misnModel);
                    System.out.println("保存任务"+misList[i+1]);
                    
                    //获得资源数组-----每4个字段存储一个资源的相关信息
                    String[] srcList = req.getParameterValues("srcArray");
                    if(srcList != null) {
                        for(int j=0;j<srcList.length;j+=4){
                            if(misList[i].equals(srcList[j])) {
                                String uuidSrc = UUID.randomUUID().toString();
                                ResourceRecord srcModel = new  ResourceRecord();
                                srcModel.setResourceName(srcList[j+1]);
                                srcModel.setResourceNumber(srcList[j+2]);
                                srcModel.setResourceUnit(srcList[j+3]);
                                srcModel.setMissionSnR(misnModel);
                                srcModel.setResourceSn(uuidSrc);
                                rrService.save(srcModel);
                                System.out.println("保存资源");
                                
                            }                                                       
                        } 
                    }
                 
                }  
            }
            
            jsonObject = "ok";   
        }catch(Exception e) {
            System.out.println("bug");
            jsonObject = "error";
        }
                                 
        return "jsonObject";
        
    }
    
    //预案列表
    public String queryPreplanList() throws IOException {
        String str="";
        if(code != null) {
            //如下
            JSONArray array = new JSONArray();
            int total=0;//记录数
            Domain d=domainService.get(Domain.class,Integer.parseInt(code));
                    if(d.getPreplan() != null) {
                        Set<Preplan> preplanSet =d.getPreplan();
                        Iterator<Preplan> ppModel = preplanSet.iterator();
                        //遍历所有符合条件的预案
                        while(ppModel.hasNext()){
                            Preplan p=ppModel.next();
                            JSONObject jo = new JSONObject();                            
                            jo.put("id",p.getId());
                            jo.put("preplanUid",p.getPreplanUID());
                            jo.put("preplanName",p.getPreplanName());  
                            jo.put("responDept",p.getResponDept()); 
                            jo.put("preplanSn",p.getPreplanSn());                                                    
                            jo.put("preplanType",d.getDomainName());
                            if(p.getPreplanTime() != null) {
                                jo.put("preplanTime",p.getPreplanTime().toString().split(" ")[0]); 
                            }
                            else {
                                jo.put("preplanTime",""); 
                            }
                            jo.put("preplanUID",p.getPreplanUID());
                            jo.put("preplanDesc",p.getPreplanDesc());
                            total+=1;
                            array.add(jo);    
                        }
                        
                    }
            str="{\"total\":"+total+",\"rows\":"+array.toString()+"}";   

        }
        else {
            //封装预案列表        
            str =preplanService.getPageList(page,rows);                      
            
        }
        //输出资源到页面
        out().print(str);
        out().flush();
        out().close();
        return "jsonArray";
    }
    
    //查看预案详情
    public String getDetail() {
        System.out.println(code);
        Preplan p=preplanService.get(Preplan.class,Integer.parseInt(code));
        
        if(p.getDomain() != null) {
            Set<Domain> d=p.getDomain();
            Iterator<Domain> dModel = d.iterator();
            while(dModel.hasNext()){
                Domain ddddd=dModel.next();
                //System.out.println(((Domain)dModel.next()).getDomainName());
                ActionContext.getContext().put("pp_type",ddddd.getDomainName());//预案分类
            }
        }     
        ActionContext.getContext().put("pp_sn",p.getPreplanSn());//预案preplan_sn
        ActionContext.getContext().put("pp_uid",p.getPreplanUID());//预案编号
        ActionContext.getContext().put("pp_name",p.getPreplanName());//预案名字
        ActionContext.getContext().put("pp_desc",p.getPreplanDesc());//预案描述
        ActionContext.getContext().put("pp_dept",p.getResponDept());//预案责任单位
        System.out.println(p.getPreplanUID());
        return "main";
    }
  //查看预案详情中查看任务
    public String queryMissionByPpsn() throws IOException {
        Preplan ppModel=new Preplan();
        ppModel.setPreplanSn(ppSn);
        //根据预案Sn查询任务列表
        List<Mission> misnList= missionService.getListByPpsn(ppModel);
        JSONArray array = new JSONArray();
       
        if(misnList.size()>0) {
          //封装任务列表
            for(Mission m : misnList) {
                JSONObject jo = new JSONObject();
                jo.put("missionId",m.getId());
                jo.put("missionOrder",m.getMissionOrder());
                jo.put("missionName",m.getMissionName());
                jo.put("missionDept",m.getResponDept());
                jo.put("missionSn",m.getMissionSn());
                array.add(jo);               
            }
        }
        
        
        //输出资源到页面
        String misstr = array.toString();
        out().print(misstr);
        out().flush();
        out().close();   
        return "jsonArray";
    }
    //根据任务SN查看资源
    public String querySrcByMisnSn() throws IOException {
        HttpServletRequest req = ServletActionContext.getRequest();
        req.setCharacterEncoding("UTF-8");
        
        //获得任务Sn数组,查询资源-----每4个字段存储一个任务的相关信息
        String[] misnSnArray = req.getParameterValues("misnSnArray");
        JSONArray srcArray = new JSONArray();
        if(misnSnArray != null) {           
            for(int i=0;i<misnSnArray.length;i++) {               
                //根据任务sn查询资源列表
                Mission misnModel=new Mission();
                misnModel.setMissionSn(misnSnArray[i]);
                List<ResourceRecord> srcList =rrService.getListByPpsn(misnModel);
                if(srcList.size()>0) {
                    for(ResourceRecord rr :srcList) {
                        JSONObject jo2 = new JSONObject();
                        jo2.put("srcId",rr.getId());
                        jo2.put("srcName",rr.getResourceName());
                        jo2.put("srcNumber",rr.getResourceNumber());
                        jo2.put("srcUnit",rr.getResourceUnit());
                        srcArray.add(jo2);                    
                    } 
                }
            }
        }
      //传回页面       
      String srcstr = srcArray.toString();
      System.out.println(srcstr);  
      out().print(srcstr);
      out().flush();
      out().close();   
      return "jsonArray";
    }
   
    //删除预案
    public String deletePreplan(){
        System.out.println(code);
        Preplan ppModel=preplanService.get(Preplan.class,Integer.parseInt(code));
        if(ppModel.getPreplanSn() != null) {
            //根据预案Sn查询任务列表
            List<Mission> misnList= missionService.getListByPpsn(ppModel); 
            if(misnList.size()>0) {
                try{
                    for(Mission m:misnList)
                    {
                        System.out.println(m);  
                                                                  
                        List<ResourceRecord> srcList =rrService.getListByPpsn(m);
                        for(ResourceRecord rr:srcList) {
                            System.out.println(rr);
                            rrService.delete(rr); 
                            
                        } 
                        missionService.delete(m);
                    }
                    
                }catch(Exception e) {
                    
                }
                
  
            }
            if(ppModel.getDomain() != null) {
                ppModel.getDomain().remove(ppModel.getDomain());
                preplanService.update(ppModel);
            }
            
            preplanService.delete(ppModel);    
        }
        return "jsonObject";
    }
    
    public String getPreplanById() {
        if(code != null) {
            Preplan p=preplanService.get(Preplan.class,Integer.parseInt(code));
            if(p.getDomain() != null) {
                Set<Domain> d=p.getDomain();
                Iterator<Domain> dModel = d.iterator();
                while(dModel.hasNext()){
                    Domain ddddd=dModel.next();
                    //System.out.println(((Domain)dModel.next()).getDomainName());
                    ActionContext.getContext().put("pp_type",ddddd.getDomainName());//预案分类
                }
            }
            
            ActionContext.getContext().put("pp_id",p.getId());//预案id
            ActionContext.getContext().put("pp_uid",p.getPreplanUID());//预案编号
            ActionContext.getContext().put("pp_sn",p.getPreplanSn());//预案preplan_sn
            ActionContext.getContext().put("pp_name",p.getPreplanName());//预案名字
            ActionContext.getContext().put("pp_desc",p.getPreplanDesc());//预案描述
            ActionContext.getContext().put("pp_dept",p.getResponDept());//预案责任单位 
        }

        return "main";
    }
    
    //删除预案任务
    public String deleteMission() {
        System.out.println(code);
        Mission misnModel=preplanService.get(Mission.class,Integer.parseInt(code));
        List<ResourceRecord> srcList =rrService.getListByPpsn(misnModel);
        for(ResourceRecord rr:srcList) {
            System.out.println(rr);
            rrService.delete(rr); 
            
        } 
        missionService.delete(misnModel);
        return "jsonArray";
    }
    

    
    //新增或更新任务
    public String updateMission(){        
        Mission m=new Mission();

        if(code==null ||code.equals("-101") ||code.length()<=0) {
            Preplan pp=new Preplan();
            pp.setPreplanSn(ppSn);
            String uuidMission = UUID.randomUUID().toString();
            m.setMissionName(misnName);
            m.setResponDept(misnDept);
            m.setMissionSn(uuidMission);
            System.out.println(misnOrder);
            m.setMissionOrder(misnOrder);
            m.setPreplanSnM(pp);
            missionService.save(m);
            jsonObject="new";
        }
        else {
            m.setMissionName(misnName);
            m.setResponDept(misnDept);
            System.out.println(misnOrder);
            m.setMissionOrder(misnOrder);
            m.setId(Integer.parseInt(code));
            missionService.updateById(m);
        }
        return "jsonObject";
    }
    

    
    //更新预案基础信息
    public String updatePreplanMsg() {
        Preplan ppModel=new Preplan();
        String pd="判断";
        //如果预案分类Sn未改变
        if(ppType.equals("空值")){
            pd=null;
        }
        //如果改变
        else {
            try{
                //先除去老的domain
                Preplan p=preplanService.get(Preplan.class,Integer.parseInt(code));
                if(p.getDomain() != null) {
                        Domain d=domainService.getBySn(ppType);
                        p.getDomain().remove(d);
                    
                }
                
                //放入预案分类SN(domain_sn)
                Domain dmModel =new Domain();
                dmModel.setDomainSn(ppType); 
                //二者不为空时存入数据库
                if(dmModel!=null&&ppModel!=null){
                    ppModel.getDomain().add(dmModel);
                    preplanService.save(ppModel);        
                }else{
                   System.out.println("出错"); 
                }
            }catch(Exception e){
                System.out.println("bug"); 
            }
        }

        
        ppModel.setId(Integer.parseInt(code));
        ppModel.setPreplanName(ppName);
        ppModel.setPreplanDesc(ppDesc);
        ppModel.setResponDept(ppDept);
        preplanService.updateById(ppModel,pd);
        return "jsonArray";
    }
    
    //添加新任务和资源
    public String addMisnSrc() {
        
        try {
            HttpServletRequest req = ServletActionContext.getRequest();
            req.setCharacterEncoding("UTF-8");
            //获得当前预案
            Preplan p=preplanService.get(Preplan.class,Integer.parseInt(code));
            Preplan ppModel=new Preplan();
            ppModel.setPreplanSn(p.getPreplanSn());
            //获得预案数组-----每4个字段存储一个任务的相关信息
            String[] misList = req.getParameterValues("misArray");
            if(misList != null) {
                for(int i=0;i<misList.length;i+=4){
                    Mission misnModel = new Mission();
                    //获得当前任务UUID（mission_sn）
                    String uuidMission = UUID.randomUUID().toString();
                    misnModel.setMissionDefault("0");//默认任务
                    misnModel.setMissionSn(uuidMission);//任务唯一标号
                    misnModel.setPreplanSnM(ppModel);//与预案表关联
                    misnModel.setMissionName(misList[i+2]);
                    misnModel.setResponDept(misList[i+3]);
                    missionService.save(misnModel);
                    System.out.println("保存任务");
                    
                    //获得资源数组-----每4个字段存储一个资源的相关信息
                    String[] srcList = req.getParameterValues("srcArray");
                    if(srcList != null) {
                        for(int j=0;j<srcList.length;j+=4){
                            if(misList[i].equals(srcList[j])) {
                                String uuidSrc = UUID.randomUUID().toString();
                                ResourceRecord srcModel = new  ResourceRecord();
                                srcModel.setResourceName(srcList[j+1]);
                                srcModel.setResourceNumber(srcList[j+2]);
                                srcModel.setResourceUnit(srcList[j+3]);
                                srcModel.setMissionSnR(misnModel);//与资源表关联
                                srcModel.setResourceSn(uuidSrc);
                                rrService.save(srcModel);
                                System.out.println("保存资源");
                                
                            }                                                       
                        } 
                    }
                 
                }  
            }
            
            jsonObject = "ok";   
        }catch(Exception e) {
            System.out.println("bug");
            jsonObject = "error";
        }
        return "jsonArray"; 
    }
    public String getJsonObject() {
        return jsonObject;
    }

    public void setJsonObject(String jsonObject) {
        this.jsonObject = jsonObject;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public String getPpName() {
        return ppName;
    }

    public void setPpName(String ppName) {
        this.ppName = ppName;
    }

    public String getPpDesc() {
        return ppDesc;
    }

    public void setPpDesc(String ppDesc) {
        this.ppDesc = ppDesc;
    }

    public String getPpType() {
        return ppType;
    }

    public void setPpType(String ppType) {
        this.ppType = ppType;
    }

    public String getPpDept() {
        return ppDept;
    }

    public void setPpDept(String ppDept) {
        this.ppDept = ppDept;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    public String getPpSn() {
        return ppSn;
    }

    public void setPpSn(String ppSn) {
        this.ppSn = ppSn;
    }
    
    public String getMisnName() {
        return misnName;
    }

    public void setMisnName(String misnName) {
        this.misnName = misnName;
    }

    public String getMisnDept() {
        return misnDept;
    }

    public void setMisnDept(String misnDept) {
        this.misnDept = misnDept;
    }
    public String getPpUid() {
        return ppUid;
    }

    public void setPpUid(String ppUid) {
        this.ppUid = ppUid;
    }
    public String getMisnOrder() {
        return misnOrder;
    }

    public void setMisnOrder(String misnOrder) {
        this.misnOrder = misnOrder;
    }
    
}
