<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>承德市出租汽车管理系统</title>
<%@ include file="/common/taglibs.jsp"%>
<script>
	var $grid;
	var curUserComCode;
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
// 							{
// 								width : 80,
// 								align : 'center',
// 								field : '_pkey',
// 								title : '定位',
// 								formatter : function(value, row, index) {
// 									return '<a href="javascript:void(0);" '
// 											+ 'style="color:#0070a9" class="easyui-linkbutton" '
// 											+ 'data-options="iconCls:\'icon-search\',plain:true" onclick="showGpsMap('
// 											+ index + ');">查看位置</a>';
// 								}
// 							},
							{
								width : 80,
								field : 'transportNo',
								title : '营运证号'
							}, {
								width : 80,
								field : 'carPlateNo',
								title : '车牌号'
							}, {
								field : 'carType2',
								title : '燃料类型'
							}, {
								width : 50,
								field : 'carColor',
								title : '颜色'
							}, {
								width : 100,
								field : 'carBrandText',
								title : '车辆品牌'
							}, {
								width : 180,
								field : 'customerName',
								title : '公司名称'
							}, {
								width : 80,
								field : 'carOwner',
								title : '车主'
							}, {
								width : 100,
								field : 'carOwnerTel',
								title : '联系电话'
							} ] ],
					columns : [ [ {
						field : 'driver2',
						title : '身份证号'
					}, {
						width : 80,
						field : 'driver1Tel',
						title : '原车号'
					}, {
						width : 80,
						field : 'driver1',
						title : '原车主'
					} ] ],
					// 					toolbar : [ {
					// 						iconCls : 'icon-search',
					// 						text : '查看',
					// 						handler : function() {
					// 							view();
					// 						}
					// 					}, {
					// 						iconCls : 'icon-add',
					// 						text : '添加',
					// 						handler : function() {
					// 							add();
					// 						}
					// 					}, '-', {
					// 						iconCls : 'icon-edit',
					// 						text : '编辑',
					// 						handler : function() {
					// 							edit();
					// 						}
					// 					}, '-', {
					// 						iconCls : 'icon-print',
					// 						text : '导出',
					// 						handler : function() {
					// 							exportData();
					// 						}
					// 					} ],
					onLoadSuccess : function(data) {
						if (data && data.rows && data.rows.length > 0) {
							$grid.datagrid("clearSelections");
						} else {
							$grid.datagrid("clearSelections");
						}
					}

				});
	}

	function showGpsMap(index) {
		var rows = getSelectRows($grid);
		// 		window.open("http://hbslkj.com:89/Interface/findPosition.action?carNum=冀H88002"+rows[0].carPlateNo);      
		window
				.open("http://hbslkj.com:89/Interface/findPosition.action?carNum=冀H88002");
	}
	function queryBtnClick() {
		var data = serializeObject($('#searchForm'));
		$grid.datagrid('load', data);
	};

	function edit() {
		var rows = getSelectRows($grid);
		if (rows) {
			if (rows.length == 1) {
				self.location.href = getContextPath()
						+ "/vehicle/vehicleFormPage?pkey=" + rows[0].id;
			} else {
				showError(common018);
			}
		}
	}
	function view() {
		var rows = getSelectRows($grid);
		if (rows) {
			if (rows.length == 1) {
				self.location.href = getContextPath()
						+ "/vehicle/vehicleFormPage?mode=V&pkey=" + rows[0].id;
			} else {
				showError(common018);
			}
		}
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
		// 		var data = serializeObject($('#searchForm'));
		// 		$grid.datagrid('load', data);
		//$('#searchForm').form('reset')
		$grid.datagrid({
			queryParams : {
				carPlateNo : $('#carPlateNo').val(),
				transportNo : $('#transportNo').val(),
				carOwner : $('#carOwner').val()
			}
		});

	}
	// 导出excel
	function exportData() {
		// 获取条件
		var param = serializeObject($('#searchForm'));
		window.location.href = encodeURI("../vehicle/exporsb?" + param);
	}
</script>
</head>
<body class="easyui-layout" data-options="border:false, fit:true">
	<div data-options="region:'north',split:false" style="height: 90px">
		<div class="comp-search-box">
			<div class="screen-top">
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="carPlateNo" data-options="label:'车牌号'" />
				</div>
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="transportNo" data-options="label:'营运证号'" />
				</div>
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="carOwner" data-options="label:'车主姓名'" />
				</div>
				<div class="colRow">
					<button class="easyui-linkbutton btnDefault" onclick="query()">
						<i class="fa fa-search"></i> 查询
					</button>
				</div>
			</div>
		</div>
		<div class="btnbar-tools">
			<a href="javascript:;" class="add" onclick="view()"> <i class="fa fa-search "></i> 查看
			</a> <a href="javascript:;" class="add" onclick="add()"> <i class="fa fa-plus "></i> 添加
			</a> <a href="javascript:;" class="edit" onclick="edit()"> <i class="fa fa-pencil "></i> 编辑
			</a>
			<!-- 			<a href="javascript:;" class="del"> <i class="fa fa-times-rectangle danger"></i> 删除</a>  -->
			<!-- 			<a href="javascript:;" class="count"> <i class="fa fa-pie-chart purple"></i> 统计</a>  -->
			<a href="javascript:;" class="check" onclick="exportData()"> <i class="fa fa-print"></i> 导出
			</a>
		</div>
	</div>
	<div data-options="region:'center',border:true">
		<table id=list_data data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
