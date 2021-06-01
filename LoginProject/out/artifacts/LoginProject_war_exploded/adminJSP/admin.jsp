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
    <title>用户:${user_manage.user_name}</title>
    <!-- ../表示相对当前路径的上一级目录 -->
    <script type="text/javascript" src="../JS/jquery.js" ></script>
    <!-- 在<link>标签中，“rel=stylesheet”，rel是关联的意思，
        关联的是一个样式表(stylesheet)文档，
        它表示这个link在文档初始化时将被使用。 -->
    <!-- link+快捷键tab -->
    <link rel="stylesheet" href="../css/admin.css"/>
    <script type="text/javascript" src="../JS/jquery.js"></script>
    <script type="text/javascript" src="../JS/admin.js"></script>
</head>
<body>
<header>
    <h2>当前用户：${user_manage.user_name}</h2> <a href="../login_admin.jsp" style="color: #7abaff;font-weight: bold">退出登录</a>
</header>
<div class="content">
    <div class="content-left">
        <div class="left-title">
            <a href="#">商品管理后台</a>
        </div>
        <!-- 分割线 -->
        <div class="seg"></div>
        <!-- 菜单栏导航 -->
        <div class="nav">
            <!-- 每一个菜单栏项 -->
            <!-- 商品管理 -->
            <div class="nav-menu">
                <!-- 主标题 -->
                <div class="nav-title">商品管理</div>
                <!-- 子标题 -->
                <div class="nav-content">
                    <a href="admin-goodsList.jsp" id="list-goods">商品列表</a><!--包含删除 添加库存-->
                    <a href="admin-Addgoods.jsp" id="add-goods">添加商品</a>
                </div>
            </div>
            <!-- 类目管理 -->
            <div class="nav-menu">
                <!-- 主标题 -->
                <div class="nav-title">类目管理</div>
                <!-- 子标题 -->
                <div class="nav-content">
                    <a href="admin-TypeList.jsp" id="list-type">类目列表</a>
                </div>
                <div class="nav-content">
                    <a href="admin-TypeSelect.jsp" id="select-type">类目查找</a>
                </div>
            </div>
            <!-- 库存管理 -->
            <div class="nav-menu">
                <div class="nav-title">仓库管理</div>
                <div class="nav-content">
                    <a href="admin-LibList.jsp" id="list-lib">仓库列表</a>
                    <a href="admin-LibAdd.jsp" id="add-lib">商品仓库添加</a>
                </div>
            </div>
            <!-- 订单管理 -->
            <div class="nav-menu">
                <div class="nav-title">订单管理</div>
                <div class="nav-content">
                    <a href="admin-OrderList.jsp" id="add-order">订单列表</a> <%--包含发货--%>
                </div>
            </div>
            <!-- 用户管理 -->
            <div class="nav-menu">
                <div class="nav-title">顾客管理</div>
                <div class="nav-content">
                    <a href="admin-UserList.jsp" id="add-user">顾客列表</a>
                    <a href="admin-ReGoods.jsp" id="ud-user">退货处理</a>
                </div>
            </div>
        </div>
        <!-- 分割线 -->
        <div class="seg"></div>
</div>
    <%--必须少个</div>这样后面能能正常接上--%>
</body>


</html>