package cn.slkj.cdtaxt.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.echarts.TotalNum;
import cn.slkj.cdtaxt.entity.Vehicle;
import cn.slkj.cdtaxt.entity.VehicleCheck;

public interface VehicleService {
	List<Vehicle> getAllList(HashMap<String, Object> hashMap, PageBounds pageBounds);

	int save(Vehicle vehicle);

	Vehicle queryOne(HashMap<String, Object> hashMap);

	int edit(Vehicle vehicle);
	
	public int delete(String id);
	
	List<VehicleCheck> getCheckList(HashMap<String, Object> hashMap, PageBounds pageBounds);
	
	List<VehicleCheck> getOutCheckList(HashMap<String, Object> hashMap, PageBounds pageBounds);
	
	public VehicleCheck queryOneCheck(HashMap<String, Object> hashMap);
	  
	public int saveCheck(VehicleCheck vehicleCheck);

	public int editCheck(VehicleCheck vehicleCheck);
	  
	public int deleteCheck(String id);
	
	public VehicleCheck checkDateByOper(String OpretaCertNum);
	  
	public int changeStatus(HashMap<String, Object> hashMap);
	//public void exportExcel(HashMap<String, Object> map, String[] titles, ServletOutputStream outputStream);
	
	/*List<Vehicle> getList(HashMap<String, Object> hashMap);

	List<TotalNum> getBarData(HashMap<String, Object> hashMap);

	List<TotalNum> queryByCom(HashMap<String, Object> hashMap);
	List<TotalNum> queryByCarType(HashMap<String, Object> hashMap);*/
	
}
