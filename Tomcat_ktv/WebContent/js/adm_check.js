


//状态是否可修改
function reviseCheck(checkbox,page,last) {
    if(checkbox.checked==true)
    {
        alert("已选中修订状态：当前页面可做更改");
        $('#'+page+'Table tr').find('td:eq('+last+')').show();
    }
    else{
        $('#'+page+'Table tr').find('td:eq('+last+')').hide();
    }
}

function tableSelect(select) {
    return select.option;
}

function trim(str){
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

//更改行
function reviseRow(button,cnt) {
    try{
        var tr=$(button).parent().parent();
       // alert(String(tr.index()));
        if(button.value=="更改"){
            //alert("改");
            for(var i=1;i<=cnt;++i){
                var td=$(tr).find('td:eq('+i+')');
                var p=$(td).find('p');
                $(p).attr("contentEditable",true);

                //alert($(p).find('span').attr('contentEditable'));
                td.val(p.text());
                //alert(td.val());
               //alert(p.text());

            }
            button.value="确认";
        }
        else {
            //alert("确认");
            var data = {};
            for (var i = 1; i <= cnt; ++i) {
                var td = $(tr).find('td:eq(' + i + ')');
                var p = $(td).find('p');
                $(p).attr("contentEditable", false);

                //alert('old:'+td.val());
                //alert('new:'+p.text());
                if (td.val() != p.text()) {//发生变化
                    //另外保存到data
                    //alert('change');
                    data[number2Letter[i]] = p.text();
                    td.val(p.text());

                }
            }
            button.value = "更改";


            if (data != undefined) {
                //更新到rs
                var rs = window.sessionStorage.getItem(lastPage);
                var DATA = JSON.parse(rs);

                var site = $(button).parent().parent().index() - 2;
                //alert('site:'+site);
                var index = PageIndex[lastPage] * onePage - onePage + site;
                //alert('index:'+index);


                for (var key in data) {
                    DATA[index][key] = data[key];//'a''b'
                    //alert('key:'+key+' val:'+data[key]);
                }
                window.sessionStorage.setItem(lastPage, JSON.stringify(DATA));

                //data保存到session
                var id = DATA[index]['a'];
                var revise = JSON.parse(window.sessionStorage.getItem("revise"));
                if (revise[lastPage] == undefined) {
                    revise[lastPage] = {};
                    //alert('pageDataEmpty');
                }

                if (revise[lastPage][id] == undefined) {
                    revise[lastPage][id] = {};
                    //alert('rowDataEmpty');
                }

                for (var td in data) {
                    revise[lastPage][id][td] = data[td];
                    //alert(data[td]);
                    //alert('reviese:'+revise[lastPage][id][td]);
                }
                window.sessionStorage.setItem("revise", JSON.stringify(revise));
            }
        }
    }catch(err){
        alert('err:'+err.message);
    }
}

/*
//删除行
function deleteRow(rowId,cnt) {
    //可积累
    document.getElementById('drawbacked').innerHTML=formTableRow(rowId,cnt);
    document.getElementById('drawback').style="display:inline;color:dodgerblue;text-decoration: underline;";
    document.getElementById('order').value=rowId;

    document.getElementById(rowId).style="display:none";

    document.getElementById('timer').value=setTimeout(function () {
        drawbackOverdue(rowId);
    },1000);
}
 */

//格式化撤回内容
function formTableRow(rowId,cnt){
    var str="";
    var pre=rowId+'_';
    for(var i=1;i<=cnt;++i){
        str=str+document.getElementById(pre+i).innerHTML+';';
    }
    return str;
}

//撤回
function drawback(msgId){
    //恢复并添加到原位置
    document.getElementById(document.getElementById('order').value).style="display:table-row";

    document.getElementById('drawbacked').innerHTML="";
    document.getElementById('drawback').style="display:none";
    document.getElementById('order').value='';
    clearTimeout(Number(document.getElementById('timer').value));
}

//移去历史页
function drawbackOverdue(rowId){

    document.getElementById('drawbacked').style="display:none";
    document.getElementById('drawback').style="display:none";

    document.getElementById(rowId).style="display:table-row";
    document.getElementById(rowId+'history').style="display:inline"
    document.getElementById(rowId+'revise').style="display:none"

    var orgo=document.getElementById(rowId).rowIndex;
    //alert(orgo);
    //var orgo=parseInt(rowId.replace(/[^0-9]/ig,""));
    var row=$('#historyTable tr:last');
    $('#billboardTable tr:eq('+orgo+')').clone().insertAfter(row);


    document.getElementById('billboardTable').deleteRow(orgo);
}


//历史页

function recoverRow(rowId) {
    document.getElementById(rowId+'history').style="display:none"
    document.getElementById(rowId+'revise').style="display:inline"

    var orgo=document.getElementById(rowId).rowIndex;
    //alert(orgo);
    var row=$('#resultTable tr:last');
    $('#historyTable tr:eq('+orgo+')').clone().insertAfter(row);

    document.getElementById('historyTable').deleteRow(orgo);
}


//通用

function fold(pNo){
    pNo.style.whiteSpace="nowrap";
}

function unfold(pNo){
    pNo.style.whiteSpace="pre-line";
    setTimeout(function () {
        /*
        if(mouseInEle(pNo))
            unfold(pNo);
        else{
            fold(pNo);
        }
         */
        fold(pNo);
    },2000);
}

//切换页

function switchUI(btn) {
    if(btn.value=="历史记录"){
        //alert('resultTable:'+parseInt(document.getElementById('resultTable').rows.length));
        btn.value="删/查/改";
        document.getElementById('reviseSwitch').style='display:none';
        document.getElementById('historyUI').style='display:inline';
        document.getElementById('reviseUI').style='display:none';
    }
    else{
        //alert('historyUI:'+parseInt(document.getElementById('historyTable').rows.length));
        btn.value="历史记录";
        document.getElementById('reviseSwitch').style='display:inline-block';
        document.getElementById('reviseUI').style='display:inline';
        document.getElementById('historyUI').style='display:none';
    }
}


/*
function mouseInEle(ele) {
	var e=event;
	var rect=ele.getBoundingClientRect();
	if(e.clientX>=rect.left&&e.clientX<=rect.right&&e.clientY>=rect.top&&e.clientY<=rect.bottom)
		return true;
	return false;
}
 */


function jumpDetail(type,id) {
    switch(type){
        case '创作人':;//个人信息
        case '歌曲':;//歌曲信息
        case '音乐作品':;//makemusic,makealbum
        case '专辑创作者':;//makealbum
        case '专辑歌曲':;//makealbum

    }
}