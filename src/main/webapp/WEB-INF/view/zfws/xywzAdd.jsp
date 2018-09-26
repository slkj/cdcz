<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>承德市出租汽车管理系统</title>
<%@ include file="/common/taglibs.jsp"%>
</head>
<body>
	<div class="dataView-container">
		<div class="form-wrapper hide" id="form-wrapper">
			<div class="form2-column" title="表单示例">
				<h3 class="form-title">新增资源</h3>
				<form id="vui_sample" class="easyui-form" method="post" data-options="novalidate:true">
					<div class="form-column2">
						<div class="form-column-left">
							<input class="easyui-textbox" name="name" style="width: 100%" data-options="label:'申请单号:',required:true">
						</div>
						<div class="form-column-left fm-left">
							<select class="easyui-combobox" name="state" data-options="label:'状态:',required:true" labelPosition="top" style="width: 100%;">
								<option value="AL">新增</option>
								<option value="AK">已提交</option>
								<option value="AZ">申请中</option>
								<option value="AR">已入库</option>
							</select>
						</div>
					</div>
					<div class="form-column2">
						<div class="form-column-left">
							<input class="easyui-textbox" name="wznumber" style="width: 100%" data-options="label:'物料编号:',required:true">
						</div>
						<div class="form-column-left fm-left">
							<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'物料名称:',required:true">
						</div>
					</div>
					<div class="form-column2">
						<div class="form-column-left">
							<select class="easyui-combobox" name="state" data-options="label:'物料类型:',required:true" labelPosition="top" style="width: 100%;">
								<option value="AL">原材料</option>
								<option value="AK">辅料</option>
								<option value="AZ">产品</option>
								<option value="AR">深加工原料</option>
							</select>
						</div>
						<div class="form-column-left fm-left">
							<select class="easyui-combobox" name="state" data-options="label:'入库类型:',required:true" labelPosition="top" style="width: 100%;">
								<option value="AL">原材料入库</option>
								<option value="AK">辅料入库</option>
								<option value="AZ">产品入库</option>
								<option value="AR">深加工原料入库</option>
							</select>
						</div>
					</div>
					<div class="form-column2">
						<div class="form-column-left">
							<input class="easyui-textbox" name="sqkf" style="width: 100%" data-options="label:'申请库房:',required:true">
						</div>
						<div class="form-column-left fm-left">
							<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'申请数量:',required:true,validType:'number'">
						</div>
					</div>
					<div class="form-column2">
						<div class="form-column-left">
							<input class="easyui-textbox" name="sqkf" style="width: 100%" data-options="label:'单位:',required:true">
						</div>
						<div class="form-column-left fm-left">
							<input class="easyui-textbox" id="storage-time" name="subject" style="width: 100%" data-options="label:'存储期限:',required:true">
						</div>
					</div>
					<div class="form-column1">
						<div class="form-column-left">
							<input class="easyui-textbox" name="message" style="width: 100%; height: 60px" data-options="label:'备注:',multiline:true">
						</div>
					</div>
					<div class="form-btnBar pl75">
						<input type="submit" name="" value="保存" class="easyui-linkbutton btnPrimary" onclick="submitForm()" style="width: 80px" />
						<input type="reset" name="" value="重置" class="easyui-linkbutton btnDefault" onclick="clearForm()" style="width: 80px" />
						<a href="javascript:;" class="closeForm">关闭表单</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
