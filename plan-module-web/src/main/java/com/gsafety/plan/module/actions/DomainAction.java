package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Domain;
import com.gsafety.plan.service.DomainService;

@Namespace("/preplan")
public class DomainAction extends ListAction<Domain>{
    
    @Resource
    private DomainService domainService;
    
    // 输出
    public PrintWriter out() throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html");
        response.setContentType("text/plain; charset=utf-8");
        PrintWriter out = response.getWriter();
        return out;
    }
    //查找所有预案分类,不带分页
    public String queryAllDomain() throws IOException{
        String str =domainService.queryAllDomainName();
        out().print(str);
        out().flush();
        out().close();
        return "jsonArray";     
    }
}
