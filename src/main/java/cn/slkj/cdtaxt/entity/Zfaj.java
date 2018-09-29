/**
 * 
 */
package cn.slkj.cdtaxt.entity;

/**
 * 案件信息
 * 
 * @author maxh
 *
 */
public class Zfaj {
	private String id;//uuid
	private String ajbh;//案件编号
	private String ajmc;//案件名称
	private String grxm;//个人名称
	private String jlr;//记录人
	private String ay;//案由
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAjbh() {
		return ajbh;
	}
	public void setAjbh(String ajbh) {
		this.ajbh = ajbh;
	}
	public String getAjmc() {
		return ajmc;
	}
	public void setAjmc(String ajmc) {
		this.ajmc = ajmc;
	}
	public String getGrxm() {
		return grxm;
	}
	public void setGrxm(String grxm) {
		this.grxm = grxm;
	}
	public String getJlr() {
		return jlr;
	}
	public void setJlr(String jlr) {
		this.jlr = jlr;
	}
	public String getAy() {
		return ay;
	}
	public void setAy(String ay) {
		this.ay = ay;
	}
	@Override
	public String toString() {
		return "Zfaj [id=" + id + ", ajbh=" + ajbh + ", ajmc=" + ajmc + ", grxm=" + grxm + ", jlr=" + jlr + ", ay=" + ay
				+ "]";
	}
	
}
