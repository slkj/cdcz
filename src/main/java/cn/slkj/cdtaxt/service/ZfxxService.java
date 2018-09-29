package cn.slkj.cdtaxt.service;

import java.util.HashMap;
import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.Zfry;
import cn.slkj.cdtaxt.entity.Zfyj;

/**
 * @ClassName: ZfxxService
 * @Description: 执法信息
 * @author maxh
 * 
 */
public interface ZfxxService {

	/**
	 * 查询执法人员分页记录
	 * 
	 * @param map
	 * @param pageBounds
	 * @return
	 */
	public List<Zfry> getZfryAll(HashMap<String, Object> map, PageBounds pageBounds);

	/**
	 * 查詢执法依据分页记录
	 * 
	 * @param map
	 * @param pageBounds
	 * @return
	 */
	public List<Zfyj> getZfyjAll(HashMap<String, Object> map, PageBounds pageBounds);
	/**
	 * 保持执法依据
	 * @param zfyj
	 * @return
	 */
	public int zfyjSave(Zfyj zfyj);
	/**
	 * 修改执法依据
	 * @param zfyj
	 * @return
	 */
	public int zfyjUpdate(Zfyj zfyj);
}
