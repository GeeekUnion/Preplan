package com.gsafety.plan.module.util;

public class ContentParseUtil {
	/**
	 * 消除HTML标签
	 * @param content 需要解析的文本
	 * */
	public String ParseContent(String content){
		String regex = "<[\\s\\S]*?>";//去除所有HTML标签（<>之间的内容全去除）
		String regexstr = "<(?!h|/h|br|p|/p).*?>";//去除所有HTML标签（除了h标题、段落、换格标签）
		content=content.replaceAll(regexstr,"");
		
		return content;
	}
}
