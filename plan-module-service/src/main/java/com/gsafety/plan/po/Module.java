package com.gsafety.plan.po;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="pre_module")
public class Module {
    private int id;//唯一标识
    private String moduleSn;
    private String title;//标题
    private String clazz;//类别
    private String content;//内容
    private String order;//显示顺序
    private Preplan preplanSnM;//与预案对应
    private boolean moduleCheck;
    private String type;//全案模块（1）还是简单预案模块（2）
    private Set<Picture> pictures =new HashSet<Picture>();
    
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    @Column(name="module_sn",unique=true)
    public String getModuleSn() {
        return moduleSn;
    }
    public void setModuleSn(String moduleSn) {
        this.moduleSn = moduleSn;
    }
    @Column(name="module_title")
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    @Column(name="module_class")
    public String getClazz() {
        return clazz;
    }
    public void setClazz(String clazz) {
        this.clazz = clazz;
    }
    
    @Lob   
    @Basic(fetch = FetchType.LAZY)   
    @Type(type="text")
    @Column(name="module_content")
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    @Column(name="module_order") 
    public String getOrder() {
        return order;
    }
    public void setOrder(String order) {
        this.order = order;
    }
    @Column(name="type",length=2) 
    public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name="module_check") 
    public boolean isModuleCheck() {
        return moduleCheck;
    }
    public void setModuleCheck(boolean moduleCheck) {
        this.moduleCheck = moduleCheck;
    }
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="preplan_sn",referencedColumnName="preplan_sn")
    public Preplan getPreplanSnM() {
        return preplanSnM;
    }   
    public void setPreplanSnM(Preplan preplanSnM) {
        this.preplanSnM = preplanSnM;
    }
    @OneToMany(targetEntity=Picture.class,mappedBy="id",cascade=CascadeType.ALL)
	public Set<Picture> getPictures() {
		return pictures;
	}
	public void setPictures(Set<Picture> pictures) {
		this.pictures = pictures;
	}
    
}
