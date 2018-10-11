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
		self.location.href = "../zfws/ajsdPage";
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
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'受案时间:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'交款银行:'" value="中国农业银行双桥支行">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'复议单位:'" value="河北省交通运输厅">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'诉讼单位:'" value="河北省承德市双桥区">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'询问开始时间:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'询问结束时间:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'询问地点:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'执法主体:'">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left"  style="text-align: center;">
						案件基本情况文本:
						<br>
						<input class="easyui-textbox" name="email" style="width: 100%;height: 50px;"  >
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left" style="text-align: center;">
						违法行为文本(《违法行为通知书》): 
						<input class="easyui-textbox" id="lyyj" name="message" style="width: 100%;height: 50px;"  >
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left"  style="text-align: center;">
						讨论记录文本(《集体讨论记录》):<input class="easyui-textbox" name="message" style="width: 100%;height: 50px;" >
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left"  style="text-align: center;">
						结论性意见文本(《集体讨论记录》):<input class="easyui-textbox" id="lyyj" name="message" style="width: 100%;height: 50px;"  >
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left"  style="text-align: center;">
						调查结论和处理意见文本(《调查报告》):<input class="easyui-textbox" name="message"   style="width: 100%;height: 50px;" >
					</div>
				</div>
				<div class="form-btnBar pl75">
					<input type="submit" name="" value="下一步，处理与送达" class="easyui-linkbutton btnPrimary" onclick="toAjwbPage()" style="width: 180px" />
					<input type="submit" name="" value="上一步" class="easyui-linkbutton btnDefault"  onclick="javascript:history.go(-1);" style="width:80px" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
