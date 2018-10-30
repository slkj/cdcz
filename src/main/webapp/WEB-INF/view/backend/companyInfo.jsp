<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	function save() {
		//校验
		var validate = $("#form").form('validate');
		if (!validate) {
			return validate;
		}
		var data = serializeObject($("#form"));
		return {
			url : getContextPath() + "/company/save",
			param : data
		}
	}
</script>
</head>

<body>
	<form id="form" metdod="post">
		<input id="id" name="id" type="hidden" />
		<table style="width: 100%">
			<tr>
				<td align="right" width="120px">单位名称:</td>
				<td><input class="easyui-textbox" name="unitname" type="text" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">联系电话:</td>
				<td><input class="easyui-textbox" name="phone" type="text" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">单位地址:</td>
				<td><input type="text" class="easyui-textbox" name="unitaddr" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">经营范围:</td>
				<td><input class="easyui-textbox" name="businessscope" type="text" style="width: 95%;height:100px;"  multiline="true" /></td>
			</tr>
			<tr>
				<td align="right">经营许可证号:</td>
				<td><input type="text" class="easyui-textbox" name="businessno" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">企业代码:</td>
				<td><input type="text" class="easyui-textbox" name="enterprisecode" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">注册资本:</td>
				<td><input type="text" class="easyui-textbox" name="regcapital" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">经济类型:</td>
				<td><input type="text" class="easyui-textbox" name="economytype" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">法人代表:</td>
				<td><input type="text" class="easyui-textbox" name="legalrepresentative" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">车辆总数:</td>
				<td><input type="text" class="easyui-textbox" name="vehiclesnum" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">从业人员总数:</td>
				<td><input type="text" class="easyui-textbox" name="employeescount" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">安全管理人员总数:</td>
				<td><input type="text" class="easyui-textbox" name="manageersonnel" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">企业自有车数:</td>
				<td><input type="text" class="easyui-textbox" name="carnum" style="width: 95%;" /></td>
			</tr>
		</table>
	</form>

</body>
</html>