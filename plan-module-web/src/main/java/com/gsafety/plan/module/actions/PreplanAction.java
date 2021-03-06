package com.gsafety.plan.module.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.interceptor.SessionAware;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.base.conditions.ConditionBuilder;
import com.gsafety.cloudframework.common.base.conditions.where.WhereSet;
import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.module.util.PDFUtil;
import com.gsafety.plan.po.Domain;
import com.gsafety.plan.po.Mission;
import com.gsafety.plan.po.Module;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.po.Picture;
import com.gsafety.plan.po.Preplan;
import com.gsafety.plan.po.Privilege;
import com.gsafety.plan.po.ResourceRecord;
import com.gsafety.plan.po.Supply;
import com.gsafety.plan.service.DomainService;
import com.gsafety.plan.service.FlowChartContentService;
import com.gsafety.plan.service.IPersonService;
import com.gsafety.plan.service.MissionService;
import com.gsafety.plan.service.ModuleService;
import com.gsafety.plan.service.PageMsgService;
import com.gsafety.plan.service.PersonService;
import com.gsafety.plan.service.PictureServise;
import com.gsafety.plan.service.PreplanService;
import com.gsafety.plan.service.PrivilegeService;
import com.gsafety.plan.service.ResourceRecordService;
import com.gsafety.plan.service.ReviewsService;
import com.gsafety.plan.service.SupplyService;
import com.itextpdf.layout.Document;
import com.opensymphony.xwork2.ActionContext;

@Namespace("/preplan")
public class PreplanAction extends ListAction<Preplan>implements SessionAware{
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
    @Resource
    private ModuleService moduleService;
    
    @Resource
    private PageMsgService pageMsgService;
    
    @Resource 
    private FlowChartContentService  flowChartContentService;
    
    
    @Resource
    private PictureServise pictureService;
    
    @Resource
    private ReviewsService reviewsService;
    
    private String code;//传id
    private String ppSn;//预案sn
  

    private String ppName;//预案名字
    private String ppDesc;//预案描述
    private String ppType;//预案分类Sn
	private String classify;//分类
    private String ppDept;//预案部门
    private String ppUid;//自定义预案编号
    
    private String preplanStatus;//预案状态

    private String misnName;//任务名字
    private String misnDept;//任务部门
    private String misnOrder;//序号
    private String version;//版本号
    
    private String preplanSpecialist;//预案专家组
    
    private String pageMsgType;//决定是
    
    private String pageMaker;
    
    private InputStream downloadFilePath;//下载文件流
    private String downloadFileName;//下载文件名


    private int page;
    private int rows;
    
    private String jsonObject;//返回判断
    private JSONArray myJsonArray = new JSONArray();
    private JSONObject myJsonObject = new JSONObject();
    
    //用于封装会话session
    protected Map<String, Object> session;  
    
    
    // 输出
    public PrintWriter out() throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html");
        response.setContentType("text/plain; charset=utf-8");
        PrintWriter out = response.getWriter();
        return out;
    }
    
    
    public String editSkip() {
        ActionContext.getContext().put("moduleOrder","\'"+code+"\'");//第一布
        String moduleOrderNext=""; 
        if(null!=code) {
            int codeNext=Integer.parseInt(code)+1;
              if(codeNext>9) {
            	  if(codeNext>1000){//简单预案
            		  moduleOrderNext= "\'"+codeNext+"\'";
            	  }else{//全案
            		  moduleOrderNext="\'00"+codeNext+"\'";    
            	  }
                
              }else {
                moduleOrderNext="\'000"+codeNext+"\'"; 
              }
        }                       
        ActionContext.getContext().put("moduleOrderNext",moduleOrderNext);//下一步
        ActionContext.getContext().put("planSn",ppSn);//预案Sn
        return "url";   
    }
    
    //保存预案
    public String saveOnlyPreplan() {
        Preplan ppModel=new Preplan();
        if(ppSn == null || ppSn.length()<=0) {
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
        ppModel.setClassify(classify);//分类
        ppModel.setPreplanDesc(ppDesc);
        ppModel.setReviewOrg(ppDept);//审核部门
        ppModel.setResponDept(session.get("preplanOrgCode").toString()); //sesion获得负责部门           
        ppModel.setPreplanUID(ppUid);
        ppModel.setPreplanSpecialist(preplanSpecialist);
        
        
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
                if(ppSn == null || ppSn.length()<=0) {
                	Calendar startTime = Calendar.getInstance();
                	int year = startTime.get(Calendar.YEAR);//获取年份
            		String yearTow=String.valueOf(year).substring(2);
            		String month=String.valueOf(startTime.get(Calendar.MONTH));//月份
            		String date=String.valueOf(startTime.get(Calendar.DAY_OF_MONTH));//日
                	version="0";
                	ppModel.setVersion(version);               	
                    ppModel.setPreplanStatus("待完成");                   
                    preplanService.save(ppModel);
                    
                    
                }else {                    
                    preplanService.update(ppModel);
                }
               
                jsonObject=ppModel.getPreplanSn();
                                
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
    
    /**
     * TODO(根据预案sn查询预案)
     * 
     * */
    public String getUniqueByPreplanSn() {
        if(null != ppSn && ppSn.length()>0) {            
           Preplan p= preplanService.getByPpSn(ppSn);
           if(null!=p) {
               JSONObject jo=new JSONObject();   
               Set<Domain> set=p.getDomain();
               int preplanDomainId=0;
               String  preplanDomainName="";
               for (Domain d : set) {  
                   preplanDomainId=d.getId();
                   preplanDomainName=d.getDomainName();
                   
               }             
               jo.put("preplanDesc",p.getPreplanDesc());
               jo.put("preplanName",p.getPreplanName());
               jo.put("preplanTime",p.getPreplanTime().toString().split(" ")[0]); 
               jo.put("preplanUID",p.getPreplanUID());
               jo.put("preplanClassify", p.getClassify());
               jo.put("preplanDomain",preplanDomainId); 
               jo.put("preplanDomainName",preplanDomainName); 
               jo.put("preplanOrgId", p.getResponDept());
               jo.put("preplanReviewOrg",p.getReviewOrg());  
               jo.put("preplanSpecialist", p.getPreplanSpecialist());
               myJsonArray.add(jo);
           }
        }
        return "myJsonArray"; 
        
    }
    /**
     * TODO(根据预案sn设置预案状态)
     * 
     * */
    public String updatePreplanStatus(){
    	if(null!=ppSn){
    		Preplan p=preplanService.getByPpSn(ppSn);
    		p.setPreplanStatus(preplanStatus);    		
    		preplanService.update(p);
    		jsonObject="ok";
    		return "jsonObject";
    	}    	
    	return "jsonObject";
    }
    
    
    /**
     * TODO(根据用户部门查询预案审核提示)
     * @return JSONObject[size,preplanList]
     * */
    public String queryReviewsMsg(){
    	String orgCode=session.get("preplanOrgCode").toString();
        if(null != orgCode && orgCode.length()>0) {
        	myJsonObject=  preplanService.queryReviewsMsg(orgCode);
        	return "myJsonObject";
        }
    	return "myJsonObject";
    }
    
    
    /**
     * @param ppSn 预案sn
     * @param pageMsgType 判断全案/简案
     * */
    public String uploadPlanPdf() throws Exception{
    	long old = System.currentTimeMillis();
    	String docTitleDesc="";
    	if(null != ppSn && ppSn.length()>0) { 
            Preplan p= preplanService.getByPpSn(ppSn);
            String docTitle=p.getPreplanName();   
            String saveRealFilePath = ServletActionContext.getServletContext().getRealPath("/doc");//上传路径 
            if(pageMsgType.equals("1")) {
                docTitleDesc="全案";  
            }else {
                docTitleDesc="简案";  
            }
            String fileName="/"+docTitle+docTitleDesc+p.getVersion()+".pdf";//预案名字
            File fileDir = new File(saveRealFilePath);  
            if (!fileDir.exists()) { //如果不存在 则创建   
                fileDir.mkdirs();  
            }              
            PDFUtil pdfUtil=new PDFUtil(saveRealFilePath+fileName);//传入路径+文件名
            Document doc= pdfUtil.createPdfDoc();      
       
        	try {    		           	            	                         	            
     	            pdfUtil.addTitle(doc,docTitle);//放置标题
     	            JSONArray jay=pageMsgService.getOrderPageMsg(pageMsgType);
     	            for (int i = 0; i < jay.size(); i++) {
     	            	JSONObject jo = jay.getJSONObject(i); // 遍历 jsonarray 数组，把每一个对象转成 json 对象
     	            	if(jo.getString("titleNum").equals("#")) {
     	            	    
     	            	}
     	            	else {
                            pdfUtil.addHeading1(doc,jo.getString("titleNum")+" "+jo.getString("title"));//一级标题
                            JSONArray sonJay=jo.getJSONArray("son");
                            for (int j = 0; j < sonJay.size(); j++) {
                                JSONObject sonJo = sonJay.getJSONObject(j); // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                                pdfUtil.addHeading2(doc,sonJo.getString("titleNum")+" "+sonJo.getString("title"));//二级标题
                                Module md=moduleService.getUniqueByPpsnOrder(ppSn,sonJo.getString("order"));                    
                                if(md!=null){
                                    String pg=md.getContent();
                                    String reg = "<br[\\s\\S]*?>";
                                    pg=pg.replaceAll(reg,"<p>");
                                    org.jsoup.nodes.Document docParse= Jsoup.parseBodyFragment(pg);//格式化html
                                    Element body = docParse.body();//放入body片段 
                                    
                                    //System.out.println(body.ownText());
                                    Elements allTag=body.children();//获得儿子标签列表 
                                    //如果存在标签，就获标签得内容，不然则直接显示内容                              
                                    if(allTag.size()>0){
                                        for(Element e: allTag){
                                            String eContent=e.text();
                                            if(eContent.length()>0){//不为空
                                            	 //判断是否存在表格
                                            	 if("table".equals(e.nodeName())){
                                            		 pdfUtil.addTable(doc, e);
                                            	 }else{
                                            		 pdfUtil.addParagraph(doc,eContent);   
                                            	 }                                                                                             
                                            }else if(e.nodeName()=="img"){//插入图片          
                                                String srcText=e.attr("src");
                                                pdfUtil.addImg(doc, srcText.substring(srcText.lastIndexOf("\\")+1));
                                            }else if(e.nodeName()=="br"){
                                                pdfUtil.addParagraph(doc," "); 
                                            }else{
                                                
                                            }
                                        }
                                    }else{
                                         System.out.println(body.text());
                                         pdfUtil.addParagraph(doc,body.text());
                                    }
                                        
                                }
                                
                            }
     	            	}

     				}
     	        System.out.println(fileName);  
     	        myJsonObject.put("status",fileName);    
     	          
    		} catch (Exception e) {
    		    myJsonObject.put("status","error");   
    			 e.printStackTrace();
    			 
    		}finally{
    			doc.close();
    		}	
    	}
        long now = System.currentTimeMillis();
        System.out.println("共耗时：" + ((now - old) / 1000.0) + "秒\n\n");
    	return "myJsonObject";
    }
    
    
    /**
     *TODO(根据路径下载pdf)
     *@param path
     **/
    public String getPdfByUrl(){   	
    	String saveRealFilePath = ServletActionContext.getServletContext().getRealPath("/doc");//下载路径 
    	saveRealFilePath=saveRealFilePath+downloadFileName;
    	System.out.println(saveRealFilePath);  
    	downloadFileName=downloadFileName.replace("/", "");
    	try {
    		downloadFileName=URLEncoder.encode(downloadFileName,"UTF-8");//解决中文乱码
			downloadFilePath=new FileInputStream(saveRealFilePath);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return SUCCESS;
    	
    }
    
    
    public String queryPlanList(){
    		preplanService.getPageList(page,rows);
    	 return "plan_edit";
    }
    
    /**
     *TODO(根据登录的用户查询预案编辑列表)
     *@param orgCode
     **/
    public String queryPreplanList() throws IOException {
        String str="";
        String orgCode=session.get("preplanOrgCode").toString();
        System.out.println(preplanStatus);
        if(null != orgCode && orgCode.length()>0) {
            Person p=new Person();
            p.setOrgCode(orgCode);
            str=preplanService.getPageListByUser(page,rows,p,preplanStatus);
        }        
        //输出资源到页面
        out().print(str);
        out().flush();
        out().close();
        return "jsonArray";
    }
    
    /**
     * TODO(根据登录的用户查询预案审核列表)
     * @param orgCode
     * @throws IOException 
     **/
    public String queryPreplanReviewList() throws IOException{
    	 String str="";
         String orgCode=session.get("preplanOrgCode").toString();
         if(null != orgCode && orgCode.length()>0) {
             Person p=new Person();
             p.setOrgCode(orgCode);
             str=preplanService.queryPreplanReviewListByUser(p);
         }    
	     //输出资源到页面
	     out().print(str);
	     out().flush();
	     out().close();
    	return "jsonArray";
    }
    
   
   
    /**
     * 删除预案
     * 
     * */
    public String deletePreplan(){
        Preplan ppModel=preplanService.get(Preplan.class,Integer.parseInt(code));
        if(ppModel.getPreplanSn() != null) {
            pictureService.deletePicByPlanSn(ppModel);
            reviewsService.deleteReviewsByPreplanSn(ppModel.getPreplanSn());
            flowChartContentService.deleteFLContentByPlanSn(ppModel);;
            if(ppModel.getDomain() != null) {
                ppModel.getDomain().remove(ppModel.getDomain());
                preplanService.update(ppModel);
            }
            myJsonObject.put("status","ok");
            preplanService.delete(ppModel);    
        }
        return "myJsonObject";
    }
    
    
    /**
     * 修改预案版本号
     * @param preplanSn
     * */
    public String  changeVersion(){
    	if(null!=ppSn){
    		Preplan p=preplanService.getByPpSn(ppSn);
    		version=p.getVersion();
    		Calendar startTime = Calendar.getInstance();
    		int year = startTime.get(Calendar.YEAR);//获取年份
    		String yearTow=String.valueOf(year).substring(2);
    		String month=String.valueOf(startTime.get(Calendar.MONTH));//月份
    		String date=String.valueOf(startTime.get(Calendar.DAY_OF_MONTH));//日
    		if(null!=version && version.length()>0){  			
    			int i=Integer.parseInt(version)+1;//最后一个点后面的数字   	
    			
    			version=i+"";
    		}else{
    			version="1";
    		}   
    		p.setVersion(version);
    		myJsonObject.put("preplanVersion", version);
    		preplanService.update(p);
    	}
    	return "myJsonObject";   	
    }
    
    
    
    //------------------------new/old---------------------------
    
   

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
        List<Module> moduleList=moduleService.getListByPpsn(ppSn);
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
                jo.put("missionState", "isMis");
                array.add(jo);               
            }
        }
        
        for(Module md:moduleList) {
            JSONObject jo2 = new JSONObject();
            jo2.put("missionOrder",md.getOrder());//模块序号
            jo2.put("missionName",md.getTitle());
            jo2.put("missionDept",md.getContent()); 
            jo2.put("missionState", "isMdu");
            array.add(jo2); 
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
                Mission misn = missionService.getByMissionSn(misnModel.getMissionSn());
                List<ResourceRecord> srcList =rrService.getListByPpsn(misnModel);
                if(srcList.size()>0) {
                    for(ResourceRecord rr :srcList) {
                        JSONObject jo2 = new JSONObject();
                        jo2.put("srcId",rr.getId());
                        jo2.put("srcName",rr.getResourceName());
                        jo2.put("srcNumber",rr.getResourceNumber());
                        jo2.put("srcUnit",rr.getResourceUnit());
                        jo2.put("srcMis", misn.getMissionName());
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
        ppModel.setPreplanUID(ppUid);
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
    
      
    public String getClassify() {
		return classify;
	}


	public void setClassify(String classify) {
		this.classify = classify;
	}


	public String getMisnOrder() {
        return misnOrder;
    }

    public void setMisnOrder(String misnOrder) {
        this.misnOrder = misnOrder;
    }

    public JSONArray getMyJsonArray() {
        return myJsonArray;
    }


    public void setMyJsonArray(JSONArray myJsonArray) {
        this.myJsonArray = myJsonArray;
    }
    

    public String getPreplanStatus() {
		return preplanStatus;
	}


	public void setPreplanStatus(String preplanStatus) {
		this.preplanStatus = preplanStatus;
	}
	
	

	public JSONObject getMyJsonObject() {
		return myJsonObject;
	}


	public void setMyJsonObject(JSONObject myJsonObject) {
		this.myJsonObject = myJsonObject;
	}

	
	public String getPreplanSpecialist() {
		return preplanSpecialist;
	}


	public void setPreplanSpecialist(String preplanSpecialist) {
		this.preplanSpecialist = preplanSpecialist;
	}

	
	
	public String getPageMsgType() {
		return pageMsgType;
	}


	public void setPageMsgType(String pageMsgType) {
		this.pageMsgType = pageMsgType;
	}
	
	

	public String getVersion() {
		return version;
	}


	public void setVersion(String version) {
		this.version = version;
	}


	public String getPageMaker() {
		return pageMaker;
	}


	public void setPageMaker(String pageMaker) {
		this.pageMaker = pageMaker;
	}





	public InputStream getDownloadFilePath() {
		return downloadFilePath;
	}


	public void setDownloadFilePath(InputStream downloadFilePath) {
		this.downloadFilePath = downloadFilePath;
	}


	public String getDownloadFileName() {
		return downloadFileName;
	}


	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
	}


	@Override
    public void setSession(Map<String, Object> session) {
        this.session=session;
    }
}
