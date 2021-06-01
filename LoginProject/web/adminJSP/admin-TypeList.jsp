<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2020/12/25
  Time: 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="admin.jsp" %>
<html>
<head>
</head>
<script src="../JS/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $.ajax({
            /*url:ListGoods 会自动补错地址，所以直接加上绝对路径/LoginProject/ListGoods 生成http://localhost:8080/LoginProject/ListGoods*/
            url: "/LoginProject/ListType",
            dataType: "json",
            type: "post",
            success: function (data) {
                if (data) {
                    var list = data.list;
                    var str = "";
                    for (var i = 0; i < list.length; i++) {
                        str += "<tr><td>"
                            + list[i].type_id
                            + "</td><td>"
                            + list[i].type_name
                            + "</td><td><a style='cursor:pointer;border: #5a6268;' class='btn' onclick = 'deleteType("
                            + list[i].type_id
                            + ")'>删除</a></td></tr>";
                    }
                    $("#table").append(str);
                }
            },
            error: function () {
                alert("后台中断！");
            }
        });
    });

    function deleteType(type_id) {
        $.ajax({
            url: "/LoginProject/DeleteType",
            dataType: "json",
            type: "post",
            data: {
                "type_id": type_id
            },
            success: function (data) {
                if (data.flag) {
                    alert("删除成功！");
                    window.location.href = "admin-TypeList.jsp";//重新执行自动查询
                } else {
                    alert("删除失败！");
                    window.location.href = "admin-TypeList.jsp";//重新执行自动查询
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
        height: 44px;
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
        <table id="table" border="1" class="hovertable" style="table-layout:fixed;"><%--style="table-layout:fixed;"自动换行--%>
            <tr>
                <th colspan="3"> 类目列表</th>
            </tr>
            <tr>
                <td>类目ID</td>
                <td>类目名称</td>
                <td>操作</td>
            </tr>
        </table>
    </div>
</div>
</div>
</body>
</html>