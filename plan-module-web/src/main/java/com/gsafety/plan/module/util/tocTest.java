package com.gsafety.plan.module.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.action.PdfAction;
import com.itextpdf.kernel.pdf.canvas.draw.DottedLine;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Tab;
import com.itextpdf.layout.element.TabStop;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.property.Property;
import com.itextpdf.layout.property.TabAlignment;
import com.itextpdf.layout.property.TextAlignment;

public class tocTest {
    public static String url="G:\\test4.pdf";
    public static String urlOrig="G:\\test1.pdf";
    static Map<String, Integer> catalogMap = new HashMap<String, Integer>();

    public static void main(String[] args) throws Exception {  
    catalogMap.put("Performance", 1);
    PdfDocument pdfDoc = new PdfDocument(new PdfWriter(url));
    Document document = new Document(pdfDoc);
    document.add(new Paragraph(new Text("The Revenant nominations list"))
        .setTextAlignment(TextAlignment.CENTER));

    PdfDocument firstSourcePdf = new PdfDocument(new PdfReader(urlOrig));
    
    for(Entry<String, Integer> entry:catalogMap.entrySet()) {
        PdfPage page = firstSourcePdf.getPage(entry.getValue()).copyTo(pdfDoc);
        pdfDoc.addPage(page);
        //Overwrite page number
        Text text = new Text(String.format("Page %d", pdfDoc.getNumberOfPages() - 1));
        text.setBackgroundColor(Color.WHITE);
        document.add(new Paragraph(text).setFixedPosition(pdfDoc.getNumberOfPages(), 549, 742, 100));
        //Add destination
        String destinationKey = "p" + (pdfDoc.getNumberOfPages() - 1);
        PdfArray destinationArray = new PdfArray();
        destinationArray.add(page.getPdfObject());
        destinationArray.add(PdfName.XYZ);
        destinationArray.add(new PdfNumber(0));
        destinationArray.add(new PdfNumber(page.getMediaBox().getHeight()));
        destinationArray.add(new PdfNumber(1));
        pdfDoc.addNamedDestination(destinationKey, destinationArray);
        //Add TOC line with bookmark
        Paragraph p = new Paragraph();
        p.addTabStops(new TabStop(540, TabAlignment.RIGHT, new DottedLine()));
        p.add(entry.getKey());
        p.add(new Tab());
        p.add((pdfDoc.getNumberOfPages() - 1)+"");
        p.setProperty(Property.ACTION, PdfAction.createGoTo(destinationKey));
        document.add(p);
        
    }
    
   
    

    
    }
    
    
    
}
    

