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
@Table(name="PRE_DOMAIN")
public class Domain implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	
	private int id;
	private String domainSn;         //所属领域编号
	private String domainName;   
	private String domainType;       
	private String domainDesc;       //预案所属领域的描述
	private Set<Preplan> preplan=new HashSet<Preplan>();
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="domain_sn",unique=true)
	public String getDomainSn() {
		return domainSn;
	}
	public void setDomainSn(String domainSn) {
		this.domainSn = domainSn;
	}
	@Column(name="domain_name")
	public String getDomainName() {
		return domainName;
	}
	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}
	@Column(name="domain_type")
	public String getDomainType() {
		return domainType;
	}
	public void setDomainType(String domainType) {
		this.domainType = domainType;
	}
	@Column(name="domain_desc")
	public String getDomainDesc() {
		return domainDesc;
	}
	public void setDomainDesc(String domainDesc) {
		this.domainDesc = domainDesc;
	}
	@ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
	@JoinTable(name = "pre_domain_preplan",
	joinColumns = {@JoinColumn(name = "domain_sn", referencedColumnName = "domain_sn")},
	inverseJoinColumns = {@JoinColumn(name = "preplan_sn", referencedColumnName ="preplan_sn")})
	public Set<Preplan> getPreplan() {
		return preplan;
	}
	public void setPreplan(Set<Preplan> preplan) {
		this.preplan = preplan;
	}
	
	
	
	
}
