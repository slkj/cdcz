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

import cn.slkj.cdtaxt.entity.Zfaj;
import cn.slkj.cdtaxt.mapper.ZfajMapper;
import cn.slkj.cdtaxt.service.ZfajService;

/**
 * @author maxh
 *
 */
@Service
@Transactional
public class ZfajServiceImpl implements ZfajService {
	@Autowired
	private ZfajMapper mapper;

	@Override
	public List<Zfaj> getAll(HashMap<String, Object> map, PageBounds pageBounds) {
		return mapper.queryZfajList(map, pageBounds);
	}

}
