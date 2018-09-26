/**
 * 
 */
package cn.slkj.cdtaxt.entity;

/**
 * 执法依据条例
 * 
 * @author maxh
 *
 */
public class Zfyj {
	private String id;// uuid
	private String zfyj;// 执法依据
	private String zfyjt;// 执法依据条
	private String zfyjk;// 执法依据款
	private String zfyjx;// 执法依据项
	private String jysm;// 执法依据项
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZfyj() {
		return zfyj;
	}
	public void setZfyj(String zfyj) {
		this.zfyj = zfyj;
	}
	public String getZfyjt() {
		return zfyjt;
	}
	public void setZfyjt(String zfyjt) {
		this.zfyjt = zfyjt;
	}
	public String getZfyjk() {
		return zfyjk;
	}
	public void setZfyjk(String zfyjk) {
		this.zfyjk = zfyjk;
	}
	public String getZfyjx() {
		return zfyjx;
	}
	public void setZfyjx(String zfyjx) {
		this.zfyjx = zfyjx;
	}
	public String getJysm() {
		return jysm;
	}
	public void setJysm(String jysm) {
		this.jysm = jysm;
	}
	@Override
	public String toString() {
		return "Zfyj [id=" + id + ", zfyj=" + zfyj + ", zfyjt=" + zfyjt + ", zfyjk=" + zfyjk + ", zfyjx=" + zfyjx + ", jysm=" + jysm + "]";
	}
	
}
