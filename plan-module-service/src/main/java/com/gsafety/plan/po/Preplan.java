package com.gsafety.plan.po;

import java.io.Serializable;
import java.sql.Timestamp;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "PRE_PREPLAN")
public class Preplan implements Serializable {
	private static final long serialVersionUID = 706333807288987828L;

	private int id;
	private String preplanSn;                       
	private String preplanName;
	private String preplanDesc;
	private Timestamp preplanTime;            //预案启动时间
	private Boolean preplanStatus;            //预案状态
	private String responDept;                //负责部门，暂无对应表
	private String responPerson;              //负责人，暂无对应表

	private User username;
	private Set<Attr> attr=new HashSet<Attr>();
	private Set<Domain>domain=new HashSet<Domain>();
	private Set<Mission>mission=new HashSet<Mission>();
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
    @Column(name="preplan_sn",unique=true)
	public String getPreplanSn() {
		return preplanSn;
	}
	public void setPreplanSn(String preplanSn) {
		this.preplanSn = preplanSn;
	}
	@Column(name="preplan_name") 
	public String getPreplanName() {
		return preplanName;
	}
	public void setPreplanName(String preplanName) {
		this.preplanName = preplanName;
	}
    @Column(name="preplan_time")
	public Timestamp getPreplanTime() {
		return preplanTime;
	}
	public void setPreplanTime(Timestamp preplanTime) {
		this.preplanTime = preplanTime;
	}
    @Column(name="preplan_status")
	public Boolean getPreplanStatus() {
		return preplanStatus;
	}
	public void setPreplanStatus(Boolean preplanStatus) {
		this.preplanStatus = preplanStatus;
	}
    @Column(name="respon_dept")
	public String getResponDept() {
		return responDept;
	}
	public void setResponDept(String responDept) {
		this.responDept = responDept;
	}
    @Column(name="respon_person")
	public String getResponPerson() {
		return responPerson;
	}
	public void setResponPerson(String responPerson) {
		this.responPerson = responPerson;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="username",referencedColumnName="username")
	public User getUsername() {
		return username;
	}
	public void setUsername(User username) {
		this.username = username;
	}
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "pre_attr_preplan",
	joinColumns = {@JoinColumn(name = "preplan_sn", referencedColumnName = "preplan_sn")},
	inverseJoinColumns = {@JoinColumn(name = "attr_sn", referencedColumnName ="attr_sn")})
	public Set<Attr> getAttr() {
		return attr;
	}
	public void setAttr(Set<Attr> attr) {
		this.attr = attr;
	}
	@ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
	@JoinTable(name = "pre_domain_preplan",
	joinColumns = {@JoinColumn(name = "preplan_sn", referencedColumnName = "preplan_sn")},
	inverseJoinColumns = {@JoinColumn(name = "domain_sn", referencedColumnName ="domain_sn")})
	public Set<Domain> getDomain() {
		return domain;
	}
	public void setDomain(Set<Domain> domain) {
		this.domain = domain;
	}
	
	@OneToMany(targetEntity=Mission.class,mappedBy="preplanSn")
	public Set<Mission> getMission() {
		return mission;
	}
	public void setMission(Set<Mission> mission) {
		this.mission = mission;
	}
	@Column(name="preplan_desc")
	public String getPreplanDesc() {
		return preplanDesc;
	}
	public void setPreplanDesc(String preplanDesc) {
		this.preplanDesc = preplanDesc;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
