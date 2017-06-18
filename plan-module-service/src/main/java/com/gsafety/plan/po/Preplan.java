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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PRE_PREPLAN")
public class Preplan implements Serializable {
	private static final long serialVersionUID = 706333807288987828L;

	private int id;
	private String preplanSn;                       
	private String preplanUID;
	private String preplanName;
	private String preplanDesc;
	private Timestamp preplanTime;           //预案最后一次编制时间
	private String preplanStatus;            //预案状态
	private String responDept;                //负责部门，暂无对应表
	private String responPerson;              //负责人，暂无对应表		
	private String preplanSpecialist;    //专家组
	private String version;//版本号
	
	private String reviewOrg;//审核部门
	
	private Event eventSn;
	
	private User username;
	private Set<Attr> attr=new HashSet<Attr>();
	private Set<Domain>domain=new HashSet<Domain>();
	private Set<Mission>mission=new HashSet<Mission>();
	private Set<Module> module =new HashSet<Module>();
	private Set<PreplanLog> preplanLogs=new HashSet<PreplanLog>();
	


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
	public String getPreplanStatus() {
		return preplanStatus;
	}
	public void setPreplanStatus(String preplanStatus) {
		this.preplanStatus = preplanStatus;
	}
    @Column(name="preplan_org_code")
	public String getResponDept() {
		return responDept;
	}
	public void setResponDept(String responDept) {
		this.responDept = responDept;
	}		
	@Column(name="review_org_code")
    public String getReviewOrg() {
		return reviewOrg;
	}
	public void setReviewOrg(String reviewOrg) {
		this.reviewOrg = reviewOrg;
	}
	@Column(name="respon_person")
	public String getResponPerson() {
		return responPerson;
	}
	public void setResponPerson(String responPerson) {
		this.responPerson = responPerson;
	}
	@Column(name="preplan_version",length=25)
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
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
	
	@OneToMany(targetEntity=Mission.class,mappedBy="preplanSnM",cascade=CascadeType.ALL)
	public Set<Mission> getMission() {
		return mission;
	}
	public void setMission(Set<Mission> mission) {
		this.mission = mission;
	}
	@OneToMany(targetEntity=Module.class,mappedBy="preplanSnM",cascade=CascadeType.ALL)
    public Set<Module> getModule() {
        return module;
    }   
    public void setModule(Set<Module> module) {
        this.module = module;
    }	
	@Column(name="preplan_desc",length=1000)
	public String getPreplanDesc() {
		return preplanDesc;
	}
	public void setPreplanDesc(String preplanDesc) {
		this.preplanDesc = preplanDesc;
	}
	@Column(name="preplan_uid")
	public String getPreplanUID() {
		return preplanUID;
	}
	public void setPreplanUID(String preplanUID) {
		this.preplanUID = preplanUID;
	}
	@OneToOne(cascade = {CascadeType.ALL})    
	@JoinColumn(name = "event_sn", unique = true,referencedColumnName="event_sn")    
	public Event getEventSn() {
		return eventSn;
	}
	public void setEventSn(Event eventSn) {
		this.eventSn = eventSn;
	}
	@Column(name="preplan_specialist",length=1000)
	public String getPreplanSpecialist() {
		return preplanSpecialist;
	}
	public void setPreplanSpecialist(String preplanSpecialist) {
		this.preplanSpecialist = preplanSpecialist;
	}
	@OneToMany(targetEntity=PreplanLog.class,mappedBy="preplanSn",cascade=CascadeType.ALL)
    public Set<PreplanLog> getPreplanLogs() {
        return preplanLogs;
    }
    public void setPreplanLogs(Set<PreplanLog> preplanLogs) {
        this.preplanLogs = preplanLogs;
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
