package com.gsafety.plan.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
@Entity
@Table(name="PRE_ATTR")
public class Attr implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	
	private int id;
	private String attrSn;								//属性编号
	private String attr1; 							    //属性1
	private String attr2;
	private String attr3;
	
	private Set<Preplan> preplan=new HashSet<Preplan>();
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="attr_sn",unique=true)
	public String getAttrSn() {
		return attrSn;
	}
	public void setAttrSn(String attrSn) {
		this.attrSn = attrSn;
	}
	@Column(name="attr1")
	public String getAttr1() {
		return attr1;
	}
	public void setAttr1(String attr1) {
		this.attr1 = attr1;
	}
	@Column(name="attr2")
	public String getAttr2() {
		return attr2;
	}
	public void setAttr2(String attr2) {
		this.attr2 = attr2;
	}
	@Column(name="attr3")
	public String getAttr3() {
		return attr3;
	}
	public void setAttr3(String attr3) {
		this.attr3 = attr3;
	}
	@ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
	@JoinTable(name = "pre_attr_preplan",
	joinColumns = {@JoinColumn(name = "attr_sn", referencedColumnName = "attr_sn")},
	inverseJoinColumns = {@JoinColumn(name = "preplan_sn", referencedColumnName ="preplan_sn")})
	public Set<Preplan> getPreplan() {
		return preplan;
	}
	public void setPreplan(Set<Preplan> preplan) {
		this.preplan = preplan;
	}
	
	
	
}
