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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="PRE_EVENT")
public class Event implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	
	private int id;
	private String eventSn;
	private String eventName;
	private Timestamp eventOccurTime;
	private String eventOccurPlace;
	
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="event_sn",unique=true,nullable=false)
	public String getEventSn() {
		return eventSn;
	}
	public void setEventSn(String eventSn) {
		this.eventSn = eventSn;
	}
	@Column(name="event_name",nullable=false)
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	@Column(name="event_OccurTime")
	public Timestamp getEventOccurTime() {
		return eventOccurTime;
	}
	public void setEventOccurTime(Timestamp eventOccurTime) {
		this.eventOccurTime = eventOccurTime;
	}
	@Column(name="event_OccurPlace")
	public String getEventOccurPlace() {
		return eventOccurPlace;
	}
	public void setEventOccurPlace(String eventOccurPlace) {
		this.eventOccurPlace = eventOccurPlace;
	}

	
	
	
	
	
}