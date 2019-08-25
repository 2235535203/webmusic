/*------------------------------v-----------------------------------*/

function fileSelected(str){
    var file=document.getElementById(str+'fileToUpload').files[0];
    if(file){
        var fileSize=0;
        if(file.size>1024*1024)fileSize=(Math.round(file.size*100/(1024*1024))/100).toString()+'MB';
        else fileSize= (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';

        document.getElementById(str+'filename').innerHTML=file.name;
        document.getElementById(str+'filesize').innerHTML =fileSize;
        document.getElementById(str+'filetype').innerHTML =file.type;

    }
}

function visiSingleInfoInput() {
    document.getElementById("SingleInfoInput").style.display="block";
    document.getElementById("MultiInfoInput").style.display="none";
}

function visiMutiInfoInput() {
    document.getElementById("SingleInfoInput").style.display="none";
    document.getElementById("MultiInfoInput").style.display="block";
}

/*-----------------------------------------------------------------------*/

function origin(type){
    var jsonNullArr=[];
    window.sessionStorage.setItem(type,JSON.stringify(jsonNullArr));

}



function sendToServer(type) {
    var jsonArrStr = window.sessionStorage.getItem(type);

    var form = document.createElement("form")
    form.target = "_self";
    form.action = "adm_" + type + "Servlet";
    form.encoding = "utf-8";
    form.method = "post";

    var textValue = document.createElement("textarea");
    text.name = type;
    text.value = jsonArrStr;

    var textType = document.createElement("textarea");
    text.name = "type";
    text.value = type;

    form.appendChild(textValue);
    form.appendChild(textType);

    document.body.appendChild(form);
    form.submit();
}

function end(type) {
    $("#result").html("session to back-end");

    sendToServer(type);
}


/*------------------------------v-----------------------------------*/


function clearInfo(cnt) {
    for(var i=0;i<cnt;++i)
        document.getElementById("form"+i).reset();
}


function recordInfo(form){
    //检查是否有空
    var formData=$("#"+form).serializeArray();
    var jsonStr=transFormToJson(formData);//{"":"","":""}
    return jsonStr;

    //var jsonArrStr=window.sessionStorage.getItem(type);//[{},{}]
    //var jsonArray=JSON.parse(jsonArrStr);

    //jsonArray.push(jsonStr);

    //window.sessionStorage.setItem(type,JSON.stringify(jsonArray));
}

function transFormToJson(formData){
    var obj={};
    for(var i in formData){
        obj[formData[i].name]=formData[i].value;

    }
    var jsonStr=JSON.stringify(obj);//obj 2 json string
    return jsonStr;
}



function uploadAlbum(form,type) {
    var record = recordInfo(form);
    $('#' + form).ajaxSubmit(function (message) {
        console.log(message);
    });
    document.getElementById(form).reset();

    $("#result").html("just added records:\n" + record);

    return false;
}
