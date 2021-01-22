<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>虎牙博客管理后台</title>
    <link rel="stylesheet" type="text/css" href="/blog/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/blog/css/back/style1.css">
    <link rel="stylesheet" type="text/css" href="/blog/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="/blog/images/favicon.ico" type="image/x-icon"/>
    <link href="/blog/layui/css/layui.css" rel="stylesheet" type="text/css" />
</head>

<body class="user-select">
<section class="container-fluid">
    <header>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    <img src="/blog/images/logo.png" style="width: 50px;height: 64px;position: relative;left: 80px;"></div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="">消息 <span class="badge">1</span></a></li>
                        <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.username} <span class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:void(0)" onclick="loginOut()" >退出登录</a></li>
                        <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
                    </ul>
                    <form action="" method="post" class="navbar-form navbar-right" role="search">
                        <div class="input-group">
                            <input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
                            <span class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
              </span> </div>
                    </form>
                </div>
            </div>
        </nav>
    </header>
    <div class="row">
        <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="index.html">报告</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="/blog/toView/article">文章</a></li>
                <li><a href="notice.html">公告</a></li>
                <li><a href="comment.html">评论</a></li>
                <li><a data-toggle="tooltip" data-placement="bottom" title="网站暂无留言功能">留言</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="category.html">栏目</a></li>
                <li><a class="dropdown-toggle" id="otherMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">其他</a>
                    <ul class="dropdown-menu" aria-labelledby="otherMenu">
                        <li><a href="flink.html">友情链接</a></li>
                        <li><a data-toggle="modal" data-target="#areDeveloping">访问记录</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
                    <ul class="dropdown-menu" aria-labelledby="userMenu">
                        <li><a data-toggle="modal" data-target="#areDeveloping">管理用户组</a></li>
                        <li><a href="manage-user.html">管理用户</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="loginlog.html">管理登录日志</a></li>
                    </ul>
                </li>
                <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>
                    <ul class="dropdown-menu" aria-labelledby="settingMenu">
                        <li><a href="setting.html">基本设置</a></li>
                        <li><a href="readset.html">阅读设置</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a data-toggle="modal" data-target="#areDeveloping">安全配置</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="disabled"><a>扩展菜单</a></li>
                    </ul>
                </li>
            </ul>
        </aside>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <h1 class="page-header">信息总览</h1>
            <div class="row placeholders">
                <div class="col-xs-6 col-sm-3 placeholder">
                    <h4>文章</h4>
                    <span class="text-muted">0 条</span> </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <h4>评论</h4>
                    <span class="text-muted">0 条</span> </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <h4>友链</h4>
                    <span class="text-muted">0 条</span> </div>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <h4>访问量</h4>
                    <span class="text-muted">0</span> </div>
            </div>
            <h1 class="page-header">状态</h1>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <tbody>
                    <tr>
                        <td>登录者: <span>${user.username}</span>，这是您第 <span>${user.loginCout}</span> 次登录</td>
                    </tr>
                    <tr>
                        <td>上次登录时间: ${user.lastLoginTime} , 上次登录IP: ${user.loginIp}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <h1 class="page-header">系统信息</h1>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr> </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>管理员个数:</td>
                        <td>2 人</td>
                        <td>服务器软件:</td>
                        <td>Apache/2.4.10 (Win32) OpenSSL/1.0.1i mod_fcgid/2.3.9</td>
                    </tr>
                    <tr>
                        <td>浏览器:</td>
                        <td>Chrome47</td>
                        <td>PHP版本:</td>
                        <td>5.6.1</td>
                    </tr>
                    <tr>
                        <td>操作系统:</td>
                        <td>Windows 10</td>
                        <td>PHP运行方式:</td>
                        <td>CGI-FCGI</td>
                    </tr>
                    <tr>
                        <td>登录者IP:</td>
                        <td>::1:55570</td>
                        <td>MYSQL版本:</td>
                        <td>5.5.40</td>
                    </tr>
                    <tr>
                        <td>程序版本:</td>
                        <td class="version">YlsatCMS 1.0 <font size="-6" color="#BBB">(20160108160215)</font></td>
                        <td>上传文件:</td>
                        <td>可以 <font size="-6" color="#BBB">(最大文件：2M ，表单：8M )</font></td>
                    </tr>
                    <tr>
                        <td>程序编码:</td>
                        <td>UTF-8</td>
                        <td>当前时间:</td>
                        <td>2016-01-08 15:50:30</td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr></tr>
                    </tfoot>
                </table>
            </div>
            <footer>
                <h1 class="page-header">程序信息</h1>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <tbody>
                        <tr>
                            <td><span style="display:inline-block; width:8em">版权所有</span> POWERED BY WY ALL RIGHTS RESERVED</td>
                        </tr>
                        <tr>
                            <td><span style="display:inline-block;width:8em">页面加载时间</span> PROCESSED IN 1.0835s  SECONDS </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </footer>
        </div>
    </div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="updateUserForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >个人信息</h4>
                </div>
                <div class="modal-body">
                    <table class="table" style="margin-bottom:0px;">
                        <thead>
                        <tr> </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td wdith="20%">姓名:</td>
                            <td width="80%"><input id="nickname" type="text" value="${user.nickname}" class="form-control" name="nickname" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">用户名:</td>
                            <td width="80%"><input id="username" type="text" value="${user.username}" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">电话:</td>
                            <td width="80%"><input id="phone" type="text" value="${user.phone}" class="form-control" name="phone" maxlength="13" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">旧密码:</td>
                            <td width="80%"><input id="oldPass" type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">新密码:</td>
                            <td width="80%"><input id="password" type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
                        </tr>
                        <tr>
                            <td wdith="20%">确认密码:</td>
                            <td width="80%"><input id="rePassword" type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr></tr>
                        </tfoot>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" onclick="updateUser()" class="btn btn-primary">提交</button>
                </div>

            </div>
        </form>
    </div>
</div>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >登录记录</h4>
            </div>
            <div class="modal-body">
                <table class="table" style="margin-bottom:0px;">
                    <thead>
                    <tr>
                        <th>登录IP</th>
                        <th>登录时间</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>::1:55570</td>
                        <td>2016-01-08 15:50:28</td>
                        <td>成功</td>
                    </tr>
                    <tr>
                        <td>::1:64377</td>
                        <td>2016-01-08 10:27:44</td>
                        <td>成功</td>
                    </tr>
                    <tr>
                        <td>::1:64027</td>
                        <td>2016-01-08 10:19:25</td>
                        <td>成功</td>
                    </tr>
                    <tr>
                        <td>::1:57081</td>
                        <td>2016-01-06 10:35:12</td>
                        <td>成功</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
            </div>
        </div>
    </div>
</div>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
    <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
            </div>
            <div class="modal-body" style="text-align:center"> <img src="images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
        </div>
    </div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
            </div>
            <div class="modal-body"> <img src="images/baoman/baoman_01.gif" alt="深思熟虑" />
                <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
            </div>
        </div>
    </div>
</div>
<!--右键菜单列表-->
<div id="rightClickMenu">
    <ul class="list-group rightClickMenuList">
        <li class="list-group-item disabled">欢迎访问异清轩博客</li>
        <li class="list-group-item"><span>IP：</span>172.16.10.129</li>
        <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
        <li class="list-group-item"><span>系统：</span>Windows10 </li>
        <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
    </ul>
</div>
<script src="/blog/js/jquery/jquery-2.1.1.min.js"></script>
<script src="/blog/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script src="/blog/js/admin-scripts.js"></script>
<script src="/blog/layui/layui.js" type="text/javascript"></script>
</body>
</html>
<script>
    //登出功能
    function loginOut() {
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.confirm('确认退出系统吗？', {
                btn: ['确定', '取消'], //可以无限个按钮
                offset : '250px'
            }, function(index, layero){
                //按钮【按钮一】的回调
                location.href = "/blog/user/loginOut";
            }, function(index){
                //按钮【按钮二】的回调
                return
            });
        });
    }

    //用户修改密码，输入旧密码的时候，返送异步请求校验一下输入的旧密码是否正确
    $('#oldPass').blur(function () {
        $.get("/blog/user/verifyPassword",{'oldPass':$(this).val()},function (data) {
                //输入的密码和原先旧密码不一致
               if(!data.ok){
                   layui.use('layer',function () {
                       var layer = layui.layer;
                       layer.msg(data.mess,{offset:'t',icon : 5});
                   });
               }
        },'json');
    });

    //校验输入新密码是否一致
    $('#password').blur(function () {
            if($(this).val() != $('#rePassword').val()){
                layui.use('layer',function () {
                    var layer = layui.layer;
                    layer.msg("两次输入密码不一致",{offset:'t',icon : 5});
                });
            }
    });
    $('#rePassword').blur(function () {
            if($(this).val() != $('#password').val()){
                layui.use('layer',function () {
                    var layer = layui.layer;
                    layer.msg("两次输入密码不一致",{offset:'t',icon : 5});
                });
            }
    });

    function updateUser() {
        $.ajax({
            url : '/blog/user/updateUser',
            data : $('#updateUserForm').serialize(),
            type : 'post',
            dataType : 'json',
            async: false,
            success : function (data) {
                //信息更新成功
                alert(data.mess);
            }
        });
    }
</script>
