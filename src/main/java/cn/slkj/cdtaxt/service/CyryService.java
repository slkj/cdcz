package cn.slkj.cdtaxt.service;

import java.util.HashMap;
import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.Cyry;

/**
 * @ClassName: CyryService
 * @Description: 从业人员管理
 * @author maxh
 * 
 */
public interface CyryService {

	/**
	 * 查询从业人员分页记录
	 * 
	 * @param map
	 * @param pageBounds
	 * @return
	 */
	List<Cyry> getCyryAll(HashMap<String, Object> map, PageBounds pageBounds);

	/**
	 * 保存从业人员信息
	 * 
	 * @param Cyry
	 * @return
	 */
	int cyrySave(Cyry cyry);

	/**
	 * 修改从业人员信息
	 * 
	 * @param Cyry
	 * @return
	 */
	int cyryUpdate(Cyry cyry);

	/**
	 * 查询新加人员列表
	 * 
	 * @param hashMap
	 * @param pageBounds
	 * @return
	 */
	List<Cyry> cyryNewList(HashMap<String, Object> hashMap, PageBounds pageBounds);
}
