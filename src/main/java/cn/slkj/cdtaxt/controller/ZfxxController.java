/**
 * 
 */
package cn.slkj.cdtaxt.controller;

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

import cn.slkj.cdtaxt.entity.Zfry;
import cn.slkj.cdtaxt.entity.Zfyj;
import cn.slkj.cdtaxt.service.impl.ZfxxServiceImpl;
import cn.slkj.slUtil.easyuiUtil.EPager;
import cn.slkj.slUtil.easyuiUtil.JsonResult;

/**
 * 执法文书信息
 * 
 * @author maxh
 *
 */
@Controller
@RequestMapping(value = "/zfxx")
public class ZfxxController {

	@Autowired
	private ZfxxServiceImpl zfxxServiceImpl;

	/* 跳转页面 */
	@RequestMapping("/zfryListPage")
	public String zfryListPage() {
		return "zfxx/zfryList";
	}

	@RequestMapping("/zfyjListPage")
	public String xywzAddPage() {
		return "zfxx/zfyjList";
	}

	@RequestMapping("/jbxxPage")
	public String jbxxPage() {
		return "zfxx/jbxx";
	}

	@RequestMapping("/ajsdPage")
	public String ajsdPage() {
		return "zfws/ajsd";
	}

	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/zfryList", method = { RequestMethod.POST })
	public EPager<Zfry> getAll(HttpServletRequest request, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, @RequestParam(required = false, defaultValue = "20") Integer rows) {
		String sortString = "";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<Zfry> list = zfxxServiceImpl.getZfryAll(hashMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<Zfry>(pageList.getPaginator().getTotalCount(), list);
	}

	@ResponseBody
	@RequestMapping(value = "/zfryData", method = { RequestMethod.POST })
	public List<Zfry> zfryData(HttpServletRequest request) {
		String sortString = "";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		return zfxxServiceImpl.getZfry(hashMap);
	}

	@ResponseBody
	@RequestMapping(value = "/zfyjList", method = { RequestMethod.POST })
	public EPager<Zfyj> zfyjList(HttpServletRequest request, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, @RequestParam(required = false, defaultValue = "20") Integer rows) {
		String sortString = "";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<Zfyj> list = zfxxServiceImpl.getZfyjAll(hashMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<Zfyj>(pageList.getPaginator().getTotalCount(), list);
	}
	@ResponseBody
	@RequestMapping(value = "/zfyjSave", method = RequestMethod.POST)
	public JsonResult zfyjSave(Zfyj zfyj, HttpServletRequest request) {
		try {
			int i = -1;
			i = zfxxServiceImpl.zfyjSave(zfyj);
			if (i != -1) {
				return new JsonResult(true, "添加成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, e.toString());
		}
		return new JsonResult(false, "添加失败！");
	}
	@ResponseBody
	@RequestMapping(value = "/zfyjUpdate", method = RequestMethod.POST)
	public JsonResult zfyjUpdate(Zfyj zfyj, HttpServletRequest request) {
		try {
			int i = -1;
			i = zfxxServiceImpl.zfyjUpdate(zfyj);
			if (i != -1) {
				return new JsonResult(true, "成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, e.toString());
		}
		return new JsonResult(false, "失败！");
	}
}
