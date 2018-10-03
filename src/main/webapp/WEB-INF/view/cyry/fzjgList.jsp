<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发证机关</title>
<%@ include file="/common/taglibs.jsp"%>
<script>
	var $grid;
	var curUserComCode;
	$(function() {
		$grid = $("#list_data");
		initGrid();
		//新增数据
		$('#newData').on('click', function() {
			layer.open({
				type : 1,
				skin : 'layui-layer-rim', //加上边框
				area : [ '490px', '250px' ], //宽高
				content : $('#newData-wrapper'),
				zIndex : 1000
			});
		});
	});
	function initGrid() {
		//datagrid初始化 
		$grid.datagrid({
			url : '../cyry/cyryNewList',
			striped : true,
			nowrap : false,
			fit : true,
			rownumbers : true,
			loadMsg : '正在加载中，请稍等... ',
			emptyMsg : '<span>无记录</span>',
			pagination : true,
			singleSelect : true,
			fitColumns : true,
			idField : 'pkey',
			pageSize : 50,
			pageList : [ 10, 20, 30, 40, 50, 100 ],
			columns : [ [ {
				field : 'cyxm',
				title : '姓名'
			}, {
				field : 'cyxb',
				title : '性别',
				align:'center',
				formatter : function(value, row, index) {
					if (value == 1) {
						return "男";
					} else if (value == 2) {
						return "女";
					} else {
						return "无";
					}
				}
			}, {
				field : 'sfzh',
				title : '身份证号码'
			}, {
				field : 'cyzgzh',
				title : '从业资格证号'
			},{
				field : 'ssgs',
				title : '所属公司'
			},{
				field : 'zccl',
				title : '注册车辆'
			}, {
				field : 'chexing',
				title : '车型'
			}, {
				field : 'zhuangtai',
				title : '状态'
			} ] ],
			onLoadSuccess : function(data) {
				if (data && data.rows && data.rows.length > 0) {
					$grid.datagrid("clearSelections");
				} else {
					$grid.datagrid("clearSelections");
				}
			}

		});
	}
	function edit() {
		var rows = getSelectRows($grid);
		if (rows) {
			if (rows.length == 1) {
				layer.open({
					type : 1,
					skin : 'layui-layer-rim', //加上边框
					area : [ '490px', '250px' ], //宽高
					content : $('#newData-wrapper'),
					zIndex : 1000
				});
			} else {
				showError(common018);
			}
		}
	}
</script>
</head>
<body class="easyui-layout" data-options="border:false, fit:true">
	<div data-options="region:'north',split:false" style="height: 40px">
		<div class="btnbar-tools">
			<a href="javascript:;" class="add" id="newData"> <i class="fa fa-plus "></i> 添加
			</a> <a href="javascript:;" class="edit" onclick="edit()"> <i class="fa fa-pencil "></i> 编辑
			</a>
		</div>
	</div>
	<div data-options="region:'center',border:true">

		<table id=list_data data-options="fit:true,border:false"></table>
	</div>
	<!-- 新增和编辑数据 -->
	<div class="dig-wrapper" id="newData-wrapper">
		<div class="form1-column">
			<form id="vui_sample" class="easyui-form" method="post">
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="name" style="width: 100%" data-options="label:'姓名:',required:true">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="wznumber" style="width: 100%" data-options="label:'执法证号:',required:true">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="sqkf" style="width: 100%" data-options="label:'职务:',required:true">
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
