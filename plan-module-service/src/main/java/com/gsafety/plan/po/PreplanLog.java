package com.gsafety.plan.po;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "pre_preplan_log")
public class PreplanLog {
    private int id;
    private Preplan preplanSn;//对应预案sn
    private Timestamp preplanLogTime;//编制历史
    private String orgCode;//编制人code
    

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    @ManyToOne(targetEntity=Preplan.class,fetch=FetchType.EAGER)
    @JoinColumn(name="preplan_sn",referencedColumnName="preplan_sn")
    public Preplan getPreplanSn() {
        return preplanSn;
    }
    public void setPreplanSn(Preplan preplanSn) {
        this.preplanSn = preplanSn;
    }
    
    @Column(name="preplan_log_time")
    public Timestamp getPreplanLogTime() {
        return preplanLogTime;
    }
    public void setPreplanLogTime(Timestamp preplanLogTime) {
        this.preplanLogTime = preplanLogTime;
    }
    
    @Column(name="org_code",length=64)
    public String getOrgCode() {
        return orgCode;
    }
    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }
    
    
    
    
}
