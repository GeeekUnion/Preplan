package com.gsafety.plan.po;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="PRE_DRILL")
public class Drill implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	
	private int id;
	private String drillSn;
	private Timestamp drillTime;
	private int drillNumOfParticipants;
	//单位怎么弄
	private String drillContent;
	private Set<Preplan> preplanName;
	
	
	
	
}
