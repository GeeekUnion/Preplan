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
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

    @Entity
    @Table(name="pre_mission")
public class Mission implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;

	
	private int id;
	private String missionSn;           //任务编号
	private String missionName;       
	private String missionMethod;       //对应方法
	private String responDept;          //负责部门，暂无对应表
	private String responPerson;        //负责人，暂无对应表
	private String missionStatus;      //任务完成状态                     1代表正在，0代表否，2代表完成
	private String missionDefault;      //任务是否默认被加入预案  1代表是，0代表否   
	private String missionOrder;   //序号

    private Preplan preplanSnM;
	private Set<ResourceRecord> resourceRecord =new HashSet<ResourceRecord>();
	
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="mission_sn",unique=true)
	public String getMissionSn() {
		return missionSn;
	}
	public void setMissionSn(String missionSn) {
		this.missionSn = missionSn;
	}
	@Column(name="mission_order")
    public String getMissionOrder() {
        return missionOrder;
    }
    public void setMissionOrder(String missionOrder) {
        this.missionOrder = missionOrder;
    }	 
	
	@Column(name="mission_method")
	public String getMissionMethod() {
		return missionMethod;
	}
	public void setMissionMethod(String missionMethod) {
		this.missionMethod = missionMethod;
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
	@JoinColumn(name="preplan_sn",referencedColumnName="preplan_sn")
	   public Preplan getPreplanSnM() {
        return preplanSnM;
    }
    public void setPreplanSnM(Preplan preplanSnM) {
        this.preplanSnM = preplanSnM;
    }
	@Column(name="mission_status")
	public String getMissionStatus() {
		return missionStatus;
	}
    public void setMissionStatus(String missionStatus) {
		this.missionStatus = missionStatus;
	}
	@Column(name="mission_default")
	public String getMissionDefault() {
		return missionDefault;
	}
	public void setMissionDefault(String missionDefault) {
		this.missionDefault = missionDefault;
	}
	@Column(name="mission_name")
	public String getMissionName() {
		return missionName;
	}
	public void setMissionName(String missionName) {
		this.missionName = missionName;
	}
	@OneToMany(targetEntity=ResourceRecord.class,mappedBy="missionSnR")
	public Set<ResourceRecord> getResourceRecord() {
		return resourceRecord;
	}
	public void setResourceRecord(Set<ResourceRecord> resourceRecord) {
		this.resourceRecord = resourceRecord;
	}
	
	
	
	
	
	
	
	
	
	
	
}
