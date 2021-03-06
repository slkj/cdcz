package cn.slkj.cdtaxt.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import cn.slkj.cdtaxt.echarts.EchartData;
import cn.slkj.cdtaxt.echarts.Series;
import cn.slkj.cdtaxt.echarts.TotalNum;
import cn.slkj.cdtaxt.entity.Vehicle;
import cn.slkj.cdtaxt.entity.VehicleCheck;
import cn.slkj.cdtaxt.service.VehicleService;
import cn.slkj.cdtaxt.util.DateUtil;
import cn.slkj.slUtil.FileUtil;
import cn.slkj.slUtil.UuidUtil;
import cn.slkj.slUtil.easyuiUtil.EPager;
import cn.slkj.slUtil.easyuiUtil.JsonResult;

/**
 * 
 * @ClassName: UserController
 * @Description: 用户信息
 * @author maxh
 *
 */
@Controller
@RequestMapping(value = "/vehicle")
public class VehicleController {
	@Autowired
	private VehicleService vehicleService;

	/* 跳转页面 */
	@RequestMapping("/vehicleListPage")
	public String toCarListPage() {
		return "vehicle/vehicleList";
	}
	/* 跳转页面 */
	@RequestMapping("/vehicleCheckListPage")
	public String tovehicleCheckListPage() {
		return "vehicle/vehicleCheckList";
	}
	/* 跳转页面 */
	@RequestMapping("/vehicleOutCheckListPage")
	public String tovehicleOutCheckListPage() {
		return "vehicle/vehicleOutCheckList";
	}

	@RequestMapping("/vehicleFormPage")
	public String toVehicleFormPage() {
		return "vehicle/vehicleForm";
	}
	@RequestMapping("/vehicleCheckAddPage")
	public String toVehicleCheckAddPage() {
		return "vehicle/vehicleCheckAdd";
	}
	@RequestMapping("/vehicleTopCheckFormPage")
	public String toVehicleTopCheckFormPage() {
		return "vehicle/vehicleTopCheckForm";
	}
	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/list", method = { RequestMethod.POST })
	public EPager<Vehicle> getAllUsers(HttpServletRequest request, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, // 第几页
			@RequestParam(required = false, defaultValue = "20") Integer rows) {
		String sortString = "ADDTIME.DESC";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("PlateNum", request.getParameter("PlateNum"));
		hashMap.put("OpretaCertNum", request.getParameter("OpretaCertNum"));
		hashMap.put("OwnerName", request.getParameter("OwnerName"));
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<Vehicle> list = vehicleService.getAllList(hashMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<Vehicle>(pageList.getPaginator().getTotalCount(), list);
	}
	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/checkList", method = { RequestMethod.POST })
	public EPager<VehicleCheck> getCheckList(HttpServletRequest request, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, // 第几页
			@RequestParam(required = false, defaultValue = "10") Integer rows) {
		String sortString = "ADDTIME.DESC";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("operatingnum", request.getParameter("operatingnum"));
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<VehicleCheck> list = vehicleService.getCheckList(hashMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<VehicleCheck>(pageList.getPaginator().getTotalCount(), list);
	}
	
	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/outcheckList", method = { RequestMethod.POST })
	public EPager<VehicleCheck> getOutCheckList(HttpServletRequest request, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, // 第几页
			@RequestParam(required = false, defaultValue = "10") Integer rows) {
		String sortString = "ADDTIME.DESC";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("operatingnum", request.getParameter("operatingnum"));
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<VehicleCheck> list = vehicleService.getOutCheckList(hashMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<VehicleCheck>(pageList.getPaginator().getTotalCount(), list);
	}

	/**
	 * 查询单条信息
	 */
	@ResponseBody
	@RequestMapping(value = "/queryOne", method = { RequestMethod.POST })
	public Vehicle queryOne(String id) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("id", id);
		Vehicle vehicle = vehicleService.queryOne(hashMap);
		return vehicle;
	}
	/**
	 * 查询单条信息
	 */
	@ResponseBody
	@RequestMapping(value = "/queryOneByOpr", method = { RequestMethod.POST })
	public Vehicle queryOneByOpr(String opretaCertNum) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("OpretaCertNum", opretaCertNum);
		Vehicle vehicle = vehicleService.queryOne(hashMap);
		return vehicle;
	}
	/**
	 * 保存车辆信息
	 * 
	 * @param vehicle
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public JsonResult save(@RequestParam(value="ownernamepic1", required=false) MultipartFile ownernamepic1,
			@RequestParam(value="vehiclepic1", required=false) MultipartFile vehiclepic1,
			Vehicle vehicle, HttpServletRequest request) {
		try {
			
			 if ((vehiclepic1 != null) && (!vehiclepic1.isEmpty())) {
			vehicle.setVehiclePic(FileUtil.toByteArray(vehiclepic1.getInputStream()));
			 }
			 if ((ownernamepic1 != null) && (!ownernamepic1.isEmpty())) {
			vehicle.setOwnerNamePic(FileUtil.toByteArray(ownernamepic1.getInputStream()));
			 }
			int i = -1;
			//HttpSession session = request.getSession();
			vehicle.setId(UuidUtil.get32UUID());
			vehicle.setaDDTIME(DateUtil.getTime());
			i = vehicleService.save(vehicle);
			if (i != -1) {
				return new JsonResult(true, "添加成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, e.toString());
		}
		return new JsonResult(false, "添加失败！");
	}

	/**
	 * 编辑车辆信息
	 * 
	 * @param vehicle
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public JsonResult editVehicle(@RequestParam(value="ownernamepic1", required=false) MultipartFile ownernamepic1,
			@RequestParam(value="vehiclepic1", required=false) MultipartFile vehiclepic1,
			Vehicle vehicle) {
		try {
			if ((vehiclepic1 != null) && (!vehiclepic1.isEmpty())) {
				vehicle.setVehiclePic(FileUtil.toByteArray(vehiclepic1.getInputStream()));
				 }
				 if ((ownernamepic1 != null) && (!ownernamepic1.isEmpty())) {
				vehicle.setOwnerNamePic(FileUtil.toByteArray(ownernamepic1.getInputStream()));
				 }
			int i = -1;
			vehicle.setaDDTIME(DateUtil.getTime());
			i = vehicleService.edit(vehicle);
			if (i != -1) {
				return new JsonResult(true, "操作成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, e.toString());
		}
		return new JsonResult(false, "操作失败！");
	}

	/** 删除 */
	@ResponseBody
	@RequestMapping(value = "/delete")
	public JsonResult deletes(String id) {
		int i = vehicleService.delete(id);
		try {
			if (i > 0) {
				return new JsonResult(true, "");
			} else {
				return new JsonResult(false, "操作失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, e.toString());
		}

	}
	
	@RequestMapping({"/getVehiclepic"})
	  public void getVehiclepic(String id,String operatingnum, HttpServletRequest request, HttpServletResponse response)
	    throws IOException
	  {
	    try
	    {
	    	HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("id", id);
			hashMap.put("OpretaCertNum", operatingnum);
			Vehicle vehicle = vehicleService.queryOne(hashMap);
	      byte[] data = vehicle.getVehiclePic();
	      response.setContentType("image/jpg");
	      OutputStream stream = response.getOutputStream();
	      stream.write(data);
	      stream.flush();
	      stream.close();
	    } catch (Exception e) {
	    	System.out.println("图片无法显示");
			e.printStackTrace();
	    }
	  }

	  @RequestMapping({"/getOwnernamepic"})
	  public void getOwnernamepic(String id,String operatingnum, HttpServletRequest request, HttpServletResponse response)
	    throws IOException
	  {
	    try
	    {
	    	HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("id", id);
			hashMap.put("OpretaCertNum", operatingnum);
			Vehicle vehicle = vehicleService.queryOne(hashMap);
	      byte[] data = vehicle.getOwnerNamePic();
	      response.setContentType("image/jpg");
	      OutputStream stream = response.getOutputStream();
	      stream.write(data);
	      stream.flush();
	      stream.close();
	    } catch (Exception e) {
	    	System.out.println("图片无法显示");
			e.printStackTrace();
	    }
	  }
	  
	  /**
		 * 查询单条信息
		 */
		@ResponseBody
		@RequestMapping(value = "/queryOneCheck", method = { RequestMethod.POST })
		public VehicleCheck queryOneCheck(String id) {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("id", id);
			VehicleCheck vehicleCheck = vehicleService.queryOneCheck(hashMap);
			return vehicleCheck;
		}
	  
	  /**
		 * 保存车辆信息
		 * 
		 * @param vehicle
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value = "/saveCheck", method = RequestMethod.POST)
		public JsonResult saveCheck(VehicleCheck vehicleCheck,
				HttpServletRequest request) {
			try {
				
				int i = -1;
				//HttpSession session = request.getSession();
				vehicleCheck.setId(UuidUtil.get32UUID());
				vehicleCheck.setAddtime(DateUtil.getTime());
				 if (vehicleService.checkDateByOper(vehicleCheck.getOperatingnum())==null) {
					 vehicleCheck.setStatus("0");
			          } else {
			         vehicleCheck.setStatus("1");
			          }
				i = vehicleService.saveCheck(vehicleCheck);
				if (i != -1) {
					return new JsonResult(true, "添加成功。");
				}
			} catch (Exception e) {
				e.printStackTrace();
				return new JsonResult(false, e.toString());
			}
			return new JsonResult(false, "添加失败！");
		}

		/**
		 * 编辑车辆信息
		 * 
		 * @param vehicle
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value = "/editCheck", method = RequestMethod.POST)
		public JsonResult editVehicleCheck(VehicleCheck vehicleCheck) {
			try {
				
				int i = -1;
				vehicleCheck.setAddtime(DateUtil.getTime());
				i = vehicleService.editCheck(vehicleCheck);
				if (i != -1) {
					return new JsonResult(true, "操作成功。");
				}
			} catch (Exception e) {
				e.printStackTrace();
				return new JsonResult(false, e.toString());
			}
			return new JsonResult(false, "操作失败！");
		}

		/** 删除 */
		@ResponseBody
		@RequestMapping(value = "/deleteCheck")
		public JsonResult deleteCheck(String id) {
			int i = vehicleService.deleteCheck(id);
			try {
				if (i > 0) {
					return new JsonResult(true, "");
				} else {
					return new JsonResult(false, "操作失败！");
				}
			} catch (Exception e) {
				e.printStackTrace();
				return new JsonResult(false, e.toString());
			}

		}
		/**
		 * 编辑车辆信息
		 * 
		 * @param vehicle
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value = "/editCheckStatus", method = RequestMethod.POST)
		public JsonResult editVehicleCheckStatus(String id,String status) {
			try {
				
				int i = -1;
				HashMap<String, Object> hashMap = new HashMap<String, Object>();
				hashMap.put("id", id);
				hashMap.put("status", status);
				i = vehicleService.changeStatus(hashMap);
				if (i != -1) {
					return new JsonResult(true, "操作成功。");
				}
			} catch (Exception e) {
				e.printStackTrace();
				return new JsonResult(false, e.toString());
			}
			return new JsonResult(false, "操作失败！");
		}
	/*@RequestMapping("/getWithImage")
	public void getWithImage(String imageType, String pkey, HttpServletResponse response, HttpServletRequest request) throws Exception {
		// 根据id获取车辆信息
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("id", pkey);
		Vehicle vehicle = vehicleService.queryOne(hashMap);
		String carPotoPath = "";

		switch (imageType) {
		case "carOwnerPhoto":
			carPotoPath = vehicle.getCarOwnerPhoto();
			break;
		case "carPhoto":
			carPotoPath = vehicle.getCarPhoto();
			break;
		case "certificatePhoto":
			carPotoPath = vehicle.getCertificatePhoto();
			break;
		case "certificatePhoto2":
			carPotoPath = vehicle.getCertificatePhoto2();
			break;
		case "driverPhoto":
			carPotoPath = vehicle.getDriverPhoto();
			break;
		}
		if (carPotoPath == null) {
			return;
		}
		String baseFilePath = "D:\\weblogs\\cdtaxt\\";
		// 返回照片流
		// 设置响应头:内容处理方式 → attachment(附件,有为下载,没有为预览加载) →指定文件名
		// response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
		// 从服务器上下载图片,要找到图片在服务器中的真实位置
		// 从服务器上读入程序中
		InputStream fileInputStream = new FileInputStream(baseFilePath + carPotoPath);
		// 从程序中写出下载到客户端
		OutputStream outputStream = response.getOutputStream();
		// copy以及关闭流资源
		IOUtils.copy(fileInputStream, outputStream);
		outputStream.close();
		fileInputStream.close();

	}*/

	/**
	 * 导出设备汇总表
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	/*@RequestMapping(value = "/exporsb")
	public String exporsb(HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("application/binary;charset=ISO8859_1");
		try {
			ServletOutputStream outputStream = response.getOutputStream();
			String fileName = new String(("车辆信息").getBytes(), "ISO8859_1");
			response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xlsx");// 组装附件名称和格式
			String[] titles = { "营运证号", "车牌号", "燃料类型", "颜色", "车辆品牌", "公司名称", "车主", "联系电话", "身份证号", "家庭住址", "原车号", "原车主" };
			HashMap<String, Object> pageMap = new HashMap<String, Object>();
			pageMap.put("rktime", request.getParameter("rktime"));
			pageMap.put("rktime1", request.getParameter("rktime1"));
			pageMap.put("lytime", request.getParameter("lytime"));
			pageMap.put("lytime1", request.getParameter("lytime1"));
			pageMap.put("fhtime", request.getParameter("fhtime"));
			pageMap.put("fhtime1", request.getParameter("fhtime1"));
			pageMap.put("state", request.getParameter("state"));
			pageMap.put("ustate", request.getParameter("ustate"));
			pageMap.put("lyr", request.getParameter("lyr"));
			pageMap.put("firm", request.getParameter("firm"));
			pageMap.put("listnum", request.getParameter("listnum"));
			pageMap.put("carNumber", request.getParameter("carNumber"));
			pageMap.put("model", request.getParameter("model"));
			pageMap.put("simNumber", request.getParameter("simNumber"));
			pageMap.put("inspector", request.getParameter("inspector"));
			
			//vehicleService.exportExcel(pageMap, titles, outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}*/
	  /* *//**
     * 饼状图
     * @param <T>
     * @return
     *//*
    @RequestMapping("/showEchartBar")
    @ResponseBody
    public EchartData BarData() {
        System.out.println("柱状图");
        List<String> category = new ArrayList<String>();
        List<Long> serisData=new ArrayList<Long>();
        HashMap<String, Object> hashMap = new HashMap<>();
		List<TotalNum> list = vehicleService.getBarData(hashMap );
		 for (TotalNum totalNum : list) {
	            category.add(totalNum.getWeek());
	            serisData.add(totalNum.getCount());
	        }
        List<String> legend = new ArrayList<String>(Arrays.asList(new String[] { "合计" }));// 数据分组
        List<Series> series = new ArrayList<Series>();// 纵坐标
        series.add(new Series("合计", "bar", serisData));
        EchartData data = new EchartData(legend, category, series);
        return data;
    }
    @RequestMapping("/queryByCom")
    @ResponseBody
    public List<TotalNum>  queryByCom() {
    	HashMap<String, Object> hashMap = new HashMap<>();
    	List<TotalNum> list = vehicleService.queryByCom(hashMap );
        return list;
    }
    @RequestMapping("/queryByCarType")
    @ResponseBody
    public List<TotalNum>  queryByCarType() {
    	HashMap<String, Object> hashMap = new HashMap<>();
    	List<TotalNum> list = vehicleService.queryByCarType(hashMap );
        return list;
    }*/
    
}
