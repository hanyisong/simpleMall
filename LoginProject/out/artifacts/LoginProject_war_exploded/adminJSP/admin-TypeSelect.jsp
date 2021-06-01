<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2020/12/25
  Time: 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="admin.jsp" %>
<html>
<head>
    <script src="../JS/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        function select_goods(){
            $.ajax({
                url: "/LoginProject/TypeSelect",
                dataType: "json",
                type: "post",
                data:{
                    "goods_type":$("input[name='type-goods']").val(),
                },
                success: function (data) {
                    if (data) {
                        var list = data.list;
                        var str = "";
                        for (var i = 0; i < list.length; i++) {
                            str += "<tr><td>"
                                + list[i].goods_id
                                + "</td><td>"
                                + list[i].goods_name
                                + "</td><td>"
                                + list[i].goods_type
                                + "</td><td>"
                                + list[i].goods_num
                                + "</td><td>"
                                + list[i].goods_price
                                + "</td><td>"
                                + list[i].goods_bzq
                                + "</td><td>"
                                + list[i].goods_source
                                + "</td><td>"
                                + list[i].goods_producer
                                + "</td><td><a style='cursor:pointer;border: #5a6268;' class='btn' onclick = 'deleteGoods("
                                + list[i].goods_id
                                + ")'>删除</a></td></tr>";
                        }
                        document.querySelector("#table").innerHTML="<tr>\n" +
                            "                <th colspan=\"9\">上架商品</th>\n" +
                            "            </tr> <tr>\n" +
                            "                <td>商品ID</td>\n" +
                            "                <td>商品名称</td>\n" +
                            "                <td>商品类型</td>\n" +
                            "                <td>商品数量</td>\n" +
                            "                <td>商品价格</td>\n" +
                            "                <td>保质期</td>\n" +
                            "                <td>生产地</td>\n" +
                            "                <td>生产公司</td>\n" +
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
        function add_type(){
            $.ajax({
                url: "/LoginProject/AddType",
                dataType: "json",
                type: "post",
                data:{
                    "goods_type":$("input[name='type']").val(),
                },
                success:function (data) {
                    alert(data.msg);
                    window.location.href = "admin-TypeList.jsp";
                },
                error: function () {
                    alert("添加类型后台中断！");
                }
            });
        }
    </script>
    <style>
        .goodsmg-content {
            margin-top: 100px;
            margin-left: 100px;
        }

        .goodsmg-content td {
            width: 100px;
            text-align: center;
        }

        .goodsmg-content>a{
            margin-top: 20px;
            margin-left: 100px;
        }

        table.hovertable {
            margin-top: 50px;
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

    </style>
</head>
<body>
<div class="content-right" id="nrq">
    <div class="goodsmg-content" id="add-goods">
        <table border="1" class="hovertable" >
            <tr>
                <th colspan="2">商品分类类查找</th>
            </tr>
            <tr>
                <td>商品类型</td>
                <td><input type="text" name="type-goods"></td>
            </tr>
        </table>
        <a class="btn" onclick="select_goods()">查找</a>

        <table border="1" class="hovertable" >
            <tr>
                <th colspan="2">商品类目添加</th>
            </tr>
            <tr>
                <td>商品类型</td>
                <td><input type="text" name="type"></td>
            </tr>
        </table>
        <a class="btn" onclick="add_type()">添加</a>

        <table border="1" class="hovertable" id="table">
            <tr>
                <th colspan="9">上架商品</th>
            </tr>
            <tr>
                <td>商品ID</td>
                <td>商品名称</td>
                <td>商品类型</td>
                <td>商品数量</td>
                <td>商品价格</td>
                <td>保质期</td>
                <td>生产地</td>
                <td>生产公司</td>
                <td>操作</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
