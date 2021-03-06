package com.gsafety.plan.module.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.events.IEventHandler;
import com.itextpdf.kernel.events.PdfDocumentEvent;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.xobject.PdfImageXObject;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.AreaBreak;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
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
    private Map<String, Integer> catalogMap = new LinkedHashMap<String, Integer>();//<标题，页数>
    
    public PDFUtil(String url){
    	try {
			//sysFont = PdfFontFactory.createFont("STSongStd-Light", "UniGB-UCS2-H", false);//中文设置 
    		sysFont = PdfFontFactory.createFont("c://windows//fonts//simsun.ttc,1",PdfEncodings.IDENTITY_H, false);//中文设置,解决特殊字符错误
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
	   //设置页码
	   TextFooterEventHandler eh= new TextFooterEventHandler(doc);
	   pdfDoc.addEventHandler(PdfDocumentEvent.END_PAGE,eh);

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
	   catalogMap.put(pg, doc.getPdfDocument().getNumberOfPages());
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
	   catalogMap.put(pg, doc.getPdfDocument().getNumberOfPages());
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
	   catalogMap.put(pg, doc.getPdfDocument().getNumberOfPages());
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
   
   /**
    * 添加图片
    * @param
    * */
   public void addImg(Document doc,String url) throws Exception{
	   String realUrl=ServletActionContext.getServletContext().getRealPath("/img")+"/"+url;
	   ImageData imgData=ImageDataFactory.create(realUrl);
	   Image pic=new Image(imgData);	  
	   doc.add(pic);
   }
   
   /**
    * 添加表格
    * @param
    * @param Element e
    * */
   public void addTable(Document doc,Element e) throws Exception{
		 Elements eTag=e.children();//获得thead和tobody    		 
		 Table table=new Table(e.children().last().children().last().childNodeSize());//tobody最后一列的tr获得行数，这里可能会有些出入
		 for(Element tBady: eTag){    			 
			 Elements tCellList=tBady.children();//获得tr行    			 
			 for(Element tCell: tCellList){
				 Elements tDList=tCell.children();//获得td格子      				 
				 for(Element td:tDList){
					 String oldRowspan=td.attr("rowspan");//获得跨行
					 String oldColspan=td.attr("colspan");//获得跨列
					 int rowspan=0;
					 int colspan=0;
					 if(oldRowspan!="" && oldRowspan.length()>0){
						 rowspan=Integer.valueOf(td.attr("rowspan")); 
					 }
					 if(oldColspan!="" && oldColspan.length()>0){
						 colspan=Integer.valueOf(td.attr("colspan"));
					 }
					 
					 Cell cell=new Cell(rowspan,colspan).add(td.text());
					 table.addCell(cell);
				 }
			 }
			
		 }
       doc.add(table.setFont(sysFont).setAutoLayout());	   
   }

	public Map<String, Integer> getCatalogMap() {
		return catalogMap;
	}
	
	public void setCatalogMap(Map<String, Integer> catalogMap) {
		this.catalogMap = catalogMap;
	}


   
   
}