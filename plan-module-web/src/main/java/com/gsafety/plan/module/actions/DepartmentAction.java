package com.gsafety.plan.module.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;

import com.gsafety.cloudframework.common.base.conditions.Cnds;
import com.gsafety.cloudframework.common.ui.list.action.ListAction;
import com.gsafety.plan.po.Department;
import com.gsafety.plan.po.Person;
import com.gsafety.plan.service.DepartmentService;

@Namespace("/preplan")
public class DepartmentAction extends ListAction<Department>{
  //注入service
    @Resource
    private DepartmentService departmentService;
    
    // 输出
    public PrintWriter out() throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html");
        response.setContentType("text/plain; charset=utf-8");
        PrintWriter out = response.getWriter();
        return out;
    }
    
    public String queryAllDept() throws IOException {
        //查询所有部门
        JSONArray array = new JSONArray();
        Cnds cndsDepartment = Cnds.me(Department.class);
        List<Department> dpmList = departmentService.getList(cndsDepartment);
        for(Department d : dpmList) {
            JSONObject jo = new JSONObject();
            jo.put("id",d.getId());
            jo.put("DeptName", d.getDeptName());
            array.add(jo);
        }
        //输出部门到页面
        String str = array.toString();
        out().print(str);
        out().flush();
        out().close();
        return "jsonArray";
    }
}
