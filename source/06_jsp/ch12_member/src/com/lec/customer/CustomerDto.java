package com.lec.customer;
import java.sql.Date;
import java.sql.Timestamp;
public class CustomerDto {
	private String cid;
	private String cpw;
	private String cname;
	private String ctel;
	private String cemail;
	private String caddress;
	private Date   cbirth;
	private String cgender;
	private Timestamp crdate;
	public CustomerDto() { }
	public CustomerDto(String cid, String cpw, String cname, String ctel, String cemail, String caddress, Date cbirth,
			String cgender, Timestamp crdate) {
		this.cid = cid;
		this.cpw = cpw;
		this.cname = cname;
		this.ctel = ctel;
		this.cemail = cemail;
		this.caddress = caddress;
		this.cbirth = cbirth;
		this.cgender = cgender;
		this.crdate = crdate;
	}
	public String getCid() {return cid;}
	public void setCid(String cid) {this.cid = cid;}
	public String getCpw() {return cpw;}
	public void setCpw(String cpw) {this.cpw = cpw;}
	public String getCname() {return cname;}
	public void setCname(String cname) {this.cname = cname;}
	public String getCtel() {return ctel;}
	public void setCtel(String ctel) {this.ctel = ctel;}
	public String getCemail() {return cemail;}
	public void setCemail(String cemail) {this.cemail = cemail;}
	public String getCaddress() {return caddress;}
	public void setCaddress(String caddress) {this.caddress = caddress;}
	public Date getCbirth() {return cbirth;}
	public void setCbirth(Date cbirth) {this.cbirth = cbirth;}
	public String getCgender() {return cgender;}
	public void setCgender(String cgender) {this.cgender = cgender;}
	public Timestamp getCrdate() {return crdate;}
	public void setCrdate(Timestamp crdate) {this.crdate = crdate;}
	@Override
	public String toString() {
		return "CustomerDto [cid=" + cid + ", cpw=" + cpw + ", cname=" + cname + ", ctel=" + ctel + ", cemail=" + cemail
				+ ", caddress=" + caddress + ", cbirth=" + cbirth + ", cgender=" + cgender + ", crdate=" + crdate + "]";
	}
}