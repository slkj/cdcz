package cn.slkj.cdtaxt.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.Cyry;

/**
 * 从业人员dao
 */
@Repository
public interface CyryMapper {

	/**
	 * 查询从业人员分页记录
	 * 
	 * @param map
	 * @param pageBounds
	 * @return
	 */
	public List<Cyry> getCyryAll(HashMap<String, Object> map, PageBounds pageBounds);

	/**
	 * 保存从业人员信息
	 * 
	 * @param Cyry
	 * @return
	 */
	public int cyrySave(Cyry cyry);

	/**
	 * 修改从业人员信息
	 * 
	 * @param Cyry
	 * @return
	 */
	public int cyryUpdate(Cyry cyry);

	public List<Cyry> cyryNewList(HashMap<String, Object> hashMap, PageBounds pageBounds);

}