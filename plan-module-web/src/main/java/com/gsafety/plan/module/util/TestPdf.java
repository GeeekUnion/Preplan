package com.gsafety.plan.module.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import aspose.pdf.Heading;
import aspose.pdf.Pdf;

import com.aspose.pdf.Document;
import com.aspose.pdf.License;
import com.aspose.pdf.SaveFormat;

/**
 * 
 * 由于ASPOSE比较吃内存，操作大一点的文件就会堆溢出，所以请先设置好java虚拟机参数：-Xms1024m -Xmx1024m(参考值)<br>
 * 
 * 
 * @author Spark
 *
 */
public class TestPdf {

//    private static InputStream license;
//    //private static InputStream fileInput;
//    private static File outputFile;
//    private static Pdf fileInput = new Pdf();
//
//    /**
//     * 获取license
//     * 
//     * @return
//     */
//    public static boolean getLicense() {
//        boolean result = false;
//        try {
//        	
//
//            ClassLoader loader = Thread.currentThread().getContextClassLoader();
//            license = new FileInputStream(loader.getResource("license.xml").getPath());// 凭证文件
//            //fileInput = new FileInputStream(loader.getResource("test.pdf").getPath());// 待处理的文件
//            outputFile = new File("G:\\test.docx");// 输出路径
//
//            License aposeLic = new License();
//            aposeLic.setLicense(license);
//            result = true;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return result;
//    }
//
//    /**
//     * 
//     * @param args
//     */
//    public static void main(String[] args) {
//        // 验证License
//        if (!getLicense()) {
//            return;
//        }
//
//        try {
//            long old = System.currentTimeMillis();
//            Document pdfDocument = new Document(fileInput);
//            OutputStream fileOutput = new FileOutputStream(outputFile);
//            
//            pdfDocument.save(fileOutput, SaveFormat.DocX);
//
//            long now = System.currentTimeMillis();
//            System.out.println("共耗时：" + ((now - old) / 1000.0) + "秒\n\n" + "文件保存在:" + outputFile.getPath());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
}