<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/23
  Time: 10:24
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/adm_function.js"></script>
<body >
<%
    int onepage=10;
%>


<script>
    var cnt=<%=onepage%>;

    function KeyWordNotNull(index){
        try{
            var jsonArr=$('#form'+index).serializeArray();
            var err="";

            if(jsonArr[0].value==""){
                err+="[歌曲名]";
            }
            if(jsonArr[8].value==""){
                err+="[首字母]";
            }
            if(jsonArr[9].value==""){
                err+="[音轨地址]";
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
<div style="font-size:25px">向乐库导入信息 当前:<span style="font-weight:bold">歌曲</span></div>

<input type="button" value="歌曲" >
<input type="button" value="创作者" onclick='window.location="adm_creator.jsp"'>
<input type="button" value="专辑" onclick='window.location="adm_album.jsp"'>
</div>

<br/><br/>
<input type="button" value="单条信息导入" onclick="visiSingleInfoInput()">
<input type="button" value="批量信息导入" onclick="visiMutiInfoInput()">
<br/><br/>

<div id="SingleInfoInput">

    <p>
        单条信息导入
    </p>

    <form id="singleMusicForm"  action="${pageContext.request.contextPath}/servlet/UploadMusic" method="post" enctype="multipart/form-data" onsubmit="return uploadSingle('singleMusicForm')">
        歌曲名<span style="color: red">*</span>:<input type="text" name="m_name" required><br/>
        歌手id(可选):<input type="text" name="c_id"><br/>
        歌手姓名(可选):<input type="text" name="singer_name"><br/>
        作词人id(可选):<input type="text" name="lyricist_id"><br/>
        作词人姓名(可选):<input type="text" name="lyricist_name"><br/>
        作曲人id(可选):<input type="text" name="arrangement_id"><br/>
        作曲人姓名(可选):<input type="text" name="composer_name"><br/>
        简介(可选):<input type="text" name="remark"><br/>
        首字母<span style="color: red">*</span>:<input type="text" name="firstchar" required>
        <br/>

        <div class="kuang">
            音轨文件地址(可选):<span style="color: red">*</span>:<input type="file" name="audio_location" accept="audio/*" id="musicfileToUpload" onchange="fileSelected('music')">
            <div class="preview">
            </div>
            <div class="uploadMsg"><span style="font-weight:bold">filename:</span><div id="musicfilename"></div><br/>
                <span style="font-weight:bold">fileSize:</span><div id="musicfilesize" ></div><br/>
                <span style="font-weight:bold">type:</span><div id="musicfiletype" ></div><br/>
            </div>
        </div>


        <div class="kuang">
            伴奏文件地址(可选):<input type="file" name="acmp_location" accept="audio/*" id="acmpfileToUpload" onchange="fileSelected('acmp')">
            <div class="preview">
            </div>
            <div class="uploadMsg"><span style="font-weight:bold">filename:</span><div id="acmpfilename"></div><br/>
                <span style="font-weight:bold">fileSize:</span><div id="acmpfilesize" ></div><br/>
                <span style="font-weight:bold">location:</span><div id="acmpfiletype" ></div><br/>
            </div>
        </div>
        <br/>

        <div class="kuang">
            歌词文件地址(可选):<input type="file" name="lrc_location" accept=".lrc" id="lrcfileToUpload" onchange="fileSelected('lrc')">
            <div class="preview">
            </div>
            <div class="uploadMsg"><span style="font-weight:bold">filename:</span><div id="lrcfilename"></div><br/>
                <span style="font-weight:bold">fileSize:</span><div id="lrcfilesize" ></div><br/>
                <span style="font-weight:bold">location:</span><div id="lrcfiletype" ></div><br/>
            </div>
        </div>
        歌词贡献者姓名(可选):<input type="text" name="contributor">
        <br/>
        <div class="kuang">
            封面地址(可选):<input type="file" name="picture" id="coverfileToUpload" accept="image/jpeg,image/png" onchange="fileSelected('cover')">
            <div class="preview">
            </div>
            <div class="uploadMsg"><span style="font-weight:bold">filename:</span><div id="coverfilename"></div><br/>
                <span style="font-weight:bold">fileSize:</span><div id="coverfilesize" ></div><br/>
                <span style="font-weight:bold">location:</span><div id="coverfiletype" ></div><br/>
            </div>
        </div>


        <div class="kuang">
            视频文件地址(可选):<input type="file" name="video_location" id="videofileToUpload" accept="video/*" onchange="fileSelected('video')">
            <div class="preview">
            </div>
            <div class="uploadMsg"><span style="font-weight:bold">filename:</span><div id="videofilename"></div><br/>
                <span style="font-weight:bold">fileSize:</span><div id="videofilesize" ></div><br/>
                <span style="font-weight:bold">fileType:</span><div id="videofiletype" ></div><br/>
            </div>
        </div>
        <br/>
        <input type="submit" value="提交">
        <input type="reset" value="清空">
    </form>

</div>

<div id="MultiInfoInput" style="display: none">

    <p>
        批量信息导入
    </p>

    </li>

    <ol >
        <%
            for(int i=0;i<onepage;++i){
        %>
        <li>
            <form id="form<%=i%>"  action="${pageContext.request.contextPath}/servlet/UploadMusic" method="post" enctype="multipart/form-data" onsubmit="return uploadSingle('form<%=i%>')">
                歌曲名<span style="color: red">*</span>:<input type="text" name="m_name" required><br/>
                歌手id(可选):<input type="text" name="c_id"><br/>
                歌手姓名(可选):<input type="text" name="singer_name"><br/>
                作词人id(可选):<input type="text" name="lyricist_id"><br/>
                作词人姓名(可选):<input type="text" name="lyricist_name"><br/>
                作曲人id(可选):<input type="text" name="arrangement_id"><br/>
                作曲人姓名(可选):<input type="text" name="composer_name"><br/>
                简介(可选):<input type="text" name="remark"><br/>
                首字母<span style="color: red">*</span>:<input type="text" name="firstchar" required><br/>
                音轨文件地址(可选):<span style="color: red">*</span>:<input type="file" name="audio_location" accept="audio/*" onchange="fileSelected('music')"><br/>
                伴奏文件地址(可选):<input type="file" name="acmp_location" accept="audio/*" onchange="fileSelected('acmp')"><br/>
                歌词文件地址(可选):<input type="file" name="lrc_location" accept=".lrc" onchange="fileSelected('lrc')"><br/>
                歌词贡献者姓名(可选):<input type="text" name="contributor"><br/>
                封面地址(可选):<input type="file" name="picture" accept="image/jpeg,image/png" onchange="fileSelected('cover')"><br/>
                视频文件地址(可选):<input type="file" name="video_location" accept="video/*" onchange="fileSelected('video')"><br/>
                <input type="submit" value="提交">
                <input type="reset" value="清空">
            </form>

        </li>
        <%} %>
    </ol>
    <input type="button" value="全部提交" onclick="uploadMulti()">
    <input type="button" value="全部清空" onclick="clearInfo(<%=onepage%>)">

</div>

<div id="result" >
</div>

</body>
</html>

