<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>扫描注册</title>
<%@ include file="/common/taglibs.jsp"%>
</head>
<body>
	<form id="vui_sample" class="easyui-form" method="post" data-options="novalidate:true" style="width: 100%; text-align: center;margin-top: 20px;">
		<div class="form-column1">
			<div class="form-column-left">
				<input class="easyui-textbox" data-options="required:true,prompt:'请扫码或者输入条形码'" style="width: 300px">  
				<input type="submit" value="查询" class="easyui-linkbutton btnPrimary" onclick="submitForm()" style="width: 80px" />
			</div>
		</div>
		<hr>
	</form>
</body>
</html>
