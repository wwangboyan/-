package MenJin.service.imple;

import java.util.List;

import MenJin.dao.ShebeiDao;
import MenJin.dao.impl.ShebeiDaoimp;
import MenJin.entity.Shebei;
import MenJin.service.ShebeiService;

//操作设备

public class ShebeiServiceimp implements ShebeiService {
	private ShebeiDao shebeiDao= null;
	
	public ShebeiServiceimp(){
		shebeiDao = new ShebeiDaoimp();
	}
	//查找所有设备
	@Override
	public List<Shebei> getAllSgebei() {
		// TODO Auto-generated method stub
		return shebeiDao.getAllSgebei();
	}
	//根据id查找地点
	@Override
	public Shebei getFind(String didian) {
		// TODO Auto-generated method stub
		return shebeiDao.getFind(didian);
	}
	//添加设备
	@Override
	public int addShebei(Shebei shebei) {
		// TODO Auto-generated method stub
		return shebeiDao.addShebei(shebei);
	}
	//修改设备
	@Override
	public int modifyShebei(Shebei shebei) {
		// TODO Auto-generated method stub
		return shebeiDao.modifyShebei(shebei);
	}
	//删除设备
	public int delShebei(String id) {
		// TODO Auto-generated method stub
		return shebeiDao.delShebei(id);
	}
}


