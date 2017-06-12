package com.gsafety.plan.module.util;

import java.io.IOException;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.property.TextAlignment;


/**
 * 
 * 
 * 
 * 
 * @author Hui
 *
 */
public class PDFUtil {
	
    public static String DEST2 = "";//文件路径  
    public static PdfFont sysFont =null;
    
    public PDFUtil(String url){
    	try {
			sysFont = PdfFontFactory.createFont("STSongStd-Light", "UniGB-UCS2-H", false);//中文设置 
			DEST2=url;
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
	
   /**
	* 创建pdf doc
	* @return doc
	* */
   public Document createPdfDoc() throws Exception{   
	   PdfDocument pdfDoc = new PdfDocument(new PdfWriter(DEST2));    
	   Document doc = new Document(pdfDoc);//构建文档对象  
	   return doc;
   }
   
   /**
    * 添加大标题
    * @param
    * 
    * */
   public void addTitle(Document doc,String title) throws Exception{ 
	   
	   Paragraph paragraph = new Paragraph();  
	   paragraph.add(title).setFont(sysFont).setBold().setFontSize(20).setTextAlignment(TextAlignment.CENTER);
	   doc.add(paragraph);
   }
   
   /**
    * 添加一级标题
    * @param
    * 
    * */
   public void addHeading1(Document doc,String pg) throws Exception{
	   Paragraph paragraph = new Paragraph(); 
	   paragraph.add(pg).setFont(sysFont).setBold().setFontSize(16);
	   doc.add(paragraph);
   }
   

   /**
    * 添加二级标题
    * @param
    * 
    * */
   public  void addHeading2(Document doc,String pg) throws Exception{
	   Paragraph paragraph = new Paragraph();  
	   paragraph.add(pg).setFont(sysFont).setBold().setFontSize(14).setFirstLineIndent(14);
	   doc.add(paragraph);
   }
   
   /**
    * 添加三级标题
    * @param
    * 
    * */
   public  void addHeading3(Document doc,String pg) throws Exception{
	   Paragraph paragraph = new Paragraph();  
	   paragraph.add(pg).setFont(sysFont).setBold().setFontSize(12);
	   doc.add(paragraph);
   }
   
   
   
   /**
    * 添加段落
    * @param
    * */
   public void addParagraph(Document doc,String pg) throws Exception{
	   Paragraph paragraph = new Paragraph();  
	   paragraph.add(pg).setFont(sysFont).setFirstLineIndent(20);//中文字体，首行缩进
	   doc.add(paragraph);
   }
   
}