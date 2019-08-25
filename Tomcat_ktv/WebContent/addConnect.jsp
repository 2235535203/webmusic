<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="UTF-8">
    <title>管理员页面</title>
    <link href="css/upload.css" rel='stylesheet' type='text/css' />

</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/adm_function.js"></script>
<body >

权限 当前:<span style="font-weight:bold">添加关联</span>
<input type="button" value="增：歌曲" onclick='redirection("adm_music.jsp")'>
<input type="button" value="增：创作者" onclick='redirection("adm_creator.jsp")'>
<input type="button" value="增：专辑" onclick='redirection("adm_album.jsp")'>
<input type="button" value="查/删/改" onclick="redirection('adm_revise.jsp')">
<br/>
<div style="font-size:25px">添加关联信息 </div>

<script>

    window.onload=function () {
        if(window.sessionStorage.getItem('type')!='result'){
            $("#main").attr('value',<%=request.getAttribute("main")%>);
            $("#main").html(<%=request.getAttribute("main")%>);
            $("#info").text(<%=request.getAttribute("info")%>);
            return;
        }

        $("#main").attr('value',window.sessionStorage.getItem('main'));
        $("#main").html(window.sessionStorage.getItem('main'));
        $("#main").next().text(window.sessionStorage.getItem('info'));

        //alert($("#main").text());

        var table=window.sessionStorage.getItem('table');
        document.getElementById(table+'UI').style.display='block';
        if(table=='music')
            document.getElementById('creatorUI').style.display='none';
        else
            document.getElementById('musicUI').style.display='none';

        loadChosen($('#main').attr('value'),table);
    }

    //当前页面为专辑信息
    var page="album";

    //最后一个被选中行的序号
    var chosenlast=1;
    var Chosenlast={'music':1,'creator':1};

    //是否已全搜索
    var searchAll=false;
    var SearchAll={'music':false,'creator':false};

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

    var oldRows={};//原选中的数据
    var newRows={};//保存时被选中的数据
    //根据这两个数据可以计算出 数据库中需要插入和删除的数据

        //换页
    function redirection(location) {//type制定打开表格时，是否根据专辑id搜索相关数据
                                      //若为result则是，否则不搜索
        window.sessionStorage.setItem('type','null');
        window.location=location;
    }

    //换表格
    function switchTab(show,hide) {

        document.getElementById(show+'UI').style.display="block";
        document.getElementById(hide+'UI').style.display="none";

        Chosenlast[hide]=chosenlast;
        chosenlast=Chosenlast[show];
        SearchAll[hide]=searchAll;
        searchAll=SearchAll[show];

        if(window.sessionStorage.getItem('type')=="result")
            loadChosen($("#main").attr("value"),show);
    }

    //内部函数：检查某行数据是否 已在被选中列
    function inChosen(id,table,req) {
        try{
            for(var i=2;i<=chosenlast;++i){
                //alert($('#'+table+"Table").find( "tr:eq("+i+")").find("td:eq("+letter2Number[id]+")").find('p').text());
                if(req===$('#'+table+"Table").find( "tr:eq("+i+")").find("td:eq("+letter2Number[id]+")").find('p').text())
                    return true;
            }
        }catch(err){
            alert(err.message);
        }
    }

    //搜索专辑的相关结果
    function search(id,table,req,button) {
        $(button).prev().val("");
        //alert(id+" "+table+" "+req);
        try{
            if(req==="all"||req===""||req==="\'\'"){
                if(searchAll===true)return;

                //若表格已全选搜索过，则所有数据已在列，不能再搜索
                searchAll=true;
                req="";
                //alert("he");
            }else if(inChosen(id,table,req)){
                //alert("here");
                return;
            }
            $.ajax({
                type:"post",
                dataType:"text",
                //contentType:"application/json;charset=utf-8",
                url:"${pageContext.request.contextPath}/servlet/LoadData",
                data:{"page":table,"id":id,"req":req},
                success:function (rs) {//String
                    printData_Connect(table,rs);
                }
            });
        }catch(err){
            alert('search'+err.message);
        }
    }

    //加载已选中的数据
    function loadChosen(id,table) {

        $.ajax({
            type:"post",
            dataType:"text",
            //contentType:"application/json;charset=utf-8",
            url:"${pageContext.request.contextPath}/servlet/LoadConnect",
            data:{"page":"album","id":id,"type":table},
            success:function (rs) {//String
                printData_Connect(table,rs,true);
            }
        });

    }


    //输出表格：不搜索被选中的结果
    function printData_Connect(table,rs,chosen) {
        try{
            var Data=JSON.parse(rs);
            var rowCnt=Data.length;

            //删除旧的
            var deleteCnt=$('#'+table+'Table tr:last').index()-chosenlast;
            //alert('delete:'+deleteCnt);
            for(var i=0;i<deleteCnt;++i){
                $('#'+table+'Table tr:last').remove();
            }

            for(var i=0;i<rowCnt;++i){//rowCnt 行数
                var rowData=Data[i];//data ：JSONArray

                if(inChosen('a',table,rowData['a']))continue;

                var newRow=$('#'+table+'RowTemp').clone();//复制模板行

                for(var key in rowData){
                    newRow.find("td:eq("+letter2Number[key]+")").find('p').append(rowData[key]);//更新到对应td
                }

                newRow.css('display','table-row');
                if(chosen==true)newRow.css('background','cornflowerblue');
                newRow.insertAfter("#"+table+"Table tr:last");
            }
        }catch(err){
            alert(err.message);
        }
    }

    /*
    //输出表格：预先搜索被选中的结果
    function printData_Chosen(table,rs){
        try{
            var Data=JSON.parse(rs);
            var rowCnt=Data.length;
            chosenlast=rowCnt+1;
            //alert('lastPage');
            //alert(rs);

            //删除旧的
            var deleteCnt=$('#'+table+'Table tr:last').index()-chosenlast;
            //alert('delete:'+deleteCnt);
            for(var i=0;i<deleteCnt;++i){
                $('#'+table+'Table tr:last').remove();
            }

            for(var i=0;i<rowCnt;++i){//rowCnt 行数
                var rowData=Data[i];//data ：JSONArray
                var newRow=$('#'+table+'RowTemp').clone();//复制模板行

                oldRows[rowData['a']]=true;

                for(var key in rowData){
                    newRow.find("td:eq("+letter2Number[key]+")").find('p').append(rowData[key]);//更新到对应td
                    //alert(rowData[key]);
                }

                newRow.css('display','table-row');
                newRow.css('background','cornflowerblue');

                newRow.find('input').val('删除');
                newRow.insertAfter("#"+table+"Table tr:last");

            }

            //alert(String(oldRows));
        }catch(err){
            alert(err.message);
        }
    }
     */

    //将被选中的行前置
    //取消选中的行放于末尾
    function move(button,page) {
        if($(button).val()=="添加"){
            $(button).val("删除");
            $(button).parent().parent().css('background','cornflowerblue');

            $(button).parent().parent().insertAfter('#'+page+'Table tr:eq('+chosenlast+')');
            chosenlast+=1;

        }else{
            $(button).val("添加");
            $(button).parent().parent().css('background','white');
            $(button).parent().parent().insertAfter('#'+page+'Table tr:last');
            chosenlast-=1;
        }
    }


    //保存更改
    function save(table,button) {
        var main=$('#main').attr("value");
        var len=chosenlast;
        //alert('len'+len);

        for(var i=2;i<=len;++i){
            var val=$('#'+table+"Table").find( "tr:eq("+i+")").find("td:eq(0)").find('p').text();
            newRows[val]=true;
            //alert(val);
        }


        //alert(page+table+JSON.stringify(pair));

        //检查变化
        //alert(JSON.stringify(oldRows));
        //alert(JSON.stringify(newRows));

        var addRows={};
        var tempRows={};

        //深度拷贝oldRows到tempRows
        for(var row in oldRows){
            tempRows[row]=true;
        }

        //与原有数据oldRows对比，
        for(var row in newRows){
            if(oldRows[row]==undefined){//新选中的数据加入addRows，预备被插入
                //增加
                addRows[row]=main;
                tempRows[row]=true;//加入新的
                //alert('new temp:'+JSON.stringify(tempRows));
                //alert('main:'+main+' val:'+pair[val]);
            }
            //一直在选的数据不需要处理
            else if(oldRows[row]==true){//本来就有的
                //alert('old:'+JSON.stringify(oldRows));
                delete(oldRows[row]);
                //alert('new:'+JSON.stringify(oldRows));
                //alert('save temp:'+JSON.stringify(tempRows));
            }
        }
        var deleteRows=oldRows;//剩余未选中的数据加入deleteRows，预备被删除
        for(var row in deleteRows){
            deleteRows[row]=main;
            delete(tempRows[row]);//去掉删除的
            //alert('delete temp:'+JSON.stringify(tempRows));
        }
        //alert('deleteRow:'+JSON.stringify(deleteRows));
        //alert('addRows:'+JSON.stringify(addRows));
        //alert(JSON.stringify(oldRows));
        //alert(JSON.stringify(newRows));

        var fin=null;
        var deleteStr=JSON.stringify(deleteRows);
        if(deleteStr!="{}"){
            $.ajax({
                type:"post",
                //contentType:"application/json;charset=utf-8",
                url:"${pageContext.request.contextPath}/servlet/AlterConnect",
                data:{"page":page,"table":table,"data":deleteStr,"type":"delete"},
                success:function (data) {//String
                }
            });
            fin=true;
        }

        var addStr=JSON.stringify(addRows);
        if(addStr!="{}"){
            $.ajax({
                type:"post",
                //contentType:"application/json;charset=utf-8",
                url:"${pageContext.request.contextPath}/servlet/AlterConnect",
                data:{"page":page,"table":table,"data":addStr,"type":"add"},
                success:function (data) {//String
                }
            });
            fin=true;
        }

        //复原两个全局变量，避免下次保存重复插入
        newRows={};
        //alert('newRows:'+JSON.stringify(newRows));
        oldRows=tempRows;
        //alert('oldRows:'+JSON.stringify(oldRows));

        //alert(fin);
        //提醒
        if(fin==null){
            $('#'+table+'Tips').text('无更改.');
            $('#'+table+'Tips').css('display','inline');
            setTimeout(function () {
                $('#'+table+'Tips').css('display','none');
            },3000);
        }
        else{
            //alert('#'+table+'Tips');
            $('#'+table+'Tips').text('已保存更改...');
            $('#'+table+'Tips').css('display','inline');
            setTimeout(function () {
                $('#'+table+'Tips').css('display','none');
            },3000);
        }
    }



</script>

当前:
<div>
    <span id="1" style="font-weight:bold">专辑</span><div id="main" style="display:inline;"  value="17">17</div><span id="info"></span><br/>
    <button onclick="switchTab('music','creator')">添加歌曲</button>
    <button onclick="switchTab('creator','music')">添加创作者</button>
</div>

<div style="display: none">
    <span id="2" style="font-weight:bold">创作者</span><br/>
    <button>添加歌曲</button>
    <button>添加专辑</button>
</div>



<br/>
    <div id="musicUI" style="display: block">
        <!--音乐-->
        <div style="font-size: 15px;font-weight:bold">音乐</div>
        id:<input type="text"><button onclick="search('a','music',$(this).prev().val(),this)">搜索</button> &nbsp;或&nbsp; 歌曲名:<input type="text"><button onclick="search('b','music','\''+$(this).prev().val()+'\'',this)">搜索</button>
        <button onclick="save('music',this)">保存</button><span id="musicTips"  style="color:darkred;display: none">(已保存更改...)</span>
        <table id='musicTable' value="0" style="text-align: center"	border="1px">
            <tr >
                <td>&nbspid&nbsp</td>
                <td>&nbsp曲名&nbsp</td>
                <td>&nbsp点击量&nbsp</td>
                <td>&nbsp简介&nbsp</td>
                <td>&nbsp首字母&nbsp</td>
                <td>&nbsp头像地址&nbsp</td>
                <td>&nbsp演唱者&nbsp</td>
                <td>&nbsp姓名&nbsp</td>
                <td>&nbsp曲作&nbsp</td>
                <td>&nbsp姓名&nbsp</td>
                <td>&nbsp词作&nbsp</td>
                <td>&nbsp姓名&nbsp</td>
                <td>&nbsp歌词地址&nbsp</td>
                <td>&nbsp歌词贡献者&nbsp</td>
                <td>&nbsp音轨地址&nbsp</td>
                <td>&nbsp伴奏地址&nbsp</td>
                <td>&nbsp视频地址&nbsp</td>
                <td></td>
            </tr>


            <tr id="musicRowTemp" style="display: none">
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td>
                    <input type="button" value="添加" onclick="move(this,'music')">
                </td>
            </tr>

        </table>
        <br/>
    </div>
</div>


<div id="creatorUI" style="display: none">
        <!--创作者-->
        <div style="font-size: 15px;font-weight:bold">创作者</div>
        id:<input type="text"><button onclick="search('a','creator',$(this).prev().val(),this)">搜索</button> &nbsp;或&nbsp; 名字:<input type="text"><button onclick="search('b','creator','\''+$(this).prev().val()+'\'',this)">搜索</button>
    <button onclick="save('creator',this)">保存</button><span id="creatorTips"  style="color:darkred;display: none">(已保存更改...)</span>
        <table id='creatorTable' value="0" style="text-align: center"	border="1px">
            <tr >
                <td>&nbspid&nbsp</td>
                <td>&nbsp姓名&nbsp</td>
                <td>&nbsp头像预览&nbsp</td>
                <td>&nbsp性别&nbsp</td>
                <td>&nbsp国别&nbsp</td>
                <td>&nbsp地区&nbsp</td>
                <td>&nbsp点击量&nbsp</td>
                <td>&nbsp简介&nbsp</td>
                <td>&nbsp首字母&nbsp</td>
                <td></td>
            </tr>

            <tr id="creatorRowTemp" style="display: none">
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)"><p style="display: inline"></p></td>
                <td>
                    <input type="button" value="添加" onclick="move(this,'creator')">
                </td>
            </tr>A

        </table>
        <br/>
    </div>
</div>




</body>
</html>

