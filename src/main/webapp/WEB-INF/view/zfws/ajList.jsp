<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		$grid.datagrid({
			url : '../zfws/list',
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
				field : 'ajbh',
				title : '案件编号'
			}, {
				field : 'ajmc',
				title : '案件名称'
			}, {
				field : 'grxm',
				title : '个人姓名'
			}, {
				field : 'jlr',
				title : '记录人'
			}, {
				field : 'ay',
				title : '案由'
			}, {
				field : 'driver2',
				title : '发生时间'
			}, {
				field : 'driver1Tel',
				title : '处理时间'
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
		$grid.datagrid({
			queryParams : {
				carPlateNo : $('#carPlateNo').val(),
				transportNo : $('#transportNo').val(),
				carOwner : $('#carOwner').val()
			}
		});

	}
</script>
</head>
<body class="easyui-layout" data-options="border:false, fit:true">
	<div data-options="region:'center',border:true">
		<div class="comp-search-box">
			<div class="screen-top">
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="carPlateNo"
						data-options="label:'案件名称'" />
				</div>
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="transportNo"
						data-options="label:'个人姓名'" />
				</div>
				<div class="colRow">
					<input type="text" class="easyui-textbox" id="carOwner"
						data-options="label:'案由'" />
				</div>
				<div class="colRow">
					<button class="easyui-linkbutton btnDefault" onclick="query()">
						<i class="fa fa-search"></i> 查询
					</button>
				</div>
			</div>
		</div>
		<div class="btnbar-tools">
			<a href="javascript:;" class="add" onclick="view()"> <i
				class="fa fa-search "></i> 查看
			</a> <a href="javascript:;" class="edit" onclick="edit()"> <i
				class="fa fa-pencil "></i> 编辑
			</a>
		</div>
		<table id=list_data data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
