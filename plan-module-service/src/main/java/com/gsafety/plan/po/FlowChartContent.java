package com.gsafety.plan.po;

import java.io.Serializable;

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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

@Entity
@Table(name="pre_fl_content")
public class FlowChartContent implements Serializable{
    private static final long serialVersionUID = 706333807288987828L;
   
    private int id;
    private String content;//内容
    private Preplan preplanSn;//预案sn  
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
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
    
    
    
    @OneToOne(targetEntity=Preplan.class,cascade=CascadeType.ALL)
    @JoinColumn(name="preplan_sn",referencedColumnName="preplan_sn",unique=true)
    public Preplan getPreplanSn() {
        return preplanSn;
    }
    public void setPreplanSn(Preplan preplanSn) {
        this.preplanSn = preplanSn;
    }
}
