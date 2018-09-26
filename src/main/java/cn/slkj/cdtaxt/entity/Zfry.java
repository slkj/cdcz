/**
 * 
 */
package cn.slkj.cdtaxt.entity;

/**
 * 执法人员
 * 
 * @author maxh
 *
 */
public class Zfry {
	private String id;// uuid
	private String zfxm;// 姓名
	private String zfzh;// 执法证号
	private String zw;// 职务
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZfxm() {
		return zfxm;
	}
	public void setZfxm(String zfxm) {
		this.zfxm = zfxm;
	}
	public String getZfzh() {
		return zfzh;
	}
	public void setZfzh(String zfzh) {
		this.zfzh = zfzh;
	}
	public String getZw() {
		return zw;
	}
	public void setZw(String zw) {
		this.zw = zw;
	}
	@Override
	public String toString() {
		return "Zfry [id=" + id + ", zfxm=" + zfxm + ", zfzh=" + zfzh + ", zw=" + zw + "]";
	}
	
}
