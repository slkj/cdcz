<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>案件-送达</title>
<%@ include file="/common/taglibs.jsp"%>
<style type="text/css">
.form2-column .form-column2 .form-column-left .textbox-label,
	.form2-column .form-column1 .form-column-left .textbox-label,
	.form1-column .form-column1 .form-column-left .textbox-label {
	width: 100px !important;
}
</style>
</head>
<body class="padding10">
	<div class="row">
		<div class="col-md-12">
			<form id="vui_sample" class="easyui-form form2-column" method="post" data-options="novalidate:true" style="margin: 0 0 0 0;">
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'案卷处理时间:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'案卷保管期限:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'案卷件数:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'案卷页数:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'案卷全宗号:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'案卷目录号:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'案卷号:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'卷名:'">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" id="lyyj" name="message" style="width: 100%;" data-options="label:'单位名称:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'单位法定代表人:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'单位职务:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'单位联系电话'">
					</div>
					<div class="form-column-left fm-left">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" id="lyyj" name="message" style="width: 100%;" data-options="label:'单位地址:'">
					</div>
				</div>
				<div class="form-btnBar pl75">
					<input type="submit" name="" value="下一步，打印" class="easyui-linkbutton btnPrimary" onclick="toAjwbPage()" style="width: 180px" />
					<input type="submit" name="" value="上一步" class="easyui-linkbutton btnDefault" onclick="javascript:history.go(-1);" style="width: 80px" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
