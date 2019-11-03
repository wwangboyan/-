package MenJin.entity;
//管理员登录表
public class User {
	private String name;
	private String pwd;
	private String type;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", pwd=" + pwd + ", type=" + type + "]";
	}
	

}


