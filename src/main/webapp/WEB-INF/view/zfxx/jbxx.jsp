<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	$(function() {
		$.ajax({
			type : 'get',
			url : '../assets/json/jbxx.json',
			dataType : 'json',
			success : function(data) {
				$("#vui_sample").form('load', data);
			}
		})
	});
	function submitForm() {
	}
</script>
</head>
<body class="padding10">
	<div class="row">
		<div class="col-md-12">
			<form id="vui_sample" class="easyui-form form2-column" method="post" data-options="novalidate:true">
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="sddw" style="width: 100%" data-options="label:'送达单位:',required:true">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="jfyh" style="width: 100%" data-options="label:'缴款银行:',required:true">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="ajmc" style="width: 100%" data-options="label:'案卷名称:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="fydw" style="width: 100%" data-options="label:'复议单位:',required:true">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="ajbgqx" style="width: 100%" data-options="label:'案卷保管期限:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="ssdw" style="width: 100%" data-options="label:'诉讼单位:',required:true">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="ajjs" style="width: 100%" data-options="label:'案卷件数:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="zfzt" style="width: 100%" data-options="label:'执法主体:',required:true">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="ajqzh" style="width: 100%" data-options="label:'案卷全宗号:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="tzlxdz" style="width: 100%" data-options="label:'通知联系地址:',required:true">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="tzlxr" style="width: 100%" data-options="label:'通知联系人:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="tzlxyb" style="width: 100%" data-options="label:'通知联系邮箱:',required:true">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="tzlxdh" style="width: 100%" data-options="label:'通知联系电话:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="tldd" style="width: 100%" data-options="label:'讨论地点:',required:true">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="gzyq" style="width: 100%" data-options="label:'改正要求:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="zjcljd" style="width: 100%" data-options="label:'证据处理决定:',required:true">
					</div>
				</div>
				<div class="form-btnBar pl75">
					<input type="submit" name="" value="保存" class="easyui-linkbutton btnPrimary" onclick="submitForm()" style="width: 80px" /> <input type="submit" name="" value="重置" class="easyui-linkbutton btnDefault" onclick="clearForm()" style="width: 80px" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>