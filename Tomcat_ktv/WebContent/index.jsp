<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/20
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  hello,你已经到岸啦！

  <%

    int cnt=3;
    String name[]={"","饮冰十年，难凉热血","浪子回头金不换","解雨臣"};
    String editor[]={"","关你毛事根","工资600的小王","官方"};
    int view[]={0,999999,6,998};
    String mark[]={"","欢迎回家","欢迎回家",""};
    for(int i=1;i<=cnt;++i){

  %>
  <tr id="billboardRow<%=i%>">
    <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="billboardRow<%=i%>_0"><%="00"+i%></p></td>
    <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="billboardRow<%=i%>_1"><%=name[i]%></p></td>
    <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="billboardRow<%=i%>_2"><%=editor[i]%></p></td>
    <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="billboardRow<%=i%>_3"><%=view[i]%></p></td>
    <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="billboardRow<%=i%>_4"><%=mark[i]%></p></td>
    <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="billboardRow<%=i%>_5"><span style="color:lightcoral;text-decoration: underline;">跳转</span></p></td>
    <td>
      <div id="billboardRow<%=i%>revise">
        <input type="button" value="删除" onclick="deleteRow('billboardRow<%=i%>',editableItem['billboard'])">
        <input id="billboardRow<%=i%>_revise" type="button" value="更改" onclick="reviseRow(this,'billboardRow<%=i%>',editableItem['billboard'])">
      </div>
      <input id="billboardRow<%=i%>history" type="button" value="恢复" onclick="recoverRow('billboardRow<%=i%>',editableItem['billboard'])" style="display: none"></td>
  </tr>
  <%}%>



  <!--管理员-->
  <div id="adminUI" style="display: none">
    <div style="font-size: 15px;font-weight:bold">管理员</div>
    <table id='adminTable' value="0" style="text-align: center"	border="1px">
      <tr id="adminRow0" >
        <td><div id="adminRow0_0">admid</div><input type="text" style="width:80px"><button>搜索</button><br/><select><option>从低到高</option><option>从高到低</option></select><button>确认</button></td>
        <td><div id="adminRow0_1">账号</div><input type="text" style="width:50px"><button>搜索</button><br/><select><option>字典正序</option><option>字典倒序</option></select><button>确认</button></td>
        <td><div id="adminRow0_2">手机号</div><input type="text" style="width:50px"><button>搜索</button></td>
        <td><div id="adminRow0_3">密码</div><input type="text" style="width:50px"><button>搜索</button></td>
        <td><div id="adminRow0_4">操作记录</div><input type="text" style="width:50px"><button>搜索</button></td>
        <td></td>
      </tr>

      <%
        String acc[]={"","张家人","吴家人"};
        int phone[]={0,1111,555555};
        int password[]={0,123,321};
        String record[]={"","2019-8-13 注册\n2019-8-14 登录","2019-8-13 注册\n2019-8-14 登录"};
        int admcnt=2;
        for(int i=1;i<=admcnt;++i){%>

      <tr id="adminRow<%=i%>">
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="adminRow<%=i%>_0"><%="00"+i%></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="adminRow<%=i%>_1"><%=acc[i]%></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="adminRow<%=i%>_2"><%=phone[i]%></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="adminRow<%=i%>_3"><%=password[i]%></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="adminRow<%=i%>_4"><%=record[i]%></p></td>
        <td>
          <div id="adminRow<%=i%>revise">
            <input type="button" value="删除" onclick="deleteRow('adminRow<%=i%>',editableItem['admin'])">
            <input id="adminRow<%=i%>_revise" type="button" value="更改" onclick="reviseRow(this,'adminRow<%=i%>',editableItem['admin'])">
          </div>
          <input id="adminRow<%=i%>history" type="button" value="恢复" onclick="recoverRow('adminRow<%=i%>',editableItem['admin'])" style="display: none"></td>
      </tr>

      <%}%>

    </table>
    <br/>
  </div>








  <!--账户-->
  <div id="accountUI" style="display: none">
    <div style="font-size: 15px;font-weight:bold">账户</div>
    <table id='accountTable' value="0" style="text-align: center"	border="1px">
      <tr id="accountRow0" >
        <td><div id="accountRow0_0">uid</div><input type="text" style="width:80px"><button>搜索</button><br/><select><option>从低到高</option><option>从高到低</option></select><button>确认</button></td>
        <td><div id="accountRow0_1">昵称</div><input type="text" style="width:50px"><button>搜索</button><br/><select><option>字典正序</option><option>字典倒序</option></select><button>确认</button></td>
        <td><div id="accountRow0_2">邮箱</div><input type="text" style="width:50px"><button>搜索</button></td>
        <td><div id="accountRow0_3">微信</div><input type="text" style="width:50px"><button>搜索</button></td>
        <td><div id="accountRow0_4">qq</div><input type="text" style="width:50px"><button>搜索</button></td>
        <td><div id="accountRow0_5">手机号</div><input type="text" style="width:50px"><button>搜索</button></td>
        <td><div id="accountRow0_6">密码</div><input type="text" style="width:50px"><button>搜索</button></td>
        <td><div id="accountRow0_7">头像</div></td>
        <td><div id="accountRow0_8">简介</div><input type="text" style="width:50px"><button>搜索</button></td>
        <td><div id="accountRow0_9">歌单页</div></td>
        <td></td>
      </tr>

      <%
        String accname[]={"","苏万","三叔"};
        int acccnt=2;
        for(int i=1;i<=acccnt;++i){
      %>
      <tr id="accountRow<%=i%>">
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="accountRow<%=i%>_0"><%="00"+i%>></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="accountRow<%=i%>_1"><%=accname[i]%></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="accountRow<%=i%>_2"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="accountRow<%=i%>_3"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="accountRow<%=i%>_4"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="accountRow<%=i%>_5"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="accountRow<%=i%>_6"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="accountRow<%=i%>_7"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="accountRow<%=i%>_8"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="accountRow<%=i%>_9"></p></td>
        <td>
          <div id="accountRow<%=i%>revise">
            <input type="button" value="删除" onclick="deleteRow('accountRow<%=i%>',editableItem['account'])">
            <input id="accountRow<%=i%>_revise" type="button" value="更改" onclick="reviseRow(this,'accountRow<%=i%>',editableItem['account'])">
          </div>
          <input id="accountRow<%=i%>history" type="button" value="恢复" onclick="recoverRow('accountRow<%=i%>',editableItem['account'])" style="display: none"></td>
      </tr>

      <%}%>

    </table>
    <br/>
  </div>



  <div id="albumUI" style="display: none">
    <!--专辑/live-->
    <div style="font-size: 15px;font-weight:bold">专辑/live</div>
    <table id='albumTable' value="0" style="text-align: center"	border="1px">
      <tr id="albumRow0" >
        <td><div id="albumRow0_0">aid</div><input type="text" style="width:80px"><button>搜索</button><br/><select><option>从低到高</option><option>从高到低</option></select><button>确认</button></td>
        <td><div id="albumRow0_1">专辑名</div><input type="text" style="width:50px"><button>搜索</button><br/><select><option>字典正序</option><option>字典倒序</option></select><button>确认</button></td>
        <td><div id="albumRow0_2">出版者</div><input type="text" style="width:50px"><button>搜索</button><br/><select><option>字典正序</option><option>字典倒序</option></select><button>确认</button></td>
        <td><div id="albumRow0_3">简介</div><input type="text" style="width:80px"><button>搜索</button></td>
        <td><div id="albumRow0_4">头像</div></td>
        <td><div id="albumRow0_5">点击量</div><input type="text" style="width:30px"><button>搜索</button><br/><select><option>从高到低</option><option>从低到高</option></select><button>确认</button></td>
        <td><div id="albumRow0_6">参与创作页</div></td>
        <td><div id="albumRow0_7">歌曲页</div></td>
        <td></td>
      </tr>

      <%
        int acnt=5;
        for(int i=1;i<=acnt;i++){
      %>
      <tr id="albumRow<%=i%>">
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="albumRow<%=i%>_0"><%="00"+i%></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="albumRow<%=i%>_1"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="albumRow<%=i%>_2">南派三叔 <span style="color:dimgray;text-decoration: underline;">cid</span></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="albumRow<%=i%>_3"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="albumRow<%=i%>_4"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="albumRow<%=i%>_5"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="albumRow<%=i%>_6"><span style="color:lightcoral;text-decoration: underline;">跳转</span></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="albumRow<%=i%>_7"><span style="color:lightcoral;text-decoration: underline;">跳转</span></p></td>
        <td>
          <div id="albumRow<%=i%>revise">
            <input type="button" value="删除" onclick="deleteRow('albumRow<%=i%>',editableItem['album'])">
            <input id="albumRow<%=i%>_revise" type="button" value="更改" onclick="reviseRow(this,'albumRow<%=i%>',editableItem['album'])">
          </div>
          <input id="albumRow<%=i%>history" type="button" value="恢复" onclick="recoverRow('albumRow<%=i%>',editableItem['album'])" style="display: none"></td>
      </tr>
      <%
        }
      %>

    </table>
    <br/>
  </div>


  <div id="musicUI" style="display: none">
    <!--音乐-->
    <div style="font-size: 15px;font-weight:bold">音乐</div>
    <table id='musicTable' value="0" style="text-align: center"	border="1px">
      <tr id="musicRow0" >
        <td><div id="musicRow0_0">mid</div><input type="text" style="width:80px"><button>搜索</button><br/><select><option>从低到高</option><option>从高到低</option></select><button>确认</button></td>
        <td><div id="musicRow0_1">曲名</div><input type="text" style="width:50px"><button>搜索</button><br/><select><option>字典正序</option><option>字典倒序</option></select><button>确认</button></td>
        <td><div id="musicRow0_2">演唱者 cid</div><input type="text" style="width:50px"><button>搜索</button><br/><select><option>字典正序</option><option>字典倒序</option></select><button>确认</button></td>
        <td><div id="musicRow0_3">词作 cid</div><input type="text" style="width:50px"><button>搜索</button><br/><select><option>字典正序</option><option>字典倒序</option></select><button>确认</button></td>
        <td><div id="musicRow0_4">曲作 cid</div><input type="text" style="width:50px"><button>搜索</button><br/><select><option>字典正序</option><option>字典倒序</option></select><button>确认</button></td>
        <td><div id="musicRow0_5">简介</div><input type="text" style="width:80px"><button>搜索</button></td>
        <td><div id="musicRow0_6">头像</div></td>
        <td><div id="musicRow0_7">点击量</div><input type="text" style="width:30px"><button>搜索</button><br/><select><option>从高到低</option><option>从低到高</option></select><button>确认</button></td>
        <td><div id="musicRow0_8">歌词地址</div></td>
        <td><div id="musicRow0_9">音轨地址</div></td>
        <td><div id="musicRow0_10">伴奏地址</div></td>
        <td><div id="musicRow0_11">视频地址</div></td>
        <td></td>
      </tr>

      <%
        int mcnt=5;
        for(int i=1;i<mcnt;++i){
      %>
      <tr id="musicRow1">
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_0"><%="00"+i%></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_1"></p></td>
        <td><p style="display:inline;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_2"><span style="color:cornflowerblue;text-decoration: underline;"></span></p> 黎簇</td>
        <td><p style="display:inline;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_3"><span style="color:cornflowerblue;text-decoration: underline;"></span></p> 黎簇</td>
        <td><p style="display:inline;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_4"><span style="color:cornflowerblue;text-decoration: underline;"></span></p> 黎簇</td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_5">沙海推广曲</p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_6"></p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_7">771</p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_8">……</p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_9">……</p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_10">……</p></td>
        <td><p style="overflow: hidden;text-overflow: ellipsis;white-space:nowrap;" onclick="unfold(this)" id="musicRow<%=i%>_11">……</p></td>
        <td>
          <div id="musicRow<%=i%>revise">
            <input type="button" value="删除" onclick="deleteRow('musicRow<%=i%>',editableItem['music'])">
            <input id="musicRow<%=i%>_revise" type="button" value="更改" onclick="reviseRow(this,'musicRow<%=i%>',editableItem['music'])">
          </div>
          <input id="musicRow<%=i%>history" type="button" value="恢复" onclick="recoverRow('musicRow<%=i%>',editableItem['music'])" style="display: none"></td>
      </tr>

      <%}%>

    </table>
    <br/>
  </div>
  </body>
</html>
