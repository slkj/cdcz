package cn.slkj.cdtaxt.service;

import java.util.HashMap;
import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.Zfaj;

/**
 * @ClassName: ZfajService
 * @Description: 执法案件信息
 * @author maxh
 * 
 */
public interface ZfajService {

	/**
	 * 查询分页记录
	 * 
	 * @param map
	 * @param pageBounds
	 * @return
	 */
	public List<Zfaj> getAll(HashMap<String, Object> map, PageBounds pageBounds);

	 

}
