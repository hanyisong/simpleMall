/*当整个HTML文档加载完成之后再执行此函数*/
$(function () {
    // /**实现抽屉式菜单栏**/
    // //隐藏所有的子功能
    // $(".goodsmg-title").each(function () {
    //     $(this).hide();
    // });
    //隐藏所有的子标题
    $(".nav-menu").each(function () {
        $(this).children(".nav-content").hide();
    });
    //给所有菜单项主标题绑定事件
    $(".nav-title").each(function () {
        $(this).click(function () {
            //当我点击主标题时，其子标题区展示出来
            //获取当前点击主标题下的子标题内容区
            var navConEle = $(this).parents(".nav-menu").children(".nav-content");
            //获取navConEle对象的display这个属性值是否为none
            if (navConEle.css("display") != "none") {
                //隐藏
                navConEle.slideUp(500);
            } else {
                //展示
                //获得点击菜单项的父元素
                var navEle = $(this).parents(".nav-menu");
                //获得除navConEle本身外所有兄弟元素
                var menuEles = navEle.siblings();
                menuEles.each(function () {
                    $(this).children(".nav-content").slideUp(500);
                });
                navConEle.slideDown(500);
            }
        });
    });
    /**点击子标题显示对应功能界面**/

});

