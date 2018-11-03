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
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100 ],
			columns : [ [ {
				width : 250,
				field : 'unitname',
				title : '企业名称'
			}, {
				width : 150,
				field : 'phone',
				title : '联系电话'
			}, {
				width : 150,
				field : 'businessno',
				title : '经营许可证号'
			}, {
				width : 150,
				field : 'enterprisecode',
				title : '企业代码'
			}, {
				width : 150,
				field : 'legalrepresentative',
				title : '法人代表'
			}, {
				field : 'opt',
				title : '操作',
				width : 150,
				align : 'center',
				formatter : function(value, row) {
					var s = "";
					s += "<a href=\"javascript:void(0)\" onclick=\"showRow('" + row.id + "');\"><i class=\"fa fa-search \"></i>查看</a>";
					s += "|";
					s += "<a href=\"javascript:void(0)\" onclick=\"editRow('" + row.id + "');\"><i class=\"fa fa-pencil \"></i>编辑</a>";
					s += "|";
					s += "<a href=\"javascript:void(0)\" onclick=\"javaScript:deleteRow();\"> <i class=\"fa fa-times-rectangle danger\"></i>删除 </a>";
					if (row.parent_id == "0") {
						return "";
					}
					return s;
				}
			}  ] ]
		});
	}
	function showAdd() {
		var url = getContextPath() + "/company/comAddPage";
		var dialog = createDialog({
			frameID : 'addComShow',
			title : '添加企业信息',
			width : 600,
			height : 600,
			url : url,
			toolbar : [
					{
						text : common016,
						iconCls : 'icon-save',
						handler : function() {
							var data = parent.document
									.getElementById('addComShow').contentWindow
									.save();
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

	function editRow(id) {		
		var url = getContextPath() + "/company/comAddPage?pkey=" + id;
		var dialog = createDialog({
			frameID : 'editComShow',
			title : '编辑企业信息',
			width : 600,
			height : 600,
			url : url,
			toolbar : [
					{
						text : common016,
						iconCls : 'icon-save',
						handler : function() {
							var data = parent.document
									.getElementById('editComShow').contentWindow
									.save();
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
	function showRow(id) {		
		var url = getContextPath() + "/company/comAddPage?pkey=" + id;
		var dialog = createDialog({
			frameID : 'ComShow',
			title : '查看企业信息',
			width : 600,
			height : 600,
			url : url,
			toolbar : [
				 {
						text : common009,
						iconCls : 'icon-cancel',
						handler : function() {
							dialog.dialog("destroy");
						}
					} ]
		});
	}
function query() {
		
		$grid.datagrid({
			queryParams : {
				unitname : $('#unitname').val(),
				businessno : $('#businessno').val(),
				legalrepresentative : $('#legalrepresentative').val()
			}
		});

	}
</script>
</head>
<body class="easyui-layout" data-options="border:false, fit:true">
	<div data-options="region:'north',split:false"  style="height: 90px">
	
	<div class="comp-search-box">
			<div class="screen-top">
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="unitname" data-options="label:'单位名称'" />
				</div>
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="businessno" data-options="label:'经营许可证号'" />
				</div>
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="legalrepresentative" data-options="label:'法人代表'" />
				</div>
				<div class="colRow">
					<button class="easyui-linkbutton btnDefault" onclick="query()">
						<i class="fa fa-search"></i> 查询
					</button>
				</div>
			</div>
		</div>
		
		<div class="btnbar-tools">
			<a href="javascript:;" class="add" onclick="showAdd()"> <i class="fa fa-plus-square success"></i> 添加
			</a> <!-- <a href="javascript:;" class="edit" onclick="editShow()"> <i class="fa fa-pencil-square info"></i> 编辑
			</a> -->
		</div>
	</div>
	<div data-options="region:'center',border:true">
		<table id="list_data"></table>
	</div>
</body>
</html>
