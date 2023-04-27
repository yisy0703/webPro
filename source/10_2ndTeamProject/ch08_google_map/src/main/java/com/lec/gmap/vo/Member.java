package com.lec.gmap.vo;
import java.sql.Date;
import lombok.Data;
@Data
public class Member {
	private String id;
	private String pw;
	private String name;
	private String email;
	private Date birth;
	private Date rdate;
	private String address;
}
