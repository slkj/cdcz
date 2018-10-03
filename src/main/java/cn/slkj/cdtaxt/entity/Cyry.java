/**
 * 
 */
package cn.slkj.cdtaxt.entity;

/**
 * 从业人员信息
 * 
 * @author maxh
 *
 */
public class Cyry {

	private int id;
	private String cyxm;
	private int cyxb;
	private String sfzh;
	private String cyzgzh;
	private String zccl;
	private String chexing;
	private String ssgs;
	private String zhuangtai;
	private int isdie;
	private String sqsj;
	
	
	public String getSqsj() {
		return sqsj;
	}
	public void setSqsj(String sqsj) {
		this.sqsj = sqsj;
	}
	public int getIsdie() {
		return isdie;
	}
	public void setIsdie(int isdie) {
		this.isdie = isdie;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCyxm() {
		return cyxm;
	}
	public void setCyxm(String cyxm) {
		this.cyxm = cyxm;
	}
	public int getCyxb() {
		return cyxb;
	}
	public void setCyxb(int cyxb) {
		this.cyxb = cyxb;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getCyzgzh() {
		return cyzgzh;
	}
	public void setCyzgzh(String cyzgzh) {
		this.cyzgzh = cyzgzh;
	}
	public String getZccl() {
		return zccl;
	}
	public void setZccl(String zccl) {
		this.zccl = zccl;
	}
	public String getChexing() {
		return chexing;
	}
	public void setChexing(String chexing) {
		this.chexing = chexing;
	}
	public String getSsgs() {
		return ssgs;
	}
	public void setSsgs(String ssgs) {
		this.ssgs = ssgs;
	}
	public String getZhuangtai() {
		return zhuangtai;
	}
	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}
	@Override
	public String toString() {
		return "Cyry [id=" + id + ", cyxm=" + cyxm + ", cyxb=" + cyxb + ", sfzh=" + sfzh + ", cyzgzh=" + cyzgzh + ", zccl=" + zccl + ", chexing=" + chexing + ", ssgs=" + ssgs + ", zhuangtai=" + zhuangtai + ", isdie=" + isdie + "]";
	}
	
}
