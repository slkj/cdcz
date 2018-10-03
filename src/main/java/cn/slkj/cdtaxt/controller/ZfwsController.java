/**
 * 
 */
package cn.slkj.cdtaxt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import cn.slkj.cdtaxt.entity.Zfaj;
import cn.slkj.cdtaxt.service.impl.ZfajServiceImpl;
import cn.slkj.slUtil.easyuiUtil.EPager;

/**
 * 执法文书
 * 
 * @author maxh
 *
 */
@Controller
@RequestMapping(value = "/zfws")
public class ZfwsController {

	@Autowired
	private ZfajServiceImpl zfajServiceImpl;

	// 案件查询页面 
	@RequestMapping("/ajListPage")
	public String toWritAddPage() {
		return "zfws/ajList";
	}
	//案件添加
	@RequestMapping("/xywzAddPage")
	public String xywzAddPage() {
		return "zfws/xywzAdd";
	}
	//案件涉嫌车辆
	@RequestMapping("/ajclPage")
	public String ajclPage() {
		return "zfws/ajcl";
	}
	//案件文本
	@RequestMapping("/ajwbPage")
	public String ajwbPage() {
		return "zfws/ajwb";
	}
	@RequestMapping("/ajsdPage")
	public String ajsdPage() {
		return "zfws/ajsd";
	}
	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/list", method = { RequestMethod.POST })
	public EPager<Zfaj> getAll(HttpServletRequest request, HttpSession session,
			@RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "20") Integer rows) {
		String sortString = "";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("ajbh", request.getParameter("ajbh"));
		hashMap.put("ajmc", request.getParameter("ajmc"));
		hashMap.put("grxm", request.getParameter("grxm"));
		hashMap.put("ay", request.getParameter("ay"));
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<Zfaj> list = zfajServiceImpl.getAll(hashMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<Zfaj>(pageList.getPaginator().getTotalCount(), list);
	}
}
