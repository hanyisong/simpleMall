<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2020/12/12
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <title>顾客登录</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/unicons.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<div class="section dwo">
    <div class="left">
        <img src="images/login_bg.png" style="background-repeat: no-repeat">
    </div>
    <div class="container right">
        <div class="row full-height justify-content-center">

            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center"></div>
                <input class="checkbox" type="checkbox" id="reg-log" name="reg-log">
                <div class="card-3d-wrap mx-auto">
                    <div class="card-3d-wrapper">
                        <%--顾客登录页面--%>
                        <div class="card-front">
                            <div class="center-wrap">
                                <div class="section text-center">
                                    <h4 class="mb-4 pb-3 usercolor">顾客登录</h4>

                                    <%-- 顾客登录form表单提交--%>

                                    <form id="loginForm" action="login_user" method="post">
                                        <%--用户名--%>
                                        <div class="form-group">
                                            <input type="email" name="uname" class="form-style" placeholder="请输入用户名"
                                                   id="uname"
                                                   autocomplete="off" value="${messageModel.object.user_name}">
                                            <i class="input-icon uil uil-at"></i>
                                        </div>
                                        <%--密码--%>
                                        <div class="form-group mt-2">
                                            <input type="password" name="upwd" class="form-style" placeholder="请输入密码"
                                                   id="upwd"
                                                   autocomplete="off" value="${messageModel.object.user_pwd}">
                                            <i class="input-icon uil uil-lock-alt"></i>
                                        </div>
                                        <a class="btn mt-4" id="loginBtn">登录</a>

                                    </form>


                                    <div class="d-flex justify-content-between mt-4 text-left spanfu">
                                        <div class="flex-fill">
                                            <p>没有帐号？<label for="reg-log">立即注册</label></p>
                                        </div>

                                        <div class="flex-fill text-right">
                                            <p><a href="login_admin.jsp" class="forgot link">我是商家</a></p>
                                        </div>

                                    </div>
                                    <div class="spanzi">
                                        <span id="msg" style="font-weight:bold;color: red;">${messageModel.msg}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--顾客注册页面--%>
                        <div class="card-back">
                            <div class="center-wrap">
                                <div class="section text-center">
                                    <h4 class="mb-4 pb-3 usercolor">顾客注册</h4>

                                    <%--注册表单提交--%>
                                    <form id="registerForm" action="register_user" method="post">
                                        <div class="form-group">
                                            <input type="text" name="rg_uname" class="form-style"
                                                   placeholder="请输入用户名:3-10位" id="rg_uname" autocomplete="off">
                                            <i class="input-icon uil uil-user"></i>
                                        </div>
                                        <div class="form-group mt-2">
                                            <input type="text" name="rg_upwd" class="form-style"
                                                   placeholder="请输入密码:4-10位" id="rg_upwd" autocomplete="off">
                                            <i class="input-icon uil uil-lock-alt"></i>
                                        </div>
                                        <a id="registerBtn" class="btn mt-4">注册</a>
                                    </form>

                                    <p class="mb-0 mt-4 text-center">已有帐号？<label for="reg-log">立即登录</label></p>
                                    <div class="spanzi">
                                        <span id="msgg" style="font-weight:bold;color: red;"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>

<%--引入Jquery的js文件--%>
<script type="text/javascript" src="JS/jquery.js" charset="UTF-8"></script>
<script type="text/javascript">
    /**
     *
     * 登陆表单验证
     1.给登录按钮绑定点击事件（通过id选择器绑定）
     2.获取用户姓名和密码的值
     3.判断姓名密码是否为空
     如果姓名密码为空，提示用户（span 标签赋值），并return
     4.如果都不为空，则手动提交表单
     */


    /*.click 单击元素触发*/
    $("#loginBtn").click(function () {
        // 获取账号和密码的值
        var uname = $("#uname").val();
        var upwd = $("#upwd").val();
        //判断姓名是否为空
        if (isEmpty(uname)) {
            $("#msg").html("用户姓名不可为空");
            return;
        }
        //判断密码是否为空
        if (isEmpty(upwd)) {
            $("#msg").html("用户密码不可为空");
            return;
        }
        //如果都不为空

        $("#loginForm").submit();

    });

    /**
     * 注册表单验证
     1.给登录按钮绑定点击事件（通过id选择器绑定）
     2.获取用户姓名和密码的值
     3.判断姓名密码是否符合条件
        用户名非空且符合3-10位
        密码非空且符合4-10位
     如果姓名密码不符合条件，提示用户（span 标签赋值），并return
        1.用户名非空
        2.用户名符合3-10位
        3.密码非空
        4.密码符合4-10位
     4.如果符合条件，则手动提交表单
     *
    */

    $("#registerBtn").click(function () {
        // 获取账号和密码的值
        var rg_uname = $("#rg_uname").val();
        var rg_upwd = $("#rg_upwd").val();
        //1.判断姓名是否为空
        if (isEmpty(rg_uname)) {
            $("#msgg").html("用户名不可为空");
            return;
        }
        //2.用户名符合3-10位
        if(rg_uname.length<3 ){
            $("#msgg").html("用户名不可少于3位");
            return;
        }
        if(rg_uname.length>10 ){
            $("#msgg").html("用户名不可大于10位");
            return;
        }
        //3.判断密码是否为空
        if (isEmpty(rg_upwd)) {
            $("#msgg").html("用户密码不可为空");
            return;
        }
        //4.密码符合4-10位
        if(rg_upwd.length<4 ){
            $("#msgg").html("密码不可少于4位");
            return;
        }
        if(rg_upwd.length>10 ){
            $("#msgg").html("密码不可大于10位");
            return;
        }
        //如果都不为空
        $.ajax({
            url:"/LoginProject/register_user",
            dataType: "json",
            type: "post",
            data:{
                "rg_uname":rg_uname,
                "rg_upwd":rg_upwd,
            },
            success: function (data) {
                if(data.msg2 == "顾客注册成功!")
                window.location.href = "login_user.jsp";
                alert(data.msg2);
            },
            error: function () {
                alert("后台中断！");
            }
        })
    });


    /**
     * 判断字符串是否为空
     *      如果为空，返回true
     *      如果不为空，返回false
     * @param str
     */
    function isEmpty(str) {
        if (str == null || str.trim() == "") return true;
        else return false;
    }
</script>

</html>