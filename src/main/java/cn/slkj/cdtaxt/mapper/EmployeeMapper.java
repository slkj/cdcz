package cn.slkj.cdtaxt.mapper;

import java.util.HashMap;
import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.Employee;

/**
 * 从业人员dao
 */
public interface EmployeeMapper {
	/**
	 * 查询分页数据
	 * 
	 * @param map
	 * @param pageBounds
	 * @return
	 */
	List<Employee> listPage(HashMap<String, Object> map, PageBounds pageBounds);

	Employee selectOne(HashMap<String, Object> hashMap);

	int deleteById(String id);

	List<Employee> slistPage(HashMap<String, Object> map, PageBounds pageBounds);

}
