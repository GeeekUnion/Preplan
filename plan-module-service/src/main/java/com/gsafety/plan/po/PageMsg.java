package com.gsafety.plan.po;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="pre_page_msg")
public class PageMsg {
    private int id;//唯一标识
    private String title;//标题
    private String titleDesc;//标题
    private boolean isSupTitle;//是否父标题
    private int supId;//父ID
    private String order;//显示顺序
    private String requireContent;//要求内容
    private String exampleContent;//示例内容
    private boolean requireCheck;//编写要求有无
    private boolean exampleCheck;//示例有无
    private boolean srcCheck;//资源有无
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    @Column(name="show_order")
    public String getOrder() {
        return order;
    }   
    public void setOrder(String order) {
        this.order = order;
    }
    @Lob   
    @Basic(fetch = FetchType.LAZY)   
    @Type(type="text")
    @Column(name="require_content")
    public String getRequireContent() {
        return requireContent;
    }
    public void setRequireContent(String requireContent) {
        this.requireContent = requireContent;
    }
    @Lob   
    @Basic(fetch = FetchType.LAZY)   
    @Type(type="text")
    @Column(name="example_content")
    public String getExampleContent() {
        return exampleContent;
    }
    public void setExampleContent(String exampleContent) {
        this.exampleContent = exampleContent;
    }
    @Column(name="require_check")
    public boolean isRequireCheck() {
        return requireCheck;
    }
    public void setRequireCheck(boolean requireCheck) {
        this.requireCheck = requireCheck;
    }
    @Column(name="example_check")
    public boolean isExampleCheck() {
        return exampleCheck;
    }
    public void setExampleCheck(boolean exampleCheck) {
        this.exampleCheck = exampleCheck;
    }
    @Column(name="src_check")
    public boolean isSrcCheck() {
        return srcCheck;
    }
    public void setSrcCheck(boolean srcCheck) {
        this.srcCheck = srcCheck;
    }
    @Column(name="title")
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    @Column(name="title_desc")
    public String getTitleDesc() {
        return titleDesc;
    }
    public void setTitleDesc(String titleDesc) {
        this.titleDesc = titleDesc;
    }
    @Column(name="is_sup_title")
    public boolean isSupTitle() {
        return isSupTitle;
    }
    public void setSupTitle(boolean isSupTitle) {
        this.isSupTitle = isSupTitle;
    }
    @Column(name="sup_id")
    public int getSupId() {
        return supId;
    }
    public void setSupId(int supId) {
        this.supId = supId;
    }

    


    
}
