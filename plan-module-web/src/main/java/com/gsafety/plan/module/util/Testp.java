package com.gsafety.plan.module.util;



import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.events.Event;
import com.itextpdf.kernel.events.IEventHandler;
import com.itextpdf.kernel.events.PdfDocumentEvent;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.AffineTransform;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfCatalog;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNameTree;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import com.itextpdf.kernel.utils.PdfMerger;
import com.itextpdf.layout.Canvas;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.AreaBreak;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.property.AreaBreakType;
import com.itextpdf.layout.property.TextAlignment;



public class Testp{

   public static String url="G:\\test4.pdf";
   public static String urlOrig="G:\\test1.pdf";
   
   
   static Map<String, Integer> catalogMap = new HashMap<String, Integer>();
   
   public static void main(String[] args) throws Exception {  
	  
	   long old = System.currentTimeMillis();
	   
//	   PdfDocument pdfDoc = new PdfDocument(new PdfWriter(url)); 
//	   Document doc = new Document(pdfDoc);//构建文档对象  
	   

	   
	   PDFUtil pdfUtil=new PDFUtil(url);
	   Document doc=pdfUtil.createPdfDoc();
	   PdfDocument pdfDoc=doc.getPdfDocument();
	   TextFooterEventHandler eh= new TextFooterEventHandler(doc);
	   pdfDoc.addEventHandler(PdfDocumentEvent.END_PAGE,eh);
	   pdfUtil.addTitle(doc, "预案");
	   for(int i=0;i<15;i++){
		   pdfUtil.addHeading1(doc,i+" 标题");
		   if(i%2==0){
			   pdfUtil.addHeading2(doc,i+".1 小标题标题");
		   }
		   pdfUtil.addParagraph(doc, "内容QAQAQZAAAWQSXFDSFSD内容QAQAQZAAAWQSXFDSFSD内容QAQAQZAAAWQSXFDSFSD内容QAQAQZAAAWQSXFDSFSD内容QAQAQZAAAWQSXFDSFSD");
	   }
	   
	   pdfDoc.close();	   	   	   
	   doc.close();

//	    PdfWriter writer=new PdfWriter(url);	   	
//	    PdfDocument pdf= new PdfDocument(writer);
//	   
//	    
//	    PdfDocument resource = new PdfDocument(new PdfReader(urlOrig));
//
//	    //PdfMerger merger = new PdfMerger(pdf,false,true);
//	    
//	    //merger.merge(resource, 1, resource.getNumberOfPages());
//	    List<Integer> pageList=new ArrayList<Integer>();
//	    for(int j=1;j<=resource.getNumberOfPages();j++){	    		    	
//	    	pdf.addNewPage(j);
//	    	System.out.println(resource.getPdfObject(j));  	
//	    	PdfPage origPage = resource.getPage(j);
//	    	PdfPage page = pdf.addNewPage(j);
//	    	PdfCanvas canvas = new PdfCanvas(page);
//	    	
//	    	
//	    	//pdf.addPage(origPage);
//	    }
//	    //merger.merge(resource, pageList);	
//	    
////	    resource.copyPagesTo(pageList, pdf, 1);
//	    resource.close();
//	    pdf.close();
	    
	    

	   
	   PDFUtil pdfUtil2=new PDFUtil(urlOrig);
	   Document doc2=pdfUtil2.createPdfDoc();
	   System.out.println(doc2.getPdfDocument().getCatalog().getPdfObject());
	   //PdfDocument pdfdoc=doc2.getPdfDocument();
	   for(Entry<String, Integer> entry:pdfUtil.getCatalogMap().entrySet()){
		   
		   String title=entry.getKey();
		   String page=entry.getValue()+"";	 
		   if(countInString(title, ".")==0){
			   pdfUtil2.addParagraph(doc2, title+"......."+page);
		   }else if(countInString(title, ".")==1){
			   pdfUtil2.addParagraph(doc2, title+"......."+page);
		   }else{

		   }		   		   
	   }
	   doc2.close();
	   
	   long now = System.currentTimeMillis();
       System.out.println("共耗时：" + ((now - old) / 1000.0) + "秒\n\n" + "文件保存在:"+url);

   }  
   
   public static int countInString(String str1, String str2) {
		int total = 0;
		for (String tmp = str1; tmp != null && tmp.length() >= str2.length();){
		  if(tmp.indexOf(str2) == 0){
		    total++;
		    tmp = tmp.substring(str2.length());
		  }else{
		    tmp = tmp.substring(1);
		  }
		}
		return total;
	}
	
}
