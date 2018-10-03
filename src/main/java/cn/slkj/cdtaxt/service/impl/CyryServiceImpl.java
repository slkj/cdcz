package cn.slkj.cdtaxt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.Cyry;
import cn.slkj.cdtaxt.mapper.CyryMapper;
import cn.slkj.cdtaxt.service.CyryService;

/**
 * 
 * @author maxh
 *
 */
@Service
@Transactional
public class CyryServiceImpl implements CyryService {
	@Autowired
	private CyryMapper mapper;

	@Override
	public List<Cyry> getCyryAll(HashMap<String, Object> map, PageBounds pageBounds) {
		return mapper.getCyryAll(map, pageBounds);
	}

	@Override
	public int cyrySave(Cyry cyry) {
		return mapper.cyrySave(cyry);
	}

	@Override
	public int cyryUpdate(Cyry cyry) {
		return mapper.cyryUpdate(cyry);
	}
	@Override
	public List<Cyry> cyryNewList(HashMap<String, Object> hashMap, PageBounds pageBounds) {
		return mapper.cyryNewList(hashMap, pageBounds);
	}

}
