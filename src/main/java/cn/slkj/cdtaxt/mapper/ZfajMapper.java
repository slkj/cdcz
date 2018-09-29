package cn.slkj.cdtaxt.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.Zfaj;

/**
 * 执法案件
 */
@Repository
public interface ZfajMapper {

	/**
	 * 查询列表
	 * 
	 * @param map
	 * @return
	 */
	List<Zfaj> queryZfajList(HashMap<String, Object> map, PageBounds pageBounds);

}