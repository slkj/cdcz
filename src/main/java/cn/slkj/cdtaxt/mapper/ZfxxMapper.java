package cn.slkj.cdtaxt.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.Zfry;
import cn.slkj.cdtaxt.entity.Zfyj;

/**
 * 执法案件
 */
@Repository
public interface ZfxxMapper {

	/**
	 * 执法人员查询列表
	 * 
	 * @param map
	 * @return
	 */
	List<Zfry> queryZfryList(HashMap<String, Object> map, PageBounds pageBounds);

	/**
	 * 执法依据
	 * 
	 * @param map
	 * @param pageBounds
	 * @return
	 */
	List<Zfyj> queryZfyjList(HashMap<String, Object> map, PageBounds pageBounds);

	List<Zfry> queryZfyj(HashMap<String, Object> hashMap);

	int zfyjSave(Zfyj zfyj);

	int zfyjUpdate(Zfyj zfyj);

}