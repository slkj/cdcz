<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>承德市出租汽车管理系统</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" language="javascript">
	var $grid;
	$(function() {
		$grid = $("#list_data");
		initGrid();

	});
	function initGrid() {
		$grid.datagrid({
			url : '../company/list',
			iconCls : 'icon-site',
			striped : true,
			nowrap : false,
			fit : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			pageSize : 50,
			pageList : [ 10, 20, 30, 40, 50, 100 ],
			columns : [ [ {
				field : 'compCode',
				title : '企业编号',
				width : 100
			}, {
				field : 'compName',
				title : '企业名称',
				width : 300
			}, {
				field : 'linkman',
				title : '联系人',
				width : 120
			}, {
				field : 'mobile',
				title : '联系电话',
				width : 120
			}, {
				field : 'email',
				title : 'Email',
				width : 120
			}, {
				field : 'qq',
				title : 'QQ',
				width : 120
			} ] ]
		});
	}
	function showAdd() {
		var url = getContextPath() + "/company/comAddPage";
		var dialog = createDialog({
			frameID : 'addComShow',
			title : '添加用户',
			width : 600,
			height : 400,
			url : url,
			toolbar : [ {
				text : common016,
				iconCls : 'icon-save',
				handler : function() {
					var data = parent.document.getElementById('addComShow').contentWindow.save();
					$.ajax({
						type : "post",
						dataType : "json",
						url : data.url,
						data : data.param,
						async : true,
						success : function(result) {
							if (result.success) {
								dialog.dialog("destroy");
								$grid.datagrid("reload");
							} else {
								showError(result.msg);
							}
						}
					})
				}
			}, '-', {
				text : common009,
				iconCls : 'icon-cancel',
				handler : function() {
					dialog.dialog("destroy");
				}
			} ]
		});
	}

	function editShow() {
		var rows = getSelectRows($grid);
		if (rows.length < 1) {
			return showError(common018);
		}
		var url = getContextPath() + "/company/comEditPage?pkey=" + rows[0].id;
		var dialog = createDialog({
			frameID : 'addComShow',
			title : '添加用户',
			width : 600,
			height : 400,
			url : url,
			toolbar : [ {
				text : common016,
				iconCls : 'icon-save',
				handler : function() {
					var data = parent.document.getElementById('addComShow').contentWindow.save();
					$.ajax({
						type : "post",
						dataType : "json",
						url : data.url,
						data : data.param,
						async : true,
						success : function(result) {
							if (result.success) {
								dialog.dialog("destroy");
								$grid.datagrid("reload");
							} else {
								showError(result.msg);
							}
						}
					})
				}
			}, '-', {
				text : common009,
				iconCls : 'icon-cancel',
				handler : function() {
					dialog.dialog("destroy");
				}
			} ]
		});
	}

	function query() {
		var data = serializeObject($('#searchForm'));
		$grid.datagrid('load', data);
	}
</script>
</head>
<body class="easyui-layout" data-options="border:false, fit:true">
	<div data-options="region:'center',border:true">
		<div class="btnbar-tools">
			<a href="javascript:;" class="add" onclick="showAdd()">
				<i class="fa fa-plus-square success"></i>
				添加
			</a>
			<a href="javascript:;" class="edit" onclick="editShow()">
				<i class="fa fa-pencil-square info"></i>
				编辑
			</a>
		</div>
		<table id="list_data"></table>
	</div>
</body>
</html>
