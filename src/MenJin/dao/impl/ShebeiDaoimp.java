package MenJin.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import MenJin.dao.BaseDao;
import MenJin.dao.ShebeiDao;
import MenJin.entity.Shebei;
import MenJin.entity.Student;


//设备操作
public class ShebeiDaoimp extends BaseDao implements ShebeiDao{
	
	//查找所有设备
	@Override
	public List<Shebei> getAllSgebei() {
		List<Shebei> list = new ArrayList<Shebei>();
		String sql ="select `shebeiId`,`quyue`,`didian`,`zhuangtai`,`biaoshi`,`caozuo` from m_shebei";
		Object[] params = {};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
		while (rs.next()) {
				Shebei sheb = new Shebei();
				sheb.setShebeiId(rs.getString("shebeiId"));
				sheb.setQuyue(rs.getString("quyue"));
				sheb.setDidian(rs.getString("didian"));
				sheb.setZhuangtai(rs.getInt("zhuangtai"));
				sheb.setBiaoshi(rs.getInt("biaoshi"));
				sheb.setCaozuo(rs.getString("caozuo"));
				list.add(sheb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//查找设备
	@Override
	public Shebei getFind(String didian) {
		Shebei sheb = new Shebei();
		String sql = "select `quyue`,`didian`,`zhuangtai`,`biaoshi`,`caozuo` from m_shebei where `shebeiId`=?";
		Object[] params = {sheb.getShebeiId()};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
		while (rs.next()) {
				sheb.setQuyue(rs.getString("quyue"));
				sheb.setDidian(rs.getString("didian"));
				sheb.setZhuangtai(rs.getInt("zhuangtai"));
				sheb.setBiaoshi(rs.getInt("biaoshi"));
				sheb.setCaozuo(rs.getString("caozuo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sheb;
	}
	//添加设备
	@Override
	public int addShebei(Shebei shebei) {
		int row = 0;
		String sql = "insert into m_shebei(`shebeiId`,`quyue`,`didian`,`zhuangtai`,`biaoshi`,`caozuo`) values(?,?,?,?,?,?)";
		Object[] params = {shebei.getShebeiId(),shebei.getQuyue(),shebei.getDidian(),shebei.getZhuangtai(),shebei.getBiaoshi(),shebei.getCaozuo()};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("增加学生成功");
		}else{
			System.out.println("增加学生失败");
		}
		return row;
	}
	//修改设备
	@Override
	public int modifyShebei(Shebei shebei) {
		int row = 0;
		String sql = "update m_shebei set `zhuangtai`=?,`biaoshi`=? where `shebeiId`=?";
		Object[] params = {shebei.getZhuangtai(),shebei.getBiaoshi(),shebei.getShebeiId()};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("修改设备成功");
		}else{
			System.out.println("修改设备失败");
		}		
		return row;
		}
	//删除设备
	@Override
	public int delShebei(String id) {
		int row = 0;
		String sql = "delete from m_shebei where `shebeiId`=?";
		Object[] params = {id};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("删除设备成功");
		}else{
			System.out.println("删除设备失败");
		}
		return row;
	}
	//修改
	@Override
	public int biaoShe(Shebei shebei) {
		int row = 0;
		String sql ="update m_shebei set `biaoshi`=? where`shebeiId`=?";
		Object[] params = { shebei.getBiaoshi(),shebei.getShebeiId()};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("修改设备成功");
			System.out.println(shebei.getBiaoshi());
		}else{
			System.out.println("修改设备失败");
		}
		return row;
		}
	
	@Override
	public Shebei getShebeiMoreInfo(Shebei shebei) {
		Shebei shebei2 = new Shebei();
		String sql = "select `shebeiId`,`quyue`,`didian`,`zhuangtai`,`biaoshi`,`caozuo` from m_shebei where `shebeiId`=?";
		Object[] params = {shebei.getShebeiId()};
		ResultSet rs = this.executeQuerySQL(sql, params);
		System.out.println(shebei.getShebeiId());
		try {
			while (rs.next()) {
				
				shebei2.setShebeiId(rs.getString("shebeiId"));
				shebei2.setQuyue(rs.getString("quyue"));
				shebei2.setDidian(rs.getString("didian"));
				shebei2.setZhuangtai(rs.getInt("zhuangtai"));
				shebei2.setBiaoshi(rs.getInt("biaoshi"));
				shebei2.setCaozuo(rs.getString("caozuo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("设备信息查询成功");
		System.out.println(shebei.getDidian());
		System.out.println(shebei.getBiaoshi());
		return shebei2;
	}
}


