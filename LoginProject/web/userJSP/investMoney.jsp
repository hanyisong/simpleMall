<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2020/12/27
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="user.jsp" %>
<html>
<head>
</head>
<script type="text/javascript">
    function invest(){
        $.ajax({
            url: "/LoginProject/AddMoney",
            dataType: "json",
            type: "post",
            data:{
                "number":$("input[name='number']").val(),
                "user_name":'${user.user_name}',
            },
            success: function (data) {
                alert(data.msg);
                window.location.href = "investMoney.jsp";//重新执行自动查询
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
<body>
<div class="content-right" id="nrq">
    <div class="goodsmg-content" id="add-goods">
        <table border="1" class="hovertable">
            <tr>
                <th colspan="2">余额充值</th>
            </tr>
            <tr>
                <td>充值数量</td>
                <td><input type="text" name="number"></td>
            </tr>
        </table>
        <a class="btn" onclick="invest()">充值</a>
    </div>
</div>
</body>
</html>
