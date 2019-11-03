package MenJin.entity;

import java.sql.Timestamp;

//学生信息表
public class Student {
private static final long serialVersionUID = 1L;
	
	int id;
	String name;
	String xuehao;
	String dakashijian;
	String shebeiId;
	String qingkuang;
	String caozuo;
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", xuehao=" + xuehao + ", dakashijian=" + dakashijian
				+ ", shebeiId=" + shebeiId + ", qingkuang=" + qingkuang + ", caozuo=" + caozuo + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getXuehao() {
		return xuehao;
	}
	public void setXuehao(String xuehao) {
		this.xuehao = xuehao;
	}
	public String getDakashijian() {
		return dakashijian;
	}
	public void setDakashijian(String dakashijian) {
		this.dakashijian = dakashijian;
	}
	public String getShebeiId() {
		return shebeiId;
	}
	public void setShebeiId(String shebeiId) {
		this.shebeiId = shebeiId;
	}
	public String getqingkuang() {
		return qingkuang;
	}
	public void setqingkuang(String qingkuang) {
		this.qingkuang = qingkuang;
	}
	public String getCaozuo() {
		return caozuo;
	}
	public void setCaozuo(String caozuo) {
		this.caozuo = caozuo;
	}
	
	
}