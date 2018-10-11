<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>案件-案由</title>
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
		loadzfyj();
		//性别初始化
		$('#sex').combo({
		    required:true,
		    editable:false,
		    panelHeight:50
		});
		$('#sex_opt').appendTo($('#sex').combo('panel'));
		$('#sex_opt input').click(function(){
		    var v = $(this).val();
		    var s = $(this).next('span').text();
		    $('#sex').combo('setValue', v).combo('setText', s).combo('hidePanel');
		});
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
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="language" label="案件名称:" style="width: 100%;" />
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="name" style="width: 100%" data-options="label:'姓名:'">
					</div>
					<div class="form-column-left fm-left">
						<label class="textbox-label textbox-label-before" style="text-align: left; height: 30px; line-height: 30px;">性别:</label>
<!-- 						<input class="easyui-textbox" name="name" style="width: 100%" data-options="label:'性别:'"> -->
						<select id="sex" name="sex" ></select>
						<div id="sex_opt">
							<div style="text-align: center;margin-top: 10px">
								<input type="radio" name="rsex" value="男"><span>男</span>
								<input type="radio" name="rsex" value="女"><span>女</span>
							</div>
						</div>
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'联系电话:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'邮编:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'身份证号:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'邮编:'">
					</div>
				</div>
				<div class="form-column2">
					<div class="form-column-left">
						<input class="easyui-textbox" name="email" style="width: 100%" data-options="label:'职业:'">
					</div>
					<div class="form-column-left fm-left">
						<input class="easyui-textbox" name="subject" style="width: 100%" data-options="label:'与案件关系:'">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="message" style="width: 100%;" data-options="label:'住址:'">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-combobox" id="lyyj" name="message" style="width: 100%;" data-options="label:'立案依据:'">
					</div>
				</div>
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
<!-- 						<input class="easyui-combobox" id="lyyj" name="message" style="width: 100%;" data-options="label:'案由:'"> -->
						<select class="easyui-combobox" panelMaxHeight="130px" style="width: 100%;" data-options="label:'案由:'">
								<option>涉嫌擅自从事网络预约出租汽车经营活动</option>
								<option>涉嫌擅自从事巡游出租汽车经营活动</option>
								<option>涉嫌擅自从事与乘客进行议价</option>
								<option>涉嫌车容车貌不符要求</option>
						</select>
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="message" style="width: 100%;" data-options="label:'行政处罚:'">
					</div>
				</div>
				<div class="form-btnBar pl75">
					<input type="submit" name="" value="下一步，案件文本" class="easyui-linkbutton btnPrimary" onclick="toAjwbPage()" style="width: 180px" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
