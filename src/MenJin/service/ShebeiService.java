package MenJin.service;

import java.util.List;

import MenJin.entity.Shebei;

//设备
public interface ShebeiService {
	//查找所有设备
	public List<Shebei> getAllSgebei();
	//根据id查找地点
	public Shebei getFind(String didian);
	//添加设备
	public int addShebei(Shebei shebei);
	//修改设备
	public int modifyShebei(Shebei shebei);
	//删除设备
	public int delShebei(String id);
 


}


