<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>承德市出租汽车管理系统</title>
<%@ include file="/common/taglibs.jsp"%>
<style type="text/css">
.grid {
	width: 100%;
	border-collapse: collapse;
	font: 12px arial, helvetica, sans-serif;
	border: 1px solid #8DB2E3
}

.grid td {
	height: 20px;
	padding: 2px;
	border: 1px solid #8DB2E3;
	padding-left: 10px
}

.grid th {;
	height: 20px;
	padding: 2px;
	border: 1px solid #8DB2E3;
	background: #E7F3FE;
	text-align: center;
}
</style>
<script type="text/javascript">
	function toAjwbPage() {
		self.location.href = "zfws/ajwbPage";
	}
</script>
</head>
<body class="easyui-layout" data-options="border:false"
	style="height: 100%">
	<div data-options="region:'north',border:false" style="height: 40px">
		<table>
			<tr>
				<td><a href="javascript:void(0);" class="easyui-linkbutton"
					style="margin: 5 0 0 5"
					data-options="iconCls:'icon-back',plain:true" onclick="back();">返回</a>
				</td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',border:true">
		<form id="form" method="post" style="padding-left: 15px">
			<input name="id" type="hidden" />
			<div class="itemForm" style="width: 100%">

				<div style="height: 200px">
					<div class='item col4'>
						<label class="labelWidth2"> <span style="color: red">*</span>
							受案时间
						</label> <input type="text" name="pkey" class="easyui-datebox"
							data-options="required:true" style="width: 200px" />
					</div>
					<div class='item col4'>
						<label class="labelWidth2"> <span style="color: red">*</span>
							交款银行
						</label> <input type="text" name="carPlateNo" class="easyui-textbox"
							style="width: 200px" value="中国农业银行双桥支行" />
					</div>
					<div class='item col4'>
						<label class="labelWidth2"> <span style="color: red">*</span>
							复议单位
						</label> <input class="easyui-textbox" type="text" name="transportNo"
							style="width: 200px" value="河北省交通运输厅">
					</div>
					<div class='item col4'>
						<label class="labelWidth2"> <span style="color: red">*</span>
							诉讼单位
						</label> <input class="easyui-textbox" type="text" name="transportNo"
							style="width: 200px" value="河北省承德市双桥区"></input>
					</div>
					<div class='item col4'>
						<label class="labelWidth2">询问开始时间：</label> <input
							class="easyui-datebox" type="text" name="vehicleModel"
							style="width: 200px">
					</div>
					<div class='item col4'>
						<label class="labelWidth2">询问结束时间：</label> <input
							class="easyui-datebox" type="text" name="vehicleModel"
							style="width: 200px"></input>
					</div>
					<div class='item col4'>
						<label class="labelWidth2">询问地点：</label> <select
							class="easyui-textbox" type="text" name="hgzDataSource"
							style="width: 200px"></select>
					</div>
					<div class='item col4'>
						<label class="labelWidth2">执法主体</label> <input
							class="easyui-textbox" type="text" name="vin2" id="vin2"
							style="width: 200px" value="承德市交通运输局"></input>
					</div>
					<div class='item col4'>
						<label class="labelWidth2">案件基本情况文本</label> <input
							class="easyui-textbox" type="text" name="engineNo"
							style="width: 200px"></input>
					</div>
					<div class='item col4'>
						<label class="labelWidth2">违法行为文本(《违法行为通知书》)</label> <input
							class="easyui-textbox" type="text" name="engineNo"
							style="width: 200px"></input>
					</div>
					<div class='item col4'>
						<label class="labelWidth2">讨论记录文本(《集体讨论记录》)</label> <input
							class="easyui-textbox" type="text" name="engineNo"
							style="width: 200px"></input>
					</div>
					<div class='item col4'>
						<label class="labelWidth2">结论性意见文本(《集体讨论记录》)</label> <input
							class="easyui-textbox" type="text" name="engineNo"
							style="width: 200px"></input>
					</div>
					<div class='item col4'>
						<label class="labelWidth2">调查结论和处理意见文本(《调查报告》)</label> <input
							class="easyui-textbox" type="text" name="engineNo"
							style="width: 200px"></input>
					</div>
				</div>
			</div>
		</form>
	</div>

	<div>
		<a href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-save',plain:true" onclick="toAjwbPage();">结案封档</a>
	</div>
</body>
</html>
