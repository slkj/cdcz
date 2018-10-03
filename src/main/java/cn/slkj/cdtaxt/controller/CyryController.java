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

import cn.slkj.cdtaxt.entity.Cyry;
import cn.slkj.cdtaxt.service.impl.CyryServiceImpl;
import cn.slkj.slUtil.easyuiUtil.EPager;
import cn.slkj.slUtil.easyuiUtil.JsonResult;

/**
 * 从业人员控制层
 * 
 * @author maxh
 *
 */
@Controller
@RequestMapping(value = "/cyry")
public class CyryController {

	@Autowired
	private CyryServiceImpl cyryServiceImpl;

	// 总台账跳转页面
	@RequestMapping("/cyryListPage")
	public String zfryListPage() {
		return "cyry/cyryList";
	}

	// 新报名跳转页面
	@RequestMapping("/xbmryListPage")
	public String xbmryListPage() {
		return "cyry/xbmryList";
	}

	// 通过考核跳转页面
	@RequestMapping("/tgksryListPage")
	public String tgksryListPage() {
		return "cyry/tgksryList";
	}

	// 未通过跳转页面
	@RequestMapping("/wtgksryListPage")
	public String wtgksryListPage() {
		return "cyry/wtgksryList";
	}

	// 死亡库跳转页面
	@RequestMapping("/swkListPage")
	public String swkListPage() {
		return "cyry/swkList";
	}

	// 超龄库跳转页面
	@RequestMapping("/clkListPage")
	public String clkListPage() {
		return "cyry/clkList";
	}

	// 发证机关跳转页面
	@RequestMapping("/fzjgListPage")
	public String fzjgListPage() {
		return "cyry/fzjgList";
	}

	// 注册审核跳转页面
	@RequestMapping("/zcshListPage")
	public String zcshListPage() {
		return "cyry/zcshList";
	}

	// 扫描注册跳转页面
	@RequestMapping("/smzcListPage")
	public String smzcListPage() {
		return "cyry/smzcList";
	}

	// 成绩录入跳转页面
	@RequestMapping("/cjlrListPage")
	public String cjlrListPage() {
		return "cyry/cjlrList";
	}

	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/cyryList", method = { RequestMethod.POST })
	public EPager<Cyry> cyryList(HttpServletRequest request, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, @RequestParam(required = false, defaultValue = "20") Integer rows) {
		String sortString = "";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		String isdie = request.getParameter("isdie");
		hashMap.put("isdie", isdie);

		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<Cyry> list = cyryServiceImpl.getCyryAll(hashMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<Cyry>(pageList.getPaginator().getTotalCount(), list);
	}

	/**
	 * 查询新加人员列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/cyryNewList", method = { RequestMethod.POST })
	public EPager<Cyry> cyryNewList(HttpServletRequest request, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, @RequestParam(required = false, defaultValue = "20") Integer rows) {
		String sortString = "";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<Cyry> list = cyryServiceImpl.cyryNewList(hashMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<Cyry>(pageList.getPaginator().getTotalCount(), list);
	}

	/**
	 * 添加
	 * 
	 * @param cyry
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/cyrySave", method = RequestMethod.POST)
	public JsonResult zfyjSave(Cyry cyry, HttpServletRequest request) {
		try {
			int i = -1;
			i = cyryServiceImpl.cyrySave(cyry);
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
	@RequestMapping(value = "/cyryUpdate", method = RequestMethod.POST)
	public JsonResult cyryUpdate(Cyry cyry, HttpServletRequest request) {
		try {
			int i = -1;
			i = cyryServiceImpl.cyryUpdate(cyry);
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
