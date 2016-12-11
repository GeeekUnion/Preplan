package com.gsafety.plan.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
/**
 * 
 *  @author L
 */
@Entity
@Table(name="T_PRIVILEGE")
public class Privilege {
	private Integer id;
	private String privilegeOperation;
	private String recordStatus;
	private String title;
	private String url;
    private Integer parentID;
	private String icon;
	private String type;
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="PrivilegeOperation",length=50)
	public String getPrivilegeOperation() {
		return privilegeOperation;
	}
	public void setPrivilegeOperation(String privilegeOperation) {
		this.privilegeOperation = privilegeOperation;
	}
	@Column(name="RecordStatus",length=50)
	public String getRecordStatus() {
		return recordStatus;
	}
	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}
	@Column(name="ParentID")
	public Integer getParentID() {
		return parentID;
	}
	public void setParentID(Integer parentID) {
		this.parentID = parentID;
	}
	@Column(name="Icon")
    public String getIcon() {
        return icon;
    }
    public void setIcon(String icon) {
        this.icon = icon;
    }
    @Column(name="Type")
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    @Column(name="Title")
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    @Column(name="Url")
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
}
