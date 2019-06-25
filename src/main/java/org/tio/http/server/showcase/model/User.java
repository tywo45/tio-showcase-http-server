package org.tio.http.server.showcase.model;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 7038736722168521022L;
	
	private Integer id;
	
	private String loginname;

	private String nick;

	private String ip;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}


}
