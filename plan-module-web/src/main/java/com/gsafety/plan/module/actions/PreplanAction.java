package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
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
import com.gsafety.plan.po.Supply;
import com.gsafety.plan.service.DomainService;
import com.gsafety.plan.service.IPersonService;
import com.gsafety.plan.service.MissionService;
import com.gsafety.plan.service.PersonService;
import com.gsafety.plan.service.PreplanService;
import com.gsafety.plan.service.PrivilegeService;
import com.gsafety.plan.service.SupplyService;

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
    
    private String code;
    private String ppName;//预案名字
    private String ppDesc;//预案描述
    private String ppType;//预案分类
    private String ppDept;//预案部门
    
    private int page;
    private int rows;
    

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
    
    
    //保存预案和相关任务
    public String savePreplan() throws UnsupportedEncodingException {
        //获得当前预案时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获得当前预案UUID（preplan_sn）
        String uuidPreplan = UUID.randomUUID().toString();
        Preplan ppModel=new Preplan();
        ppModel.setPreplanName(ppName);
//        ppModel.setPreplanTime(Timestamp.valueOf(sdf.format(System.currentTimeMillis())));
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
               System.out.println("出错"); 
            }
        }catch(Exception e){
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
                    misnModel.setPreplanSn(ppModel);//与预案表关联
                    misnModel.setMissionName(misList[i+2]);
                    misnModel.setResponDept(misList[i+3]);
                    missionService.save(misnModel);
                    System.out.println("保存任务");
                    
                    //获得资源数组-----每4个字段存储一个资源的相关信息
                    String[] srcList = req.getParameterValues("srcArray");
                    if(srcList != null) {
                        for(int j=0;j<srcList.length;j+=4){
                            if(misList[i].equals(srcList[j])) {
                                System.out.println("存储资源");
                            }                                                       
                        } 
                    }
                 
                }  
            }
        }catch(Exception e) {
            System.out.println("bug");
            String returnpd="error";
        }
        

        
        
      
                                  
        return "jsonArray";
        
    }
    
    //预案列表
    public String queryPreplanList() throws IOException {
        Cnds cndsPreplan = Cnds.me(Preplan.class);
        String str="";
        if(ppDept != null) {
            Domain dmModel = new Domain();
            dmModel.setDomainSn(ppType);
            Preplan ppModel=new Preplan();
            if(dmModel != null) {
                
            }
            WhereSet set = ConditionBuilder.whereSet(ConditionBuilder.eq("name", "zhangsan"));
            str="";
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
    
}
