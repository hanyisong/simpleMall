<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2020/12/25
  Time: 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="admin.jsp" %>
<html>
<head>
</head>
<script src="../JS/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
    function finish_return(){//已退货
        $.ajax({
            url:"/LoginProject/AllReturnGoodsList",
            dataType:"json",
            type: "post",
            data:{
                "flag":1
            },
            success: function (data) {
                if (data) {
                    var list = data.list;
                    var str = "";
                    for (var i = 0; i < list.length; i++) {
                        str += "<tr><td>"
                            + list[i].order_id
                            + "</td><td>"
                            + list[i].goods_name
                            + "</td><td>"
                            + list[i].goods_type
                            + "</td><td>"
                            + list[i].number//购买数量
                            + "</td><td>"
                            + list[i].total//总价
                            + "</td><td>"
                            + list[i].real_name//顾客真实姓名
                            + "</td><td>"
                            + list[i].user_tel//联系方式
                            + "</td><td>"
                            + list[i].user_address//地址
                            + "</td><td>"
                            + list[i].state//退货状态
                            + "</td><td>无</td></tr>";
                    }
                    document.querySelector("#table").innerHTML="<tr>\n" +
                        "                <th colspan=\"10\">退货列表</th>\n" +
                        "            </tr>\n" +
                        "            <tr>\n" +
                        "                <td>订单ID</td>\n" +
                        "                <td>商品名称</td>\n" +
                        "                <td>商品类型</td>\n" +
                        "                <td>购买数量</td>\n" +
                        "                <td>总价</td>\n" +
                        "                <td>顾客姓名</td>\n" +
                        "                <td>顾客联系方式</td>\n" +
                        "                <td>顾客地址</td>\n" +
                        "                <td>退货状态</td>\n" +
                        "                <td>操作</td>\n" +
                        "            </tr>";
                    $("#table").append(str);
                }
            },
            error: function () {
                alert("后台中断！");
            }
        });
    }
    function finished_return(){//未退货
        $.ajax({
            url:"/LoginProject/AllReturnGoodsList",
            dataType:"json",
            type: "post",
            data:{
                "flag":0
            },
            success: function (data) {
                if (data) {
                    var list = data.list;
                    var str = "";
                    for (var i = 0; i < list.length; i++) {
                        str += "<tr><td>"
                            + list[i].order_id
                            + "</td><td>"
                            + list[i].goods_name
                            + "</td><td>"
                            + list[i].goods_type
                            + "</td><td>"
                            + list[i].number//购买数量
                            + "</td><td>"
                            + list[i].total//总价
                            + "</td><td>"
                            + list[i].real_name//顾客真实姓名
                            + "</td><td>"
                            + list[i].user_tel//联系方式
                            + "</td><td>"
                            + list[i].user_address//地址
                            + "</td><td>"
                            + list[i].state//退货状态
                            + "</td><td><a style='cursor:pointer;border: #5a6268;width: 60px;margin: auto' class='btn' onclick = 'PermitReturnGoods("
                            + list[i].id+','+list[i].order_id+','+ list[i].number+','+ list[i].total+',"'+list[i].goods_name+'","'+list[i].user_name+'"'
                            + ")'>允许退货</a></td></tr>";
                    }
                    document.querySelector("#table").innerHTML="<tr>\n" +
                        "                <th colspan=\"10\">退货列表</th>\n" +
                        "            </tr>\n" +
                        "            <tr>\n" +
                        "                <td>订单ID</td>\n" +
                        "                <td>商品名称</td>\n" +
                        "                <td>商品类型</td>\n" +
                        "                <td>购买数量</td>\n" +
                        "                <td>总价</td>\n" +
                        "                <td>顾客姓名</td>\n" +
                        "                <td>顾客联系方式</td>\n" +
                        "                <td>顾客地址</td>\n" +
                        "                <td>退货状态</td>\n" +
                        "                <td>操作</td>\n" +
                        "            </tr>";
                    $("#table").append(str);
                }
            },
            error: function () {
                alert("后台中断！");
            }
        });
    }
    function PermitReturnGoods(id,order_id,number,total,goods_name,user_name){//允许退货
        $.ajax({
            url:"/LoginProject/AdminReturnManage",
            dataType:"json",
            type: "post",
            data:{
                "id":id,
                "order_id":order_id,
                "number":number,
                "total":total,
                "goods_name":goods_name,
                "user_name":user_name
            },
            success:function (){
                alert("订单号:"+order_id+"，已允许退货！")
                window.location.href = "admin-ReGoods.jsp";//重新执行自动查询
            },
            error:function (){
                alert("允许退货的后台中断")
            }
        });
    }
</script>
<style>
    .goodsmg-content {
        margin-top: 70px;
        margin-left: 20px;
    }

    .goodsmg-content td {
        width: 100px;
        text-align: center;
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
        margin-right: 100px;
        margin-bottom: 50px;
        border-radius: 4px;
        height: 40px;
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
</style>
<body>
<div class="content-right" id="nrq">
    <div class="goodsmg-content" id="select">
        <a class="btn" onclick="finish_return()">显示已退货列表</a>
        <a class="btn" onclick="finished_return()">显示未退货表</a>

        <table id="table" border="1" class="hovertable" style="table-layout:fixed;"><%--style="table-layout:fixed;"自动换行--%>
            <tr>
                <th colspan="10">退货列表</th>
            </tr>
            <tr>
                <td>订单ID</td>
                <td>商品名称</td>
                <td>商品类型</td>
                <td>购买数量</td>
                <td>总价</td>
                <td>顾客姓名</td>
                <td>顾客联系方式</td>
                <td>顾客地址</td>
                <td>退货状态</td>
                <td>操作</td>
            </tr>
        </table>
        <%--        <button >查询</button>--%>
    </div>
</div>
</div>
</body>
</html>
