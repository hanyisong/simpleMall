<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="user.jsp" %>
<html>
<script src="../JS/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $.ajax({
            /*url:ListGoods 会自动补错地址，所以直接加上绝对路径/LoginProject/ListGoods 生成http://localhost:8080/LoginProject/ListGoods*/
            url: "/LoginProject/ListGoods",
            dataType: "json",
            type: "post",
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
                            + "</td><td>"
                            + "<input type=\"text\" name=\""
                            + list[i].goods_id + "\" style='width: 80px'>"
                            + "</td><td><a style='cursor:pointer;border: #5a6268;' class='btn' onclick = 'buyGoods("
                            + list[i].goods_id+','+list[i].goods_num+','+list[i].goods_price+',"'+list[i].goods_name+'"'
                            + ")'>购买</a></td></tr>";
                    }
                    $("#table").append(str);
                }
            },
            error: function () {
                alert("后台中断！");
            }
        });
    });

    function buyGoods(goods_id,goods_num,goods_price,goods_name) {
        console.log(goods_num);
        console.log(goods_price);
        console.log(goods_name);
        console.log(goods_id);
        $.ajax({
            url: "/LoginProject/ByGoods",//容易出问题
            dataType: "json",
            type: "post",
            data: {
                "user_name":'${user.user_name}',
                "goods_name":goods_name,
                "goods_id": goods_id,
                "goods_num": goods_num,
                "number":$("input[name=\""+goods_id+"\"]").val(),
                "total": $("input[name=\""+goods_id+"\"]").val() * goods_price, //购买总价
            },
            success: function (data) {
                alert(data.msg);
                window.location.href = "byGoods.jsp";//重新执行自动查询
            },
            error: function () {
                alert("后台中断！");
            }
        });
    }
</script>
<style>
    .goodsmg-content {
        margin-top: 40px;
        margin-left: 40px;
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
                <th colspan="10"> 查询所有上架商品</th>
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
                <td>购买数量</td>
                <td>操作</td>
            </tr>
        </table>
        <%--        <button >查询</button>--%>
    </div>
</div>
</div>
</body>
</html>
