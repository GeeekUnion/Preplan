package test;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.gsafety.plan.module.util.PDFUtil;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.layout.Document;

public class TestTable {
	 public static String url="G:\\test4.pdf";
	 public static void main(String[] args) throws Exception {  
		  
		   long old = System.currentTimeMillis();		   
		   
		   PDFUtil pdfUtil=new PDFUtil(url);//传入url创建pdf
		   Document doc=pdfUtil.createPdfDoc();
		   PdfDocument pdfDoc=doc.getPdfDocument();
		   pdfUtil.addTitle(doc,"表格");
		   
		   String pg="<table><thead><tr><td style='width:78.2000pt;'><p style='text-align:center;'><strong><span style='font-family:'Times New Roman';font-size:10.5pt;'>预警分级</span></strong></p></td><td colspan='4' style='width:336.8500pt;'><p style='text-align:center;'><strong><span style='font-family:'Times New Roman';font-size:10.5pt;'>4<span style='font-family:宋体;'>个等级标准划分</span></span></strong></p></td></tr></thead><tbody><tr><td style='width:78.2000pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>预警级别</span></p></td><td style='width:81.1500pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>一级</span></p></td><td style='width:78.1500pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>二级</span></p></td><td style='width:88.7500pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>三级</span></p></td><td style='width:88.8000pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>四级</span></p></td></tr><tr><td style='width:78.2000pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>级别描述</span></p></td><td style='width:81.1500pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>特别严重</span></p></td><td style='width:78.1500pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>严重</span></p></td><td style='width:88.7500pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>较重</span></p></td><td style='width:88.8000pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>一般</span></p></td></tr><tr><td style='width:78.2000pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>颜色标示</span></p></td><td style='width:81.1500pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>红</span></p></td><td style='width:78.1500pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>橙</span></p></td><td style='width:88.7500pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>黄</span></p></td><td style='width:88.8000pt;'><p style='text-align:center;'><span style='font-family:'Times New Roman';font-size:10.5000pt;'>蓝</span></p></td></tr></tbody></table>";
	       org.jsoup.nodes.Document docParse= Jsoup.parseBodyFragment(pg);//格式化html
	       Element body = docParse.body();//放入body片段        
	       //System.out.println(body.ownText());
	       Elements allTag=body.children();//获得儿子标签列表 
	       
	       for(Element e: allTag){
	    	 if("table".equals(e.nodeName())){
	    		 System.out.println("找到table了");
	    		 pdfUtil.addTable(doc, e);
	    	 }  
	    	   
	       }
	      
		   pdfDoc.close();	   	   	   
		   doc.close();
		   long now = System.currentTimeMillis();
	       System.out.println("共耗时：" + ((now - old) / 1000.0) + "秒\n\n" + "文件保存在:"+url);
	 }	   
}
