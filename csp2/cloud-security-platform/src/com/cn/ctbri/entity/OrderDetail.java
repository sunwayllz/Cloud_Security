package com.cn.ctbri.entity;

import java.util.Date;

public class OrderDetail {
	private String id;//主键Id
	private int type;//订单类型(1：长期，2：单次)
	private Date begin_date;//开始时间
	private Date end_date;//结束日期
	private int serviceId;//服务ID
	private Date create_date;//下单日期
	private int userId;//用户ID
    private int isAPI;
	private double price;//价格
	private String assetIds;
	private int scan_type;//服务频率
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getBegin_date() {
		return begin_date;
	}
	public void setBegin_date(Date beginDate) {
		begin_date = beginDate;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date endDate) {
		end_date = endDate;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date createDate) {
		create_date = createDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getIsAPI() {
		return isAPI;
	}
	public void setIsAPI(int isAPI) {
		this.isAPI = isAPI;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getAssetIds() {
		return assetIds;
	}
	public void setAssetIds(String assetIds) {
		this.assetIds = assetIds;
	}
	public int getScan_type() {
		return scan_type;
	}
	public void setScan_type(int scanType) {
		scan_type = scanType;
	}
	
	
}
