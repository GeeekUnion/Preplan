package com.gsafety.plan.module.util;


import com.itextpdf.layout.Document;


public class Testp {

   public static String url="G:\\test4.pdf";
   
   public static void main(String[] args) throws Exception {  
       
	   long old = System.currentTimeMillis();
	   
	   PDFUtil pdfUtil=new PDFUtil(url);//传入路径+文件名,使用工具类
       Document doc= pdfUtil.createPdfDoc();    
       
       pdfUtil.addTitle(doc, "我是标题");//添加标题
       pdfUtil.addHeading1(doc,"标题1");
       pdfUtil.addParagraph(doc,"内容11111111");
       pdfUtil.addHeading1(doc,"标题2");
       pdfUtil.addHeading2(doc,"标题2.1");
       pdfUtil.addParagraph(doc,"内容2.1"); 
       pdfUtil.addHeading2(doc,"标题2.2");
       pdfUtil.addParagraph(doc,"内容2.2"); 
       doc.close();
       
	   long now = System.currentTimeMillis();
       System.out.println("共耗时：" + ((now - old) / 1000.0) + "秒\n\n" + "文件保存在:" + url);
   }  
  
   
   
}
