package com.gsafety.plan.module.util;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.swing.text.StyleConstants.ParagraphConstants;

import sun.tools.jstat.Alignment;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;
import com.itextpdf.layout.renderer.ParagraphRenderer;

public class Testp {
    public static final String DEST2 = "G:\\test4.pdf";//文件路径  
    public static PdfFont sysFont =null;
    
   public static void main(String[] args) throws Exception {  
	   long old = System.currentTimeMillis();
	   Document doc=createPdfDoc();
	   addTitle(doc,"预案标题");
	   //addTable(doc);
	   addHeading1(doc,"一级标题1");
	   addHeading2(doc,"二级标题1");
	   addParagraph(doc,"内容1");
	   addHeading1(doc,"一级标题2");
	   addParagraph(doc,"内容2");
	   addParagraph(doc,"内容3");
	   doc.close();
	   long now = System.currentTimeMillis();
       System.out.println("共耗时：" + ((now - old) / 1000.0) + "秒\n\n" + "文件保存在:" + DEST2);
   }  
   /**
    * 创建pdf doc
    * @return doc
    * */
   public static Document createPdfDoc() throws Exception{
	   sysFont = PdfFontFactory.createFont("STSongStd-Light", "UniGB-UCS2-H", false);//中文设置 
	   PdfDocument pdfDoc = new PdfDocument(new PdfWriter(DEST2)); 
	   
	   Document doc = new Document(pdfDoc);//构建文档对象  
	   return doc;
   }
   /**
    * 添加表格
    * @param
    * 
    * */
   public static void addTable(Document doc) throws IOException{
	   Table table = new Table(new float[]{2,4,4}).setWidth(UnitValue.createPercentValue(100));//构建表格以100%的宽度  
	     Cell cell1=new Cell().add(new Paragraph("表格1")).setFont(sysFont);//向表格添加内容  
	     Cell cell2=new Cell().add(new Paragraph("表格2")).setFont(sysFont);  
	     Cell cell3=new Cell().add(new Paragraph("表格3")).setFont(sysFont);  
	     table.addCell(cell1);  
	     table.addCell(cell2);  
	     table.addCell(cell3);    
	     doc.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));//将表格添加入文档并页面居中  
	     
	        
   }
   /**
    * 添加大标题
    * @param
    * 
    * */
   public static void addTitle(Document doc,String title) throws Exception{ 
	   
	   Paragraph paragraph = new Paragraph();  
	   paragraph.add(title).setFont(sysFont).setBold().setFontSize(20).setTextAlignment(TextAlignment.CENTER);
	   doc.add(paragraph);
   }
   
   /**
    * 添加一级标题
    * @param
    * 
    * */
   public static void addHeading1(Document doc,String pg) throws Exception{
	   Paragraph paragraph = new Paragraph(); 
	   paragraph.add(pg).setFont(sysFont).setBold().setFontSize(16);
	   doc.add(paragraph);
   }
   
   /**
    * 添加二级标题
    * @param
    * 
    * */
   public static void addHeading2(Document doc,String pg) throws Exception{
	   Paragraph paragraph = new Paragraph();  
	   paragraph.add(pg).setFont(sysFont).setBold().setFontSize(14);
	   doc.add(paragraph);
   }
   
   /**
    * 添加段落
    * @param
    * */
   public static void addParagraph(Document doc,String pg) throws Exception{
	   Paragraph paragraph = new Paragraph();  
	   paragraph.add(pg).setFont(sysFont);
	   doc.add(paragraph);
   }
   

   
   
   
}
