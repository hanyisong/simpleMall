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
        function add_lib(){
            $.ajax({
                url: "/LoginProject/AddLib",
                dataType: "json",
                type: "post",
                data:{
                    "goods_name":$("input[name='goods_name']").val(),
                    "goods_type":$("input[name='goods_type']").val(),
                    "goods_num":$("input[name='goods_num']").val(),
                    "goods_price":$("input[name='goods_price']").val(),
                    "goods_bzq":$("input[name='goods_bzq']").val(),
                    "goods_source":$("input[name='goods_source']").val(),
                    "goods_producer":$("input[name='goods_producer']").val(),
                },
                success: function (data) {
                    alert(data.msg);
                    if(data.msg=="输入的**添加数量**应该为数字！"
                        || data.msg=="添加的**商品价格**应该为数字！"){
                        window.location.href = "admin-LibAdd.jsp";//重新添加
                    }else{
                        window.location.href = "admin-LibList.jsp";//跳到库存列表查看
                    }
                },
                error: function () {
                    alert("后台中断！");
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
        <table border="1" class="hovertable">
            <tr>
                <th colspan="2">添加商品</th>
            </tr>
            <tr>
                <td>商品名称</td>
                <td><input type="text" name="goods_name"></td>
            </tr>
            <tr>
                <td>商品类型</td>
                <td><input type="text" name="goods_type"></td>
            </tr>
            <tr>
                <td>添加数量</td>
                <td><input type="text" name="goods_num"></td>
            </tr>
            <tr>
                <td>商品价格</td>
                <td><input type="text" name="goods_price"></td>
            </tr>
            <tr>
                <td>保质期</td>
                <td><input type="text" name="goods_bzq"></td>
            </tr>
            <tr>
                <td>生产地</td>
                <td><input type="text" name="goods_source"></td>
            </tr>
            <tr>
                <td>生产公司</td>
                <td><input type="text" name="goods_producer"></td>
            </tr>
        </table>
        <a class="btn" onclick="add_lib()">添加</a>
    </div>
</div>
</body>
</html>
