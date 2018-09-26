
var _menus_oneLeve=[{"menuid":"0","menuname":"车辆档案","icon":"fa-home"},{"menuid":"1","menuname":"从业人员","icon":"fa-trophy"},{"menuid":"2","menuname":"处罚文书","icon":"fa-inbox"},{"menuid":"3","menuname":"统计报表","icon":"fa-suitcase"},{"menuid":"4","menuname":"系统管理","icon":"fa-dropbox"}];
var _menus=[
    {"menuid":"00","icon":"fa-trophy","menuname":"车辆管理",parentMenu:'0',
        "menus":[{"menuid":"000","menuname":"车辆档案","icon":"fa-dashboard","url":"vehicle/vehicleListPage"},
                {"menuid":"001","menuname":"企业档案","icon":"fa-delicious","url":"company/comListPage"}
            ]},{
     "menuid":"01","icon":"fa-television","menuname":"从业人员",parentMenu:'1',
        "menus":[{"menuid":"010","menuname":"新报名人员","icon":"fa-tty","url":"https://item.taobao.com/item.htm?id=545823027227"},
                {"menuid":"011","menuname":"延续注册信息","icon":"fa-volume-up","url":""},
            	{"menuid":"110","menuname":"扫码延续注册","icon":"fa-window-restore","url":"demo/form-success-popup1.html"},
                {"menuid":"111","menuname":"注销审核","icon":"fa-window-restore","url":"demo/form-success-popup2.html"},
                {"menuid":"112","menuname":"扫码注销","icon":"fa-window-maximize","url":"demo/form-success1.html"},
                {"menuid":"113","menuname":"审核补办从业证","icon":"fa-window-maximize","url":"demo/form-success2.html"},
                {"menuid":"114","menuname":"变更公司审核","icon":"fa-align-center","url":"demo/form1.html"},
                {"menuid":"115","menuname":"报废注销审核","icon":"fa-align-center","url":"demo/form2.html"},
                {"menuid":"116","menuname":"扫码换证","icon":"fa-columns","url":"demo/form2-column.html"},
                {"menuid":"117","menuname":"换证信息","icon":"fa-columns","url":"demo/form2-column2.html"},
                {"menuid":"118","menuname":"扫码评级","icon":"fa-columns","url":"demo/form2-column2.html"},
                {"menuid":"119","menuname":"通过考试人员","icon":"fa-columns","url":"demo/form2-column2.html"},
                {"menuid":"120","menuname":"未通过考试人员","icon":"fa-globe","url":"https://item.taobao.com/item.htm?id=545823027227"},
                {"menuid":"121","menuname":"总台账","icon":"fa-laptop","url":"http://www.uimaker.com/member/index.php?uid=poya"},
                {"menuid":"122","menuname":"死亡库","icon":"fa-laptop","url":"http://www.uedna.com/user/33963/"},
                {"menuid":"122","menuname":"超龄库","icon":"fa-laptop","url":"http://www.zcool.com.cn/u/16062070"},
                {"menuid":"120","menuname":"发证机关","icon":"fa-globe","url":"https://item.taobao.com/item.htm?id=545823027227"},
                {"menuid":"121","menuname":"注册审核","icon":"fa-laptop","url":"http://www.uimaker.com/member/index.php?uid=poya"},
                {"menuid":"122","menuname":"扫描注册","icon":"fa-laptop","url":"http://www.zcool.com.cn/u/16062070"}
            ]
    },
	{"menuid":"21","icon":"fa-plug","menuname":"处罚文书",parentMenu:'2',
		"menus":[
            {"menuid":"210","menuname":"巡游无证案件","icon":"fa-toggle-down","url":"demo/msgTip.html"},
            {"menuid":"211","menuname":"网约无证案件","icon":"fa-puzzle-piece","url":"demo/msgTip.html"},
            {"menuid":"212","menuname":"议价有证案件","icon":"fa-desktop","url":"demo/msgTip.html"},
            {"menuid":"213","menuname":"车容车貌有证案件","icon":"fa-window-restore","url":"demo/msgTip.html"},
            {"menuid":"214","menuname":"通用案件","icon":"fa-calendar","url":"demo/msgTip.html"},
            {"menuid":"215","menuname":"查询案件","icon":"fa-chevron-circle-down","url":"demo/msgTip.html"}
		]
	},
	{"menuid":"22","icon":"fa-cubes","menuname":"信息管理",parentMenu:'2',
		"menus":[{"menuid":"220","menuname":"案由信息管理","icon":"fa-dot-circle-o","url":"demo/inonSvg.html"},
			{"menuid":"221","menuname":"处罚金额管理","icon":"fa-sticky-note","url":"demo/msgTip.html"},
            {"menuid":"222","menuname":"基本信息管理","icon":"fa-window-minimize","url":"demo/msgTip.html"},
            {"menuid":"223","menuname":"执法人员管理","icon":"fa-sort-numeric-asc","url":"demo/msgTip.html"},
            {"menuid":"224","menuname":"执法依据信息管理","icon":"fa-bookmark","url":"demo/msgTip.html"}
		]
	},
    {"menuid":"31","icon":"fa-suitcase","menuname":"车辆统计报表",parentMenu:'3',
    	"menus":[{"menuid":"311","menuname":"车辆基本情况","icon":"fa-inbox","url":"demo/msgTip.html"},
    			{"menuid":"312","menuname":"各公司分布情况","icon":"fa-share-alt-square","url":"demo/msgTip.html"},
    			{"menuid":"312","menuname":"车辆分布情况","icon":"fa-share-alt-square","url":"demo/msgTip.html"},
    			{"menuid":"312","menuname":"路线分布情况","icon":"fa-share-alt-square","url":"demo/msgTip.html"},
    			{"menuid":"312","menuname":"车型公司统计","icon":"fa-share-alt-square","url":"demo/msgTip.html"}
    		]
    	},
	{"menuid":"41","icon":"fa-dashboard","menuname":"系统管理",parentMenu:'4',
		"menus":[
			{"menuid":"411","menuname":"菜单管理","icon":"fa-id-card","url":"module/menusPage"},
			{"menuid":"412","menuname":"用户管理","icon":"fa-users","url":"user/userListPage"},
			{"menuid":"413","menuname":"角色管理","icon":"fa-address-card","url":"role/rolePage"}
		]
	}
		
];

    //设置登录窗口
    function openPwd() {$('#updatePwd').window({title: '修改密码', width: 300, modal: true, shadow: true, closed: true, height: 160, resizable:false }); }
    //关闭登录窗口
    function closePwd() {$('#updatePwd').window('close');}

    //修改密码
    function serverLogin() {
        var $newpass = $('#txtNewPass');
        var $rePass = $('#txtRePass');

        if ($newpass.val() == '') {
            msgShow('系统提示', '请输入密码！', 'admin');
            return false;
        }
        if ($rePass.val() == '') {
            msgShow('系统提示', '请在一次输入密码！', 'admin');
            return false;
        }

        if ($newpass.val() != $rePass.val()) {
            msgShow('系统提示', '两次密码不一至！请重新输入', 'admin');
            return false;
        }

        $.post('/ajax=' + $newpass.val(), function(msg) {
            msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
            $newpass.val('');
            $rePass.val('');
            close();
        })
        
    }

    $(function() {
        openPwd();

        $('#editpass').click(function(){$('#updatePwd').window('open');});

        $('#btnEp').click(function(){serverLogin();});

		$('#btnCancel').click(function(){closePwd();});

        $('#loginOut').click(function() {
            $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                if (r) {
                    location.href = 'login.html';
                }
            });
        })
    });

$(function(){var mydate = new Date(); var tm=mydate.getFullYear(); $("#timeYear").text(tm); });