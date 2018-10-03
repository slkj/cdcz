<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>案件-车辆</title>
<%@ include file="/common/taglibs.jsp"%>
<style type="text/css">
.form2-column .form-column2 .form-column-left .textbox-label,
	.form2-column .form-column1 .form-column-left .textbox-label,
	.form1-column .form-column1 .form-column-left .textbox-label {
	width: 100px !important;
}
</style>
<script type="text/javascript">
	function toAjwbPage() {
		self.location.href = "../zfws/ajwbPage";
	}
	$(function() {
		// 		loadzfyj();
	});

	function loadzfyj() {
		$('#lyyj').combogrid(
				{
					panelWidth : 550,
					idField : 'id',
					textField : 'zfyj',
					url : '../zfxx/zfyjList',
					columns : [ [ {
						field : 'zfyj',
						title : '执法依据',
					}, {
						field : 'zfyjt',
						title : '执法依据条',
					}, {
						field : 'zfyjk',
						title : '执法依据款',
					}, {
						field : 'zfyjx',
						title : '执法依据项',
					} ] ],
					onSelect : function(rowIndex, rowData) {
						$("#layjTexr").html(
								rowData.zfyjt + rowData.zfyjk + rowData.zfyjx);
					}
				});
	}
</script>
</head>
<body class="padding10">
	<div class="row">
		<div class="col-md-12">
			<form id="vui_sample" class="easyui-form form2-column" method="post" data-options="novalidate:true" style="margin: 0 0 0 0;">
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'车牌号码:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'车辆颜色:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'车辆型号:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'乘客人数:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'车费:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'发生时间:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'发生地点:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'道路运输证号:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'乘客起点地址:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'乘客目的地址:'">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-combobox" id="lyyj" name="message" style="width: 100%;" data-options="label:'案由:'">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="message" style="width: 100%;" data-options="label:'行政处罚:'">
					</div>
				</div>

				<div class="form-btnBar pl75">
					<input type="submit" name="" value="下一步，案件文本" class="easyui-linkbutton btnPrimary" onclick="toAjwbPage()" style="width: 180px" />
					<input type="submit" name="" value="上一步" class="easyui-linkbutton btnDefault"  onclick="javascript:history.go(-1);" style="width:80px" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
