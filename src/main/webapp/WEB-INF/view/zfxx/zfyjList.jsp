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
		//新增数据
		$('#newData').on('click', function() {
			layer.open({
				type : 1,
				skin : 'layui-layer-rim', //加上边框
				area : [ '490px', '400px' ], //宽高
				content : $('#newData-wrapper'),
				zIndex : 1000
			});
		});
	});
	function initGrid() {
		//datagrid初始化 
		$grid.datagrid({
			url : '../zfxx/zfyjList',
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
				field : 'zfyj',
				title : '执法依据'
			}, {
				field : 'zfyjt',
				title : '执法依据条'
			}, {
				field : 'zfyjk',
				title : '执法依据款'
			}, {
				field : 'zfyjx',
				title : '执法依据项'
			}, {
				field : 'jysm',
				title : '简要说明'
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
				$("#vui_sample").form("load", rows[0]);
				layer.open({
					type : 1,
					skin : 'layui-layer-rim', //加上边框
					area : [ '490px', '400px' ], //宽高
					content : $('#newData-wrapper'),
					zIndex : 1000
				});
			} else {
				showError(common018);
			}
		}
	}
	function submitForm() {
		var urlPlus = "";
		var validate = $("#vui_sample").form('validate');
		if (!validate) {
			return validate;
		}
		var yjid = $("#yjid").val();
		if (yjid != null) {
			urlPlus = getContextPath() + '/zfxx/zfyjUpdate';
		} else {
			urlPlus = getContextPath() + '/zfxx/zfyjSave';
		}
		var data = serializeObject($("#vui_sample"));
		$.ajax({
			type : "post",
			url : urlPlus,
			data : data,
			success : function(result) {
				clearForm();
				layer.closeAll();
				$grid.datagrid('reload');
			}
		})
	}
	function clearForm() {
		$('#vui_sample').form('clear');
	}
</script>
</head>
<body class="easyui-layout" data-options="border:false, fit:true">
	<div data-options="region:'center',border:true">
		<div class="btnbar-tools">
			<a href="javascript:;" class="add" id="newData"> <i class="fa fa-plus "></i> 添加
			</a> <a href="javascript:;" class="edit" onclick="edit()"> <i class="fa fa-pencil "></i> 编辑
			</a>
		</div>
		<table id=list_data data-options="fit:true,border:false"></table>
	</div>
	<!-- 新增和编辑数据 -->
	<div class="dig-wrapper" id="newData-wrapper">
		<div class="form1-column">
			<form id="vui_sample" class="easyui-form" method="post">
				<input id="yjid" name="id" type="hidden">
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="zfyj" style="width: 100%" data-options="label:'执法依据:',required:true">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="zfyjt" style="width: 100%" data-options="label:'执法依据条:',required:true">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="zfyjk" style="width: 100%" data-options="label:'执法依据款:',required:true">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="zfyjx" style="width: 100%" data-options="label:'执法依据项:',required:true">
					</div>
				</div>
				<div class="form-column1">
					<div class="form-column-left">
						<input class="easyui-textbox" name="jysm" style="width: 100%; height: 60px" data-options="label:'简要说明:',multiline:true">
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
