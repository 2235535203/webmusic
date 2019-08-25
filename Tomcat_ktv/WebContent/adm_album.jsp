<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/23
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
    <title>管理员页面</title>
    <link href="css/upload.css" rel='stylesheet' type='text/css' />

</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/adm_function.js"></script>
<body >
<%
    int onepage=10;
%>
<script>
    var cnt=<%=onepage%>;

    //检查多条录入中 是否有必选空未填
    function KeyWordNotNull(index){
        try{
            var jsonArr=$('#form'+index).serializeArray();
            var err="";

            if(jsonArr[0].value==""){
                err+="[专辑名]";
            }
            if(jsonArr[2].value==""){
                err+="[发售日]";
            }
            if(jsonArr[3].value==""){
                err+="[首字母]";
            }
            if(err=="")return true;

            index+=1;
            alert("第"+index+"段信息的"+err+"不能为空");
            return false;
        }
        catch(err){
            alert(err.message);
        }
    }

    function uploadMulti() {
        try{
            var record="";
            for (var i = 0; i < cnt; ++i) {
                if(KeyWordNotNull(i)){
                    record += recordInfo('form'+i);
                    $('#form'+i).ajaxSubmit(function (message) {
                        console.log(message);
                    });
                    document.getElementById('form'+i).reset();
                }
            }
            if (record != "")
                $("#result").html("just added records:\n" + record);
        }
        catch(err){
            alert(err.message);
        }
    }


</script>



权限 当前:<span style="font-weight:bold">增</span>
<input type="button" value="增">
<input type="button" value="查/删/改" onclick="window.location='adm_revise.jsp'">
<br/>
<div style="font-size:25px">向乐库导入信息 当前:<span style="font-weight:bold">专辑</span></div>

<input type="button" value="歌曲" onclick='window.location="adm_music.jsp"'>
<input type="button" value="创作者" onclick='window.location="adm_creator.jsp"'>
<input type="button" value="专辑">
</div>

<br/><br/>
<input type="button" value="单条信息导入" onclick="visiSingleInfoInput()">
<input type="button" value="批量信息导入" onclick="visiMutiInfoInput()">

<div id="SingleInfoInput">
    <h3>
        单条信息导入
    </h3>
    <p>注意：如果信息只有专辑名，且与库内信息相同，则服务器将视信息为冗余，过滤</p>

    <form id="singleAlbumForm" action="${pageContext.request.contextPath}/servlet/UploadAlbum" method="post" onsubmit="return uploadSingle('singleAlbumForm')">
        专辑名<span style="color: red">*</span>:<input type="text" name="alb_name" required>
        简介(可选):<input type="text" name="remark"><br/>
        发售日<span style="color: red">*</span>:<input type="text" name="releaseDate" required>
        首字母<span style="color: red">*</span>:<input type="text" name="firstchar" required><br/>
        主创id(可选):<input type="text" name="leader_id">
        主创姓名(可选):<input type="text" name="leader_name"><br/>
        <div class="kuang">
            封面地址(可选):<input type="file" name="cover" id="coverfileToUpload" onchange="fileSelected('cover')">
            <div class="preview">
            </div>
            <div class="uploadMsg"><span style="font-weight:bold">filename:</span><div id="coverfilename"></div><br/>
                <span style="font-weight:bold">fileSize:</span><div id="coverfilesize" ></div><br/>
                <span style="font-weight:bold">location:</span><div id="coverfiletype" ></div><br/>
            </div>
        </div>
        <br/>
        <input type="submit" value="提交" >
        <input type="reset" value="清空">
    </form>

</div>

<div id="MultiInfoInput" style="display: none">

    <p>
        批量信息导入
    </p>

    <ol >
    <%
        for(int i=0;i<onepage;++i){
    %>
        <li >
            <form id="form<%=i%>" action="${pageContext.request.contextPath}/servlet/UploadAlbum" method="post" onsubmit="return uploadSingle('form<%=i%>')">
                专辑名<span style="color: red">*</span>:<input type="text" name="alb_name" required><br/>
                简介(可选):<input type="text" name="remark"><br/>
                发售日<span style="color: red">*</span>:<input type="text" name="releaseDate" required><br/>
                首字母<span style="color: red">*</span>:<input type="text" name="firstchar" required><br/>
                主创id(可选):<input type="text" name="leader_id"><br/>
                主创姓名(可选):<input type="text" name="leader_name"><br/>
                封面地址(可选):<input type="file" name="cover"><br/>
                <input type="submit" value="提交" >
                <input type="reset" value="清空">
            </form>

        </li>
    <%} %>
    </ol>
    <input type="button" value="全部提交" onclick="uploadMulti()">
    <input type="button" value="全部清空" onclick="clearInfo(<%=onepage%>)">
</div>

<div id="result" ></div>


</body>
</html>

