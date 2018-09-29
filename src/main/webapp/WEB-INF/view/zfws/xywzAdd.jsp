<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		self.location.href = "../zfws/ajwbPage";
	}
	var zfryData;
	$(function() {
		$.ajax({
			type : 'post',
			url : '../zfxx/zfryData',
			dataType : 'json',
			success : function(data) {
				zfryData = data;
				loadCombox();
			}
		})
		 loadzfyj() ;
	});
	function loadCombox() {
		$('#zfry1').combobox({
			// 		    url:'../zfxx/zfryData',
			data : zfryData,
			valueField : 'id',
			textField : 'zfxm',
			onSelect : function(data) {
				$("#zfzh1").textbox('setValue', data.zfzh);
			}
		});
		$('#zfry2').combobox({
			// 		    url:'../zfxx/zfryData',
			data : zfryData,
			valueField : 'id',
			textField : 'zfxm',
			onSelect : function(data) {
				$("#zfzh2").textbox('setValue', data.zfzh);
			}
		});
		$('#dcry1').combobox({
			// 		    url:'../zfxx/zfryData',
			data : zfryData,
			valueField : 'id',
			textField : 'zfxm',
			onSelect : function(data) {
				$("#dczh1").textbox('setValue', data.zfzh);
			}
		});
		$('#dcry2').combobox({
			// 		    url:'../zfxx/zfryData',
			data : zfryData,
			valueField : 'id',
			textField : 'zfxm',
			onSelect : function(data) {
				$("#dczh2").textbox('setValue', data.zfzh);
			}
		});
	}

	function loadzfyj() {

		$('#lyyj').combogrid({
			panelWidth:550,
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
				$("#layjTexr").html(rowData.zfyjt+rowData.zfyjk+rowData.zfyjx);
			}
		});
	}
</script>
</head>
<body class="easyui-layout" data-options="border:false" style="height: 100%">
	<div data-options="region:'north',border:false" style="height: 40px">
		<table>
			<tr>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-back',plain:true" onclick="back();">返回</a></td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',border:true">
		<form id="form" method="post" style="padding-left: 15px">
			<input name="id" type="hidden" />
			<div class="itemForm" style="width: 100%">
				<table style="width: 100%; height: 175px;" border="1" class="grid">
					<tr>
						<th width="120px">案件名称：</th>
						<td width="170px"><input type="text" class="easyui-textbox"></td>
						<th width="120px">姓名：</th>
						<td width="170px"><input type="text" class="easyui-textbox"></td>
						<th width="120px">性别：</th>
						<td width="170px"><input type="radio" name="sex">男<input type="radio" name="sex">女</td>
						<th width="120px">联系电话：</th>
						<td><input type="text" class="easyui-textbox"></td>
					</tr>
					<tr>
						<th>邮编：</th>
						<td><input type="text" class="easyui-textbox"></td>
						<th>身份证号：</th>
						<td><input type="text" class="easyui-textbox"></td>
						<th>职业：</th>
						<td><input type="text" class="easyui-textbox"></td>
						<th>与案件关系：</th>
						<td><input type="text" class="easyui-textbox"></td>
					</tr>
					<tr>
						<th>住址：</th>
						<td colspan="7"><input type="text" class="easyui-textbox" style="width: 100%;"></td>
					</tr>
					<tr>
						<th>执法人员1：</th>
						<td><input type="text" name="zfry1" id="zfry1"></td>
						<th>执法证号1：</th>
						<td><input type="text" name="zfzh1" id="zfzh1" class="easyui-textbox"></td>
						<th>执法人员2：</th>
						<td><input type="text" name="zfry2" id="zfry2"></td>
						<th>执法证号2：</th>
						<td><input type="text" name="zfzh2" id="zfzh2" class="easyui-textbox"></td>
					</tr>
					<tr>
						<th>督查人员1：</th>
						<td><input type="text" name="dcry1" id="dcry1"></td>
						<th>督查证号1：</th>
						<td><input type="text" name="dczh1" id="dczh1" class="easyui-textbox"></td>
						<th>督查人员2：</th>
						<td><input type="text" name="dcry2" id="dcry2"></td>
						<th>督查证号2：</th>
						<td><input type="text" name="dczh2" id="dczh2" class="easyui-textbox"></td>
					</tr>
					<tr>
						<th>立案依据：</th>
						<td colspan="3"><input type="text" id="lyyj" style="width: 100%;"></td>
						<td colspan="4"><span id="layjTexr" style="width: 100%;"></span></td>
					</tr>
					<!-- 						<tr> -->
					<!-- 							<th>立案依据条：</th> -->
					<!-- 							<td><input type="text" class="easyui-textbox"></td> -->
					<!-- 							<th>立案依据款：</th> -->
					<!-- 							<td><input type="text" class="easyui-textbox"></td> -->
					<!-- 							<th>立案依据项：</th> -->
					<!-- 							<td><input type="text" class="easyui-textbox"></td> -->
					<!-- 						</tr> -->
				</table>
				<div style="height: 10px"></div>
				<table style="width: 100%; height: 175px;" border="1" class="grid">
					<tr>
						<th width="120px">车牌号码：</th>
						<td width="170px"><input type="text" class="easyui-textbox" value="冀H"></td>
						<th width="120px">车辆颜色：</th>
						<td width="170px"><input type="text" class="easyui-textbox"></td>
						<th width="120px">车辆型号：</th>
						<td width="170px"><input type="text" class="easyui-textbox"></td>
						<th width="120px">乘客人数：</th>
						<td><input type="text" class="easyui-textbox"></td>
					</tr>
					<tr>
						<th>车费：</th>
						<td><input type="text" class="easyui-textbox"></td>
						<th>发生时间：</th>
						<td><input type="text" class="easyui-textbox"></td>
						<th>发生地点：</th>
						<td><input type="text" class="easyui-textbox"></td>
						<th>道路运输证号：</th>
						<td><input type="text" class="easyui-textbox"></td>
					</tr>
					<tr>
						<th>乘客起点地址：</th>
						<td colspan="3"><input type="text" class="easyui-textbox" style="width: 100%;"></td>
						<th>乘客目的地址：</th>
						<td colspan="3"><input type="text" class="easyui-textbox" style="width: 100%;"></td>
					</tr>
					<tr>
						<th>案由：</th>
						<td colspan="3"><select class="easyui-combobox" panelMaxHeight="130px" style="width: 100%;">
								<option>涉嫌擅自从事网络预约出租汽车经营活动</option>
								<option>涉嫌擅自从事巡游出租汽车经营活动</option>
								<option>涉嫌擅自从事与乘客进行议价</option>
								<option>涉嫌车容车貌不符要求</option>
						</select></td>
						<th>行政处罚：</th>
						<td colspan="3">责令改正并处罚款人民币 （<select class="easyui-combobox" panelMaxHeight="130px" style="width: 100px;">
								<option value="5000">5000</option>
								<option value="6000">6000</option>
								<option value="20000">20000</option>
								<option value="2000">2000</option>
						</select>）元整
						</td>
					</tr>
				</table>
				<div style="height: 10px"></div>
				<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="toAjwbPage();">生产文件</a>
			</div>
		</form>
	</div>
	<!-- 	<div data-options="region:'east',title:'East',split:true" -->
	<!-- 		style="width: 300px;"></div> -->
</body>
</html>
