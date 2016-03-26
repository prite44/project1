package com.meproject.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="role")
public class ROLE {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="role_id")
	private long id;
	@Column(name="role_name")
	private String tdesc;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTdesc() {
		return tdesc;
	}
	public void setTdesc(String tdesc) {
		this.tdesc = tdesc;
	}
}
