package MenJin.dao;

import java.util.List;

import MenJin.entity.Shebei;
import MenJin.entity.Student;

//设备
public interface ShebeiDao {
	//查找所有设备
	public List<Shebei> getAllSgebei();
	//根据id查找地点
	public  Shebei getFind(String didian);
	//添加设备
	public int addShebei(Shebei shebei);
	//修改设备
	public int modifyShebei(Shebei shebei);
	//删除设备
	public int delShebei(String id);
	//设备表示
	public int biaoShe(Shebei shebei);
	
	public Shebei getShebeiMoreInfo(Shebei shebei);

}


