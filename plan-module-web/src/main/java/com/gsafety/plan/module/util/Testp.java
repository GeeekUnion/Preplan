package com.gsafety.plan.module.util;



import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;


public class Testp {

   //public static String url="G:\\test4.pdf";

   
   public static void main(String[] args) throws Exception {  
       
	   long old = System.currentTimeMillis();
	   
	   String DEST2 = "G:\\test4.pdf";//文件路径
	   PdfFont sysFont = PdfFontFactory.createFont("STSongStd-Light", "UniGB-UCS2-H", false);//中文设置 
	   PdfDocument pdfDoc = new PdfDocument(new PdfWriter(DEST2));   
	   Document doc = new Document(pdfDoc);//构建文档对象 	   
	   Paragraph paragraph = new Paragraph("hello word 你好 世界"); //段落方法 
	   paragraph.setFont(sysFont);//自定义中文
	   doc.add(paragraph);//段落添加到文档中
	   doc.close();//关闭文档流
	   
//	   PDFUtil pdfUtil=new PDFUtil(url);//传入路径+文件名,使用工具类
//       Document doc= pdfUtil.createPdfDoc();  
//       pdfUtil.addTitle(doc, "我是标题");//添加标题
//       pdfUtil.addHeading1(doc,"标题1");
//       pdfUtil.addParagraph(doc,"内容11111111……");
//       pdfUtil.addHeading1(doc,"标题2");
//       pdfUtil.addHeading2(doc,"标题2.1");
//       pdfUtil.addParagraph(doc,"内容2.1"); 
//       pdfUtil.addHeading2(doc,"标题2.2");
//       pdfUtil.addParagraph(doc,"内容2.2"); 
//       doc.close();
	   long now = System.currentTimeMillis();
       System.out.println("共耗时：" + ((now - old) / 1000.0) + "秒\n\n" + "文件保存在:" + DEST2);

   }  
	
	
}
