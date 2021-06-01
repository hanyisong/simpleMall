<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2020/12/17
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/admin.css"/>
    <title>用户:${user.user_name}</title>
    <!-- ../表示相对当前路径的上一级目录 -->
    <script type="text/javascript" src="../JS/jquery.js"></script>
    <!-- 在<link>标签中，“rel=stylesheet”，rel是关联的意思，
        关联的是一个样式表(stylesheet)文档，
        它表示这个link在文档初始化时将被使用。 -->
    <!-- link+快捷键tab -->
    <script type="text/javascript" src="../JS/jquery.js"></script>
    <script type="text/javascript" src="../JS/admin.js"></script>
    <script>
        $(function () {
            //ajax检查个人信息是否完善
            userCheck();
            //余额查询
            MoneySelect();
        });
        function MoneySelect(){
            $.ajax({
               url:"/LoginProject/MoneySelect",
                dataType:"json",
                type:"post",
                data: {
                    "user_name":'${user.user_name}'
                },
                success:function (data){
                   $("header>h2").html("当前用户："+'${user.user_name}'+'&emsp;'+'&emsp;'+"用户余额:"+data.money+"元");
                },
                error:function (){
                    alert("查询余额后台中断！");
                }
            });
        }
        //ajax检查个人信息是否完善
        function userCheck(){
            $.ajax({
                url: "/LoginProject/userCheck",
                dataType: "json",
                type: "post",
                data: {
                    "user_name":'${user.user_name}'
                },
                success: function (data) {
                    if (data.flag) {
                        //信息完善则关闭对话框
                        closeDialog();
                    } else {
                        openDialog();
                    }
                },
                error: function () {
                    alert("userCheck后台中断！:无传入user_name");
                }
            });
        }
        //个人信息完善
        function complete_user(){
            var real_name = $("input[name='real_name']").val();
            var user_age = $("input[name='user_age']").val();
            var user_tel = $("input[name='user_tel']").val();
            var user_address = $("input[name='user_address']").val();
            var user_name = '${user.user_name}';
            if(isEmpty(real_name)||isEmpty(user_age)||isEmpty(user_tel)||isEmpty(user_address)){
                alert("请填写完整信息");
                return false;
            }
            $.ajax({
                url: "/LoginProject/userComplete",
                dataType: "json",
                type: "post",
                data: {
                    "real_name":real_name,
                    "user_age":user_age,
                    "user_tel":user_tel,
                    "user_address":user_address,
                    "user_name":user_name
                },
                success: function (data) {
                    alert(data.msg);
                    userCheck();//重新检测是否完善信息
                },
                error: function () {
                    alert("complete_user后台中断！");
                }
            });
        }
        function openDialog() {
            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';
        }

        function closeDialog() {
            document.getElementById('light').style.display = 'none';
            document.getElementById('fade').style.display = 'none';
        }

        function isEmpty(str) {
            if (str == null || str.trim() == "") return true;
            else return false;
        }
    </script>
    <style>
        .goodsmg-content {
            margin-top: 20px;
            margin-left: 40px;
        }

        .goodsmg-content td {
            width: 100px;
            text-align: center;
        }

        .goodsmg-content > a {
            margin-top: 20px;
            margin-left: 100px;
        }

        table.hovertable {
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
        }

        table.hovertable th {
            background-color: #c3dde0;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }

        table.hovertable tr {
            background-color: #d4e3e5;
        }

        table.hovertable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }

        .btn {
            border-radius: 4px;
            height: 30px;
            font-size: 13px;
            font-weight: 600;
            text-transform: uppercase;
            -webkit-transition: all 200ms linear;
            transition: all 200ms linear;
            padding: 0 30px;
            letter-spacing: 1px;
            display: -webkit-inline-flex;
            display: -ms-inline-flexbox;
            display: inline-flex;
            -webkit-align-items: center;
            -moz-align-items: center;
            -ms-align-items: center;
            align-items: center;
            -webkit-justify-content: center;
            -moz-justify-content: center;
            -ms-justify-content: center;
            justify-content: center;
            -ms-flex-pack: center;
            text-align: center;
            border: none;
            background-color: #ffeba7;
            color: #102770;
            box-shadow: 0 8px 24px 0 rgba(255, 235, 167, 0.2);
        }

        .btn:hover {
            background-color: #f3d97f;
            color: #061f6e;
            box-shadow: 0 8px 24px 0 rgba(16, 39, 112, 0.2);
        }

        /*蒙版样式*/
        .black_overlay {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: #999999;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .60;
        }

        /*浮窗*/
        .white_content {
            display: none;
            position: absolute;
            top: 10%;
            left: 30%;
            width: 400px;
            height: 500px;
            padding: 20px;
            box-shadow: 0px 0px 15px black; /*阴影*/
            border-radius: 30px;
            background-color: #c3dde0;
            z-index: 1002;
            overflow: auto;
        }
        .nav a{
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>
<header>
    <h2></h2> <a href="../login_user.jsp" style="color: #7abaff;font-weight: bold">退出登录</a>
</header>

<%--浮动弹窗--%>
<!-- 弹出层 -->
<div id="light" class="white_content">
    <p align="center" style="font-weight: bold">您还未填写完整的个人信息，请在下方进行填写</p>
    <div class="goodsmg-content">
        <table border="1" class="hovertable">
            <tr>
                <th colspan="2">个人信息填写</th>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="real_name"></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type="text" name="user_age"></td>
            </tr>
            <tr>
                <td>联系方式</td>
                <td><input type="text" name="user_tel"></td>
            </tr>
            <tr>
                <td>住址</td>
                <td><input type="text" name="user_address"></td>
            </tr>
        </table>
        <a class="btn" onclick="complete_user()">添加</a>
    </div>
</div>
<!-- 蒙板 -->
<div id="fade" class="black_overlay"></div>

<div class="content">
    <div class="content-left">
        <div class="left-title">
            <a href="#">顾客商品购买</a>
        </div>
        <!-- 分割线 -->
        <div class="seg"></div>
        <!-- 菜单栏导航 -->
        <div class="nav">
            <!-- 每一个菜单栏项 -->
            <!-- 商品购买 -->
            <div class="nav-menu">
                <!-- 主标题 -->
                <a class="nav-title" href="byGoods.jsp">商品购买</a>
            </div>
            <!-- 订单管理 -->
            <div class="nav-menu">
                <!-- 主标题 -->
                <a class="nav-title" href="user-order.jsp">我的订单</a>
            </div>
            <!-- 余额充值 -->
            <div class="nav-menu">
                <a class="nav-title" href="investMoney.jsp">余额充值</a>
            </div>
            <%--退货查询--%>
            <div class="nav-menu">
                <!-- 主标题 -->
                <a class="nav-title" href="returnGoods.jsp">退货查询</a>
            </div>
        </div>
        <!-- 分割线 -->
        <div class="seg"></div>
    </div>
    <%--少个</div>为了接上后面--%>
</body>
</html>