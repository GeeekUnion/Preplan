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

import org.hibernate.annotations.Type;

@Entity
@Table(name="pre_reviews")
public class Reviews implements Serializable{
	 private static final long serialVersionUID = 706333807288987828L;
	 private int id;
	 private String reviewOrgCode;//审核人
	 private Preplan preplanSn;//对应预案号
	 private String opinion;//意见
	    
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="review_org_code")
	public String getReviewOrgCode() {
		return reviewOrgCode;
	}
	public void setReviewOrgCode(String reviewOrgCode) {
		this.reviewOrgCode = reviewOrgCode;
	}
	@OneToOne(cascade = {CascadeType.ALL})  
    @JoinColumn(name="preplan_sn",referencedColumnName="preplan_sn")  
    // 维护端 (外键)
	public Preplan getPreplanSn() {
		return preplanSn;
	}
	public void setPreplanSn(Preplan preplanSn) {
		this.preplanSn = preplanSn;
	}
    @Lob   
    @Basic(fetch = FetchType.LAZY)   
    @Type(type="text")
    @Column(name="opinion")
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	 
}
