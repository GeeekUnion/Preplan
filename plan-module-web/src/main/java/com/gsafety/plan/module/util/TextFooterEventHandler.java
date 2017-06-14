package com.gsafety.plan.module.util;

import java.io.IOException;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.events.Event;
import com.itextpdf.kernel.events.IEventHandler;
import com.itextpdf.kernel.events.PdfDocumentEvent;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.Document;

public class TextFooterEventHandler implements IEventHandler {

	protected Document doc;
	protected int page;
    public TextFooterEventHandler(Document doc) {
        this.doc = doc;
       
    }
    @Override
    public void handleEvent(Event event) {
        PdfDocumentEvent docEvent = (PdfDocumentEvent) event;
        PdfCanvas canvas = new PdfCanvas(docEvent.getPage());
        Rectangle pageSize = docEvent.getPage().getPageSize();    
        page++;
        canvas.beginText();
        try {
            canvas.setFontAndSize(PdfFontFactory.createFont(FontConstants.HELVETICA_OBLIQUE), 15);
        } catch (IOException e) {
            e.printStackTrace();
        }
        canvas.moveText((pageSize.getRight() - doc.getRightMargin() + (pageSize.getLeft() + doc.getLeftMargin())) / 2,pageSize.getBottom() + doc.getBottomMargin())
                .showText(""+page)
                .endText()
                .release();
        
//        canvas.moveText((pageSize.getRight() - doc.getRightMargin() - (pageSize.getLeft() + doc.getLeftMargin())) / 2 + doc.getLeftMargin(), pageSize.getTop() - doc.getTopMargin() + 10)
//        .showText("this is a header")
//        .moveText(0, (pageSize.getBottom() + doc.getBottomMargin()) - (pageSize.getTop() + doc.getTopMargin()) - 20)
//        .showText("this is a footer")
//        .endText()
//        .release();
    }

}
