package cn.slkj.cdtaxt.service;

import java.util.HashMap;
import java.util.List;

import cn.slkj.cdtaxt.entity.Menus;
import cn.slkj.cdtaxt.entity.Module;

public interface ModuleService {

	public List<Module> getAll(HashMap<String, Object> map);

	public Module queryOne(String id);

	public int insert(Module module);

	public int update(Module module);

	public int delete(String id);

	public List<Module> getModuleByRoleId(HashMap<String, Object> map);

	public List<Module> getModuleByUserId(HashMap<String, Object> map);

	public int saveUserRes(HashMap<String, Object> map);

	public List<Module> getRolePer(HashMap<String, Object> map);

	public List<Module> oneLeveListByUser(HashMap<String, Object> map);

	public List<Module> menusListByUser(HashMap<String, Object> map);
}
