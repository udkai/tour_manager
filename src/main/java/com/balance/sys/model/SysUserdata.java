package com.balance.sys.model;

/**
 * 用户数据权限
 * @author chykong
 *
 */
public class SysUserdata {

	private int user_id;
	private int warehouse_id;//
	private String warehouse_name;//

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public String getWarehouse_name() {
		return warehouse_name;
	}

	public void setWarehouse_name(String warehouse_name) {
		this.warehouse_name = warehouse_name;
	}

	public int getWarehouse_id() {
		return warehouse_id;
	}

	public void setWarehouse_id(int warehouse_id) {
		this.warehouse_id = warehouse_id;
	}

}
