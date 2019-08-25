<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="UTF-8">
    <title>管理员页面</title>
    <!--
    备注：管理员界面 ：查/删/改
    本页面可查看、删除、更改表格数据
    由 3 部分控件组成：
    1. 通用控件：页面间跳转
    2. 表格控件：显示表格数据并缓存
    3. 分页控件：分页

    -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script>
        window.onload=function () {
            if(window.sessionStorage.getItem('revise')==null){
                var revise={};
                window.sessionStorage.setItem('revise',JSON.stringify(revise));
            }
        }

        window.onbeforeunload=function () {
            //刷新页面时，将flag恢复为true，则下次进入页面时需要重新渲染表格
            window.sessionStorage.setItem("leaveRevise_music","true");
            window.sessionStorage.setItem("leaveRevise_creator","true");
            window.sessionStorage.setItem("leaveRevise_admin","true");
            window.sessionStorage.setItem("leaveRevise_album","true");
            window.sessionStorage.setItem("leaveRevise_account","true");
        }


        //*切换不同表格的缓存数据；五个表格的缓存信息分开管理
        //当前页面最后一行数据在整个表格中的序号
        var Current={"account":0,"admin":0,"music":0,"album":0,"creator":0};
        //表格的总行数
        var Amount={"account":0,"admin":0,"music":0,"album":0,"creator":0};
        //当前页码
        var PageIndex={"account":0,"admin":0,"music":0,"album":0,"creator":0};
        //最大页码
        var PageMax={"account":0,"admin":0,"music":0,"album":0,"creator":0};


        //不需缓存的信息
        //var bufferCnt=100;//预加载100行
        var onePage=3;//每页显示3行数据

        var lastPage="";//保存当前表格的名字

        var uiName={//表格的名字与中文选项的对应
            "创作者":"creator",
            "音乐":"music",
            "专辑/live":"album",
            "账户":"account",
            "管理员":"admin",
            "榜单":"billboard",
            "-基本表单-":""};
        var buttonSite={//“修改”“确认”按钮的位置
            "billboard": 6,
            "admin":5,
            "account":5,
            "album":8,
            "music":17,
            "creator":10
        };


        var letter2Number={'a':0,'b':1,'c':2,'d':3,'e':4,
            'f':5,'g':6,'h':7,'i':8,'j':9,
            'k':10,'l':11,'m':12,'n':13,'o':14,
            'p':15,'q':16,'r':17,'s':18,'t':19,
            'u':20,'v':21,'w':22,'x':23,'y':24,
            'z':25};
        var number2Letter={0:'a',1:'b',2:'c',3:'d',4:'e',
            5:'f',6:'g',7:'h',8:'i',9:'j',
            10:'k',11:'l',12:'m',13:'n',14:'o',
            15:'p',16:'q',17:'r',18:'s',19:'t',
            20:'u',21:'v',22:'w',23:'x',24:'y',
            25:'z'}


        //切换页面
        function redirection(location) {
            //刷新页面时，将flag恢复为true，则下次进入页面时需要重新渲染表格
            window.sessionStorage.setItem("leaveRevise_music","true");
            window.sessionStorage.setItem("leaveRevise_creator","true");
            window.sessionStorage.setItem("leaveRevise_admin","true");
            window.sessionStorage.setItem("leaveRevise_album","true");
            window.sessionStorage.setItem("leaveRevise_account","true");

            window.location=location;
        }

        //切换表格
        function switchPage() {
            try{
            var newPage=uiName[$('#basicPage').find('option:selected').text()];
            //相同表格则不切换
            if(newPage==lastPage)return;
            //上一个表格若为""空则不需要隐藏
            if(lastPage!=""){
                document.getElementById(lastPage+'UI').style.display='none';
            }

            lastPage=newPage;

            if(newPage!=""){
                document.getElementById(newPage+'UI').style.display="block";
                if(document.getElementById('reviseCheck').checked==false)
                    $('#'+newPage+'Table tr').find('td:eq('+buttonSite[newPage]+')').hide();
            }

            //rs保存表格数据
            var rs=null;
            rs=window.sessionStorage.getItem(newPage);
            if(rs!=null){//若不为空，则表明曾经加载；

                //alert(window.sessionStorage.getItem("leaveRevise_"+newPage));
                if(window.sessionStorage.getItem("leaveRevise_"+newPage)=="true"){//曾经加载该表格，但离开该网址，需要重新渲染
                    window.sessionStorage.setItem("leaveRevise_"+newPage,"false");
                    printData(newPage,rs);
                    return;
                }

                //曾经加载该表格，且未离开该网址，不需要重新渲染表格；只需要更换“换页控件”的数据
                    if(PageMax[newPage]>1){
                        initJumpTo(PageMax[newPage]);
                        $('#jumpTo').find('div:eq(0)').text(PageIndex[newPage]);
                        $('#jumpTo').find('div:eq(1)').text('('+PageMax[newPage]+')');
                        document.getElementById('jumpTo').style.display='inline';
                    }else
                    {
                        document.getElementById('jumpTo').style.display='none';
                    }
                    return;


            }


            //sessionStorage中无数据，需要去数据库加载
            else{
                $.ajax({
                    type:"post",
                    dataType:"text",
                    //contentType:"application/json;charset=utf-8",
                    url:"${pageContext.request.contextPath}/servlet/LoadData",
                    data:{"page":newPage},
                    success:function (rs) {//String
                        window.sessionStorage.setItem(newPage,rs);
                        printData(newPage,rs);
                    }
                });}
            }

        catch(err){
            document.getElementById("errorMsg").innerHTML=err.message;
        }
        }



        //普通渲染
        function printData(newPage,rs) {

            var data=JSON.parse(rs);//JSONArray

            var rowCnt=data.length;
            Amount[newPage]=data.length;

            //如果表格数据多于单页的最大行值，则分页显示
            if(rowCnt>onePage){
                rowCnt=onePage;

                //初始化 当前页码 为1
                PageIndex[newPage]=1;
                //初始化 页码最大值
                PageMax[newPage]=Math.ceil( Amount[newPage]/onePage);

                //初始化控件
                initJumpTo(PageMax[newPage]);
                $('#jumpTo').find('div:eq(0)').text(PageIndex[newPage]);
                $('#jumpTo').find('div:eq(1)').text('('+PageMax[newPage]+')');
                document.getElementById('jumpTo').style.display='inline';
            }else
            {
                document.getElementById('jumpTo').style.display='none';
            }

            var i=0;
            for(;i<rowCnt;++i){//rowCnt 行数
                var rowData=data[i];//data ：JSONArray
                var newRow=$('#'+newPage+'RowTemp').clone();//复制模板行
                    for(var key in rowData){
                        newRow.find("td:eq("+letter2Number[key]+")").find('p').append(rowData[key]);//更新到对应td
                        //我在数据库里创建了一些新视图，用a，b，c的方式命名表项，对应到数字0,1,2……这样就避免了空项的不显示，
                        //也不用大量使用id（实际上用id也可以的）
                    }

                newRow.css('display','table-row');
                newRow.insertAfter("#"+newPage+"Table tr:last");
            }
            Current[newPage]=i;
        }


        //换页函数一：跳转最大页码的初始化
        function initJumpTo(max) {
            $('#pageNo').attr('max',max);
        }
        //换页函数二：上一页
        function jumpLast() {
            if(PageIndex[lastPage]==1)return;

            PageIndex[lastPage]-=1;
            $('#jumpTo').find('div:eq(0)').text(PageIndex[lastPage]);

            //确定显示哪几个jsonObj：[current,rowEnd)
            Current[lastPage]=(PageIndex[lastPage]-1)*onePage;
            var rowEnd=onePage+Current[lastPage];


            updateRows(rowEnd);
        }
        //换页函数三：下一页
        function jumpNext() {
            if(PageIndex[lastPage]+1>PageMax[lastPage])return;

            //确定显示哪几个jsonObj：[current,rowEnd)
            Current[lastPage]=PageIndex[lastPage]*onePage;
            var rowEnd=(Current[lastPage]+onePage> Amount[lastPage])? Amount[lastPage]:(Current[lastPage]+onePage);

            PageIndex[lastPage]+=1;
            $('#jumpTo').find('div:eq(0)').text(PageIndex[lastPage]);

            updateRows(rowEnd);

        }
        //换页函数四：跳转页面
        function jumpTo(pageNo) {
            var val=document.getElementById(pageNo).value;

            if(val>PageMax[lastPage]){
                document.getElementById(pageNo).value=PageMax[lastPage];
                return;
            }

            if(val<1){
                document.getElementById(pageNo).value=1;
                return;
            }

            PageIndex[lastPage]=val;
            $('#jumpTo').find('div:eq(0)').text(PageIndex[lastPage]);

            Current[lastPage]=(PageIndex[lastPage]-1)*onePage;
            var rowEnd=(Current[lastPage]+onePage> Amount[lastPage])? Amount[lastPage]:(Current[lastPage]+onePage);
            updateRows(rowEnd);
        }

        //换页函数五：跳转通用控件，根据页码更新数据
        function updateRows(rowEnd) {
            //删除旧的数据
            var deleteCnt=$('#'+lastPage+'Table tr:last').index()-1;
            for(var i=0;i<deleteCnt;++i){
                $('#'+lastPage+'Table tr:eq(2)').remove();
            }

            //获取缓存的数据
            try{
                var rs=window.sessionStorage.getItem(lastPage);
                var jsonArr=JSON.parse(rs);

                var current=Current[lastPage];
                for(;current<rowEnd;++current){
                    //复制 模板行
                    var newRow=$('#'+lastPage+'RowTemp').clone();
                    var rowData=jsonArr[current];

                    //给模板行赋值
                    for(var key in rowData){
                        newRow.find("td:eq("+letter2Number[key]+")").find('p').append(rowData[key]);
                    }
                    //显示模板行
                    newRow.css('display','table-row');
                    //插入到表格末尾
                    newRow.insertAfter("#"+lastPage+"Table tr:last");
                }
                Current[lastPage]=current;
            }catch (err){
                document.getElementById('errorMsg').innerHTML(err.message);
            }
        }



        //删除行
        function deleteRow(button) {
            //button: 删除按钮
            var tr=$(button).parent().parent();//按钮所在行
            var site=tr.index()-2;

            $(tr).remove();

            var indexInRs=PageIndex[lastPage]*onePage-onePage+site;//待删除行 在表格数据中的行号



            //从页面缓存中取出原数据
            var rs=window.sessionStorage.getItem(lastPage);
            var data=JSON.parse(rs);
            var json=data[indexInRs];

            //更新到数据库
            $.ajax({
                type:"post",
                //contentType:"application/json;charset=utf-8",
                url:"${pageContext.request.contextPath}/servlet/DeleteData",
                data:{"page":lastPage,"data":JSON.stringify(json)},
                success:function (data) {//String
                }
            });

            //删除页面缓存中的对应数据，更新
            data.splice(indexInRs,1);
            window.sessionStorage.setItem(lastPage,JSON.stringify(data));
        }

        //保存更改
        function save() {
            var revise=window.sessionStorage.getItem('revise');
            if(revise=="{}")return;

            $.ajax({
                type:"post",
                dataType:"text",
                url:"${pageContext.request.contextPath}/servlet/ChangeData",
                data:{"revise":revise},
                success:function (rs) {
                    revise={};
                    //清空缓存
                    window.sessionStorage.setItem('revise',JSON.stringify(revise));

                    //提示已完成保存
                    $('#tips').css('display','inline');
                    setTimeout(function () {
                        $('#tips').css('display','none');
                    },3000);
                }
            });
        }


    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/adm_function.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/adm_check.js"></script>
</head>

<body>


<p id="errorMsg"></p>

权限 当前:<span style="font-weight:bold">查/删/改</span>
<input type="button" value="增" onclick="redirection('adm_music.jsp')">
<input type="button" value="查/删/改">
<input type="button" value="返回首页" style="float: right" onclick="redirection('search1.jsp')">
</div>

<br/>
<div id="reviseSwitch" style="display: inline-block">
    <input type="checkbox" id="reviseCheck" onclick="reviseCheck(this,lastPage,buttonSite[lastPage])" >更改
</div>

<br/>

<!--               删/查/改               -->
<div id="reviseUI" >
    <div id='floatBoard' style="width:150px;height:300px;position:fixed;float:right;right:8px;background-color: lightblue">
        <button style="float:right;right:10px" onclick="document.getElementById('floatBoard').style.display='none'">X</button>
    </div>
    <button style="float:right" onclick="document.getElementById('floatBoard').style.display='inline'">[]</button>

    <br/>
    <div style="font-weight:bold;font-size:25px;display: inline-block">删/查/改</div>
    <div style="font-size: 15px;display: inline;margin-right: 15px">查询条件</div>


    <!--表格选项-->
    <select id="basicPage">
        <option>-基本表单-</option>
        <option>创作者</option>
        <option>音乐</option>
        <option>专辑/live</option>
        <option>账户</option>
        <option>管理员</option>
        <!--<option>榜单</option>-->
    </select>
    <input type="button" value="查询" onclick="switchPage()">



    <!--管理员-->
    <div id="adminUI" style="display: none">
        <div style="font-size: 15px;font-weight:bold">管理员</div>
        <table id='adminTable' value="0" style="text-align: center"	border="1px">
            <tr >
                <td><div id="adminRow0_0">id</div></td>
                <td><div id="adminRow0_1">账号</div></td>
                <td><div id="adminRow0_2">手机号</div></td>
                <td><div id="adminRow0_3">密码</div></td>
                <td><div id="adminRow0_4">操作记录</div></td>
                <td></td>
            </tr>

            <tr id="adminRowTemp" style="display: none">
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline" ></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" ><p style="display: inline" ></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td>
                    <input type="button" value="删除" onclick="deleteRow(this)">
                    <input type="button" value="更改" onclick="reviseRow(this,4)">
                </td>
            </tr>

        </table>
        <br/>
    </div>


    <div id="musicUI" style="display: none">
        <!--音乐-->
        <div style="font-size: 15px;font-weight:bold">音乐</div>
        <table id='musicTable' value="0" style="text-align: center"	border="1px">
            <tr >
                <td><div id="musicRow0_0">id</div></td>
                <td><div id="musicRow0_1" >曲名</div></td>
                <td><div id="musicRow0_2">点击量</div></td>
                <td><div id="musicRow0_3">简介</div></td>
                <td><div id="musicRow0_4" >首字母</div></td>
                <td><div id="musicRow0_5">头像地址</div></td>
                <td><div id="musicRow0_6" >演唱者</div></td>
                <td><div id="musicRow0_7" >姓名</div></td>
                <td><div id="musicRow0_8">曲作</div></td>
                <td><div id="musicRow0_9">姓名</div></td>
                <td><div id="musicRow0_10">词作</div></td>
                <td><div id="musicRow0_11">姓名</div></td>
                <td><div id="musicRow0_12">歌词地址</div></td>
                <td><div id="musicRow0_13">歌词贡献者</div></td>
                <td><div id="musicRow0_14" >音轨地址</div></td>
                <td><div id="musicRow0_15">伴奏地址</div></td>
                <td><div id="musicRow0_16">视频地址</div></td>
                <td></td>
            </tr>


            <tr id="musicRowTemp" style="display: none">
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
            </tr>

        </table>
        <br/>
    </div>



    <!--账户-->
    <div id="accountUI" style="display: none">
        <div style="font-size: 15px;font-weight:bold">账户</div>
        <table id='accountTable' value="0" style="text-align: center"	border="1px">
            <tr  >
                <td><div id="accountRow0_0">id</div></td>
                <td><div id="accountRow0_1">昵称</div></td>
                <td><div id="accountRow0_2">密码</div></td>
                <td><div id="accountRow0_3">vip</div></td>
                <td><div id="accountRow0_4">邮箱</div></td>
                <td></td>
            </tr>


            <tr id="accountRowTemp" style="display: none">
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
            </tr>

        </table>
        <br/>
    </div>

    <div id="albumUI" style="display: none">
        <!--专辑/live-->
        <div style="font-size: 15px;font-weight:bold">专辑/live</div>
        <table id='albumTable' value="0" style="text-align: center"	border="1px">
            <tr  >
                <td><div id="albumRow0_0">id</div></td>
                <td><div id="albumRow0_1">专辑名</div></td>
                <td><div id="albumRow0_2">简介</div></td>
                <td><div id="albumRow0_3">发售日</div></td>
                <td><div id="albumRow0_4">首字母</div></td>
                <td><div id="albumRow0_5">封面</div></td>
                <td><div id="albumRow0_6">主创</div></td>
                <td><div id="albumRow0_7">姓名</div>
                <td><div id="albumRow0_8">点击量</div></td>
                <td><div id="albumRow0_9">参与创作页</div></td>
                <td><div id="albumRow0_10">歌曲页</div></td>
                <td></td>
            </tr>

            <tr id="albumRowTemp" style="display: none">
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span style="color:lightcoral;text-decoration: underline;" onclick="jumpDetail('专辑创作者',$(this).parent().parent().find('td:eq(0)').find('p').text(),$(this).parent().parent().find('td:eq(1)').find('p').text())">跳转</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span style="color:lightcoral;text-decoration: underline;" onclick="jumpDetail('专辑歌曲',$(this).parent().parent().find('td:eq(0)').find('p').text(),$(this).parent().parent().find('td:eq(1)').find('p').text())">跳转</span></td>
                </tr>

        </table>
        <br/>
    </div>


    <div id="creatorUI" style="display: none">
        <!--创作者-->
        <div style="font-size: 15px;font-weight:bold">创作者</div>
        <table id='creatorTable' value="0" style="text-align: center"	border="1px">
            <tr >
                <td><div id="creatorRow0_0">id</div></td>
                <td><div id="creatorRow0_1">姓名</div></td>
                <td><div id="creatorRow0_2">头像预览</div></td>
                <td><div id="creatorRow0_3">性别</div></td>
                <td><div id="creatorRow0_4">国别</div></td>
                <td><div id="creatorRow0_5">地区</div></td>
                <td><div id="creatorRow0_6">点击量</div></td>
                <td><div id="creatorRow0_7">简介</div></td>
                <td><div id="creatorRow0_8">首字母</div></td>
                <td><div id="creatorRow0_9">作品页</div></td>
                <td></td>
            </tr>

            <tr id="creatorRowTemp" style="display: none">
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span contenteditable="false" style="visibility: hidden">&nbsp;</span></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p><span style="color:lightcoral;text-decoration: underline;" onclick="jumpDetail('音乐作品',$(this).parent().parent().find('td:eq(0)').text(),$(this).parent().parent().find('td:eq(1)').text())">跳转</span></td>
            </tr>

        </table>
        <br/>
    </div>



    <!--换页控件-->
    <div id="jumpTo" style="display: none;">
        <input type="button" value="上一页" onclick="jumpLast()">
        <div style="display: inline"></div>
        <div style="display: inline"></div>
        <input type="button" value="下一页" onclick="jumpNext()">
        <input type="number" style="width: 40px;" min="1" id="pageNo" >
        <input type="button" value="跳转" onclick="jumpTo('pageNo')">
    </div>

    <!--保存控件-->
    <button id="saveChange" onclick="save(this)" style="display: none">保存更改</button><span id="tips" style="color:darkred;display: none">(已保存更改...)</span>
    备注：若找不到更改框，请刷新。

</div>

</body>

</html>