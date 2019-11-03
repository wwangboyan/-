package MenJin.entity;
//门禁设备表
public class Shebei {
	String shebeiId;
	int number;
	String quyue;
	String didian;
	int  zhuangtai;//0可用，1不可用
	int biaoshi;
	String caozuo;
	
	@Override
	public String toString() {
		return "Shebei [shebeiId=" + shebeiId + ", number=" + number + ", quyue=" + quyue + ", didian=" + didian
				+ ", zhuangtai=" + zhuangtai + ", biaoshi=" + biaoshi + ", caozuo=" + caozuo + "]";
	}
	public int getBiaoshi() {
		return biaoshi;
	}
	public void setBiaoshi(int biaoshi) {
		this.biaoshi = biaoshi;
	}
	public String getCaozuo() {
		return caozuo;
	}
	public void setCaozuo(String caozuo) {
		this.caozuo = caozuo;
	}
	public String getShebeiId() {
		return shebeiId;
	}
	public void setShebeiId(String shebeiId) {
		this.shebeiId = shebeiId;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getQuyue() {
		return quyue;
	}
	public void setQuyue(String quyue) {
		this.quyue = quyue;
	}
	public String getDidian() {
		return didian;
	}
	public void setDidian(String didian) {
		this.didian = didian;
	}
	public int getZhuangtai() {
		return zhuangtai;
	}
	public void setZhuangtai(int zhuangtai) {
		this.zhuangtai = zhuangtai;
	}
	
}
