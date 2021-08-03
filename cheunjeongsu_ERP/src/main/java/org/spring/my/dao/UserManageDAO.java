package org.spring.my.dao;



import org.spring.my.dto.UserManage;

public interface UserManageDAO {
	public UserManage selectOne(UserManage userManage);
	public void insert(UserManage userManage);
	public int update(UserManage userManage);
	public int pUpdateReadCnt(UserManage userManage);
	
}
