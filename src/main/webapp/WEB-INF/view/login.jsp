<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>承德市出租汽车管理系统</title>
<link type="text/css" rel="stylesheet" href="assets/default/login/css/login.css">
<script type="text/javascript" src="assets/js/jquery2.1.1.js"></script>
<script type="text/javascript">
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
	function keyLogin(event) {
		//回车键的键值为13
		if (event.keyCode == 13) {
			submit(); //调用登录按钮的登录事件
		}
	}
	//处理记住用户名
	function changeCheckRembername() {
		var rembername = document.getElementById("rembername").value;
		if (rembername == 'true') {//选中，置为不选中
			document.getElementById("rembername").value = 'false';
			$('#checked').attr("class", "normal");
		} else {
			document.getElementById("rembername").value = 'true';
			$('#checked').attr("class", "checked");
		}
	}

	function submit() {
		var userName = $("#username").val();
		var password = $("#password").val();
		if (userName == "") {
			alert("用户名不能为空");
			$("#userName").focus()
			return false;
		}
		if (password == "") {
			alert("密码不能为空");
			$("#password").focus()
			return false;
		}

		var data = {
			username : userName,
			password : password
		}
		$.ajax({
			type : "post",
			dataType : "json",
			url : "user/login",
			data : data,
			async : true,
			success : function(result) {
				if (result.success) {
					window.location.href = "index";
				} else {
					alert(result.msg);
				}
			}
		})
	}
</script>
</head>
<body>
	<!--头部start-->
	<div class="login-header">
		<div id="login-header-nav" class="nobogder">
			<div id="login-header-nav_ctx"></div>
		</div>
	</div>
	<!--头部end-->
	<!-- 	<form id="loginForm" name="loginForm" class="fm-v clearfix" method="post"> -->
	<input type="hidden" name="lt">
	<input type="hidden" name="execution" value="e1s1">
	<input type="hidden" name="_eventId" value="submit">
	<input type="hidden" name="userType" value="0">
	<input id="rembername" name="rembername" type="hidden" class="fr" data-cacheval="false" value="false">
	<!--登录start-->
	<div class="ordinaryLogin">
		<div class="login_ad">
			<div class="bg_ordLogin">
				<img src="assets/default/login/images/timg.png" />
			</div>
			<div class="loginCont_dk post05" style="right: -17px;">
				<div class="loginCont">
					<div class="login_th">
						<h4 class="lgCurr bd_r">用户登录</h4>
					</div>
					<div class="login_text">
						<!-- error start -->
						<div class="login-error">
							<label id="EEE" class="login_error_tips" style="display: none;"></label>
						</div>
						<!-- end -->
						<div class="user_parent">
							<div class="login_input user_bg unm">
								<input name="username" id="username" tabindex="1" type="text" class="usernameSty" value="admin" />
							</div>
						</div>

						<div class="user_paswd">
							<div class="login_input user_bg pwd">
								<div id="newPwd" class="keyboards-box">
									<input id="password" type="password" name="password" value="000000" class="styTextinput w162px" maxlength="20">
								</div>
							</div>
						</div>

						<div class="user_code">
							<div class="login_input user_bg vnc">
								<input name="verification" id="verification" type="text" class="usernameSty" autocomplete="off">
								<div id="v_container" class="codeimg"></div>
							</div>
						</div>

						<div style="height: 10px"></div>
						<div class="remeber_name">
							<b id="checked" class="normal" onclick="changeCheckRembername();"></b>
							<label id="login_save" style="float: left;">记住用户名</label>
							<div class="login-wjpw">
								<!-- 									<a class="blue" href="javascript:;">忘记用户名？</a> -->
								<!-- 									&nbsp;|&nbsp;&nbsp; -->
								<!-- 									<a href="javascript:;"> -->
								<!-- 										<span class="blue">忘记密码？</span> -->
								<!-- 									</a> -->
							</div>
						</div>
					</div>
					<div class="login_ck">
						<input name="submitBtn" id="submitBtn" type="submit" tabindex="5" class="login_btn" value="登录" onclick="submit()">
					</div>
					<div style="height: 24px"></div>
				</div>
			</div>
			<div class="filter box_shadow"></div>
			<!--用户名密码出错弹出层start-->
			<div class="login_error_w" style="top: 152px;">
				<div class="login_error">
					<div class="login_error_th">
						<h4>用户名或密码错误</h4>
					</div>
				</div>
			</div>
			<!--用户名密码出错弹出层end-->
			<!--验证码出错弹出层start-->
			<div class="login_error_w" style="top: 232px;">
				<div class="login_error">
					<div class="login_error_th">
						<h4>验证码错误</h4>
					</div>
				</div>
			</div>
			<!--验证码出错弹出层end-->
		</div>
	</div>
	<!--登录end-->
	<!-- 	</form> -->
	<!--底部start-->
	<div style="clear: both"></div>
	<div class="footBorder_t01">
		<div class="ce_about_foot">
			<p class="ce_about_copyright">
				<a href="javascript:;">承德市运输管理局</a>
				<span class="">|</span>
				<a href="javascript:;">联系邮箱：sssssss@163.com</a>
			</p>
		</div>
	</div>
	<!--底部end-->
</body>
</html>