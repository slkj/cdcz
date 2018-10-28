<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>承德市出租汽车管理系统</title>
<%@ include file="/common/taglibs.jsp"%>
<script>
	var $grid;
	
	$(function() {
		$grid = $("#list_data");
		initGrid();

	});
	function initGrid() {
		//datagrid初始化 
		$grid
				.datagrid({
					url : '../vehicle/list',
					iconCls : 'icon-site',
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
					frozenColumns : [ [
// 							
							{
								width : 150,
								field : 'fileNum',
								title : '档案号'
							}, {
								width : 150,
								field : 'plateNum',
								title : '车牌号'
							}, {
								width : 150,
								field : 'ownerName',
								title : '车主'
							}, {
								width : 150,
								field : 'opretaCertNum',
								title : '营运证号'
							}, {
								width : 150,
								field : 'corpName',
								title : '公司名称'
							} , {
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
							s += "<a href=\"javascript:void(0)\" onclick=\"javaScript:deleteRow('" + row.id + "');\"><i class=\"fa fa-times-rectangle danger\"></i>删除 </a>";
							if (row.parent_id == "0") {
								return "";
							}
							return s;
						}
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

	
	
	function editRow(id) {		
				self.location.href = getContextPath()
						+ "/vehicle/vehicleFormPage?pkey=" + id;
	}
	function showRow(id) {
				self.location.href = getContextPath()
						+ "/vehicle/vehicleFormPage?mode=V&pkey=" + id;
	}
	function add() {
		self.location.href = getContextPath() + "/vehicle/vehicleFormPage";
	}

	function showCarPhoto() {
		var url = getContextPath() + "/vehicle/vehicleFormPage";
		dialogForShowImage(url);
	}
	function dialogForShowImage(url) {
		var dialog = createDialog({
			frameID : 'addCarShow',
			title : '车辆信息',
			width : 900,
			height : 600,
			url : url,
			toolbar : [ {
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
				PlateNum : $('#PlateNum').val(),
				OpretaCertNum : $('#OpretaCertNum').val(),
				OrigOwnerName : $('#OrigOwnerName').val()
			}
		});

	}

</script>
</head>
<body class="easyui-layout" data-options="border:false, fit:true">
	<div data-options="region:'north',split:false" style="height: 90px">
		<div class="comp-search-box">
			<div class="screen-top">
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="PlateNum" data-options="label:'车牌号'" />
				</div>
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="OpretaCertNum" data-options="label:'营运证号'" />
				</div>
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="OrigOwnerName" data-options="label:'车主姓名'" />
				</div>
				<div class="colRow">
					<button class="easyui-linkbutton btnDefault" onclick="query()">
						<i class="fa fa-search"></i> 查询
					</button>
				</div>
			</div>
		</div>
		<div class="btnbar-tools">
			<a href="javascript:;" class="add" onclick="add()"> <i class="fa fa-plus-square success "></i> 添加
			</a> 
		</div>
	</div>
	<div data-options="region:'center',border:true">
		<table id=list_data data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
