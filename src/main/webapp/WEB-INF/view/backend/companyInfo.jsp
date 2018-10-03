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
				<td align="right" width="70px">企业编号:</td>
				<td><input class="easyui-textbox" name="compCode" type="text" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">企业名称:</td>
				<td><input class="easyui-textbox" name="compName" type="text" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">企业简称:</td>
				<td><input type="text" class="easyui-textbox" name="compNameJc" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">联系人:</td>
				<td><input class="easyui-textbox" name="linkman" type="text" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">联系电话:</td>
				<td><input type="text" class="easyui-textbox" name="mobile" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">Email:</td>
				<td><input type="text" class="easyui-textbox" name="email" style="width: 95%;" /></td>
			</tr>
			<tr>
				<td align="right">QQ:</td>
				<td><input type="text" class="easyui-textbox" name="qq" style="width: 95%;" /></td>
			</tr>
		</table>
	</form>

</body>
</html>