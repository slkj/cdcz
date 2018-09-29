/**
 * 
 */
package cn.slkj.cdtaxt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.Zfry;
import cn.slkj.cdtaxt.entity.Zfyj;
import cn.slkj.cdtaxt.mapper.ZfxxMapper;
import cn.slkj.cdtaxt.service.ZfxxService;

/**
 * @author maxh
 *
 */
@Service
@Transactional
public class ZfxxServiceImpl implements ZfxxService {
	@Autowired
	private ZfxxMapper mapper;

	/**
	 * 执法人员查询
	 */
	@Override
	public List<Zfry> getZfryAll(HashMap<String, Object> map, PageBounds pageBounds) {
		return mapper.queryZfryList(map, pageBounds);
	}

	@Override
	public List<Zfyj> getZfyjAll(HashMap<String, Object> map, PageBounds pageBounds) {
		return mapper.queryZfyjList(map, pageBounds);
	}

	public List<Zfry> getZfry(HashMap<String, Object> hashMap) {
		return mapper.queryZfyj(hashMap);
	}

	/**
	 * 保持执法依据
	 */
	@Override
	public int zfyjSave(Zfyj zfyj) {
		return mapper.zfyjSave(zfyj);
	}

	/**
	 * 修改执法依据
	 */
	@Override
	public int zfyjUpdate(Zfyj zfyj) {
		return mapper.zfyjUpdate(zfyj);
	}
 

}
