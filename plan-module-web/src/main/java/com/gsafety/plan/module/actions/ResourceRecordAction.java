package com.gsafety.plan.module.actions;





import org.apache.struts2.convention.annotation.Namespace;


import com.gsafety.cloudframework.common.ui.list.action.ListAction;

import com.gsafety.plan.po.ResourceRecord;
/**
 * @author Administrator
 *
 */
@Namespace("/preplan")
public class ResourceRecordAction extends ListAction<ResourceRecord> {

	private String name;
	
	public String execute() {
		    return "main";
		  }
//	@Override
//	public String search(){
//		return "index";
//	}
//	
//	@Override
//	public boolean initSearch(Cnds cnds) {
//		// 可以在这里添加查询条件，比如查询
//		if(StringUtils.isNotEmpty(name)) {
//			cnds.and(CB.eq("name", name));			
//		}
//		return super.initSearch(cnds);
//	}
//	
//	@Override
//	public void postSearch(PageModel pageModel) {
//		List<Person> person = pageModel.getData();
//		//这里可以完成对数据的二次加工
//		
//		super.postSearch(pageModel);
//	}
//	
//	//保存前加工
//	@Override
//	protected boolean initSave(Person model) {
//		model.setSaveTime(new Date());
//		
//		return super.initSave(model);
//	}
//	
//	@Override
//	protected boolean postSave(Person model) {
//		// 可以在这里完成诸如附件保存的操作
//		return super.postSave(model);
//	}
//	
//	@Override
//	public void postEdit(Person model) {
//		// 可以在这里完成某些进入页面前的逻辑操作，比如修改PO中的状态或者是根据PO的部分信息去查询和PO相关的辅助数据，比如我们这里可以查当前Person所在的当地派出所数据。
//		super.postEdit(model);
//	}
//	
//	@Override
//	public boolean initDelete(Person model) {
//		//可以在这里完成诸如附件删除等逻辑操作，因为这里已经能拿到Person的相关信息了
//		return super.initDelete(model);
//	}
	//测试
	public void fine(){
		System.out.println("110");
		
	}

}

