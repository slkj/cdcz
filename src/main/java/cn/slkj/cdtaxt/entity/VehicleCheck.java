package cn.slkj.cdtaxt.entity;

/**
 * 

* <p>Title: VehicleCheck</p>  

* <p>Description: </p>  

* @author wangling  

* @date 2018年10月30日
 */
public class VehicleCheck {
	private String id;
	private String operatingnum; 
	private String annualdate; 
	private String nextannualdate; 
	private String vehicle; 
	private String addtime; 
	private String status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOperatingnum() {
		return operatingnum;
	}
	public void setOperatingnum(String operatingnum) {
		this.operatingnum = operatingnum;
	}
	public String getAnnualdate() {
		return annualdate;
	}
	public void setAnnualdate(String annualdate) {
		this.annualdate = annualdate;
	}
	public String getNextannualdate() {
		return nextannualdate;
	}
	public void setNextannualdate(String nextannualdate) {
		this.nextannualdate = nextannualdate;
	}
	public String getVehicle() {
		return vehicle;
	}
	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "VehicleCheck [id=" + id + ", operatingnum=" + operatingnum
				+ ", annualdate=" + annualdate + ", nextannualdate="
				+ nextannualdate + ", vehicle=" + vehicle + ", addtime="
				+ addtime + ", status=" + status + "]";
	}
	
	

}
