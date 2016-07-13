function goURL(url, mainMenuText, mainMenu, subMenu) {
	location.href = url + "?mainMenuText=" + mainMenuText + "&mainMenu=" + mainMenu + "&subMenu=" + subMenu;
}

function countRow(countURL, sendData) {
	var totalRow;
	
	$.ajax({
    	type : "POST",
    	async : false,
        url : countURL,
        data : sendData,
        dataType : "html",
        success : function(data) {
            eval("var resultData = " + data);
            totalRow = resultData.totalRow;
        },
        error : function(xhr, textStatus) {
        	totalRow = -1;
        }
    });
	
	return totalRow;
}

function formSubmit(formId, method, actionURL, target) {
	var formObj = $("#" + formId);
	formObj.attr("action", actionURL);
	formObj.attr("method", method);
	formObj.attr("target", target);
	formObj.submit();
	formObj.attr("target", "");
}

$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [o[this.name]];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});

	return o;
};

function subCodeListByValueForSelectBox(codValue, selectBoxID) {
	var param = "pCodValue=" + codValue;
	$.ajax({
    	type : "post",
    	async : false,
    	url : "/admin/portal/code/sub_list_value_data.do",
    	dataType : "html",
    	data : param,
    	success : function(data) {
    	   eval("var resultData = " + data);
    	   var osTypeCodeList = resultData.DATA; 
    	   for(var i = 0; osTypeCodeList.length > i; i++) {
        	   $("<option/>").attr("value", osTypeCodeList[i].codOid).text(osTypeCodeList[i].codName).appendTo("#" + selectBoxID);
    	   }
        }
    });
}

function subCodeListByCodeForSelectBox(codValue, selectBoxID) {
	var param = "pCodValue=" + codValue;
	$.ajax({
    	type : "post",
    	async : false,
    	url : "/admin/portal/code/sub_list_value_data.do",
    	dataType : "html",
    	data : param,
    	success : function(data) {
    	   eval("var resultData = " + data);
    	   var osTypeCodeList = resultData.DATA; 
    	   for(var i = 0; osTypeCodeList.length > i; i++) {
        	   $("<option/>").attr("value", osTypeCodeList[i].codValue).text(osTypeCodeList[i].codName).appendTo("#" + selectBoxID);
    	   }
        }
    });
}

function subCodeListByOidForSelectBox(codOid, selectBoxID) {
	var param = "pCodOid=" + codOid;
	
	$.ajax({
    	type : "post",
    	async : false,
    	url : "/admin/portal/code/sub_list_oid_data.do",
    	dataType : "html",
    	data : param,
    	success : function(data) {
    	   eval("var resultData = " + data);
    	   var osTypeCodeList = resultData.DATA; 
    	   for(var i = 0; osTypeCodeList.length > i; i++) {
        	   $("<option/>").attr("value", osTypeCodeList[i].codOid).text(osTypeCodeList[i].codName).appendTo("#" + selectBoxID);
    	   }
        }
    });
}

function setContent(contentURL, sendData, areaId) {
	$("#" + areaId)[0].innerHTML = "";
    
	$.ajax({
        type : "post",
        url : contentURL,
        dataType : "html",
        data : sendData,
        success : function(data) {
            $("#" + areaId)[0].innerHTML = data;
        },
        error : function(xhr, textStatus) {
            
        }
    });
}

// VCenter 모든 목록 호출 (value 가 vcenter name 임)
function setVCenterList(selectboxId){
	var param = "";
    $.ajax({
        type : "post",
        async : false,
        url : "/admin/system/construct/vcenter_list_json_data.do",
        dataType : "html",
        data : param,
        success : function(data) {
            var result = eval("("+data+")");
            $("#"+selectboxId).append("<option value=''>-선택-</option>");
            for(var i=0; i<result.length;i++){
            	$("#"+selectboxId).append("<option value="+result[i].vcenterName+">"+result[i].vcenterName+"</option>");
            }
            
        },
        error : function(xhr, textStatus) {
        }
    });
} 


//VCenter 모든 목록 호출 (value 가 vcenterOid 임)
function setVCenterOidList(selectboxId){
	var param = "";
    $.ajax({
        type : "post",
        async : false,
        url : "/admin/system/construct/vcenter_list_json_data.do",
        dataType : "html",
        data : param,
        success : function(data) {
            var result = eval("("+data+")");
            $("#"+selectboxId).append("<option value=''>-선택-</option>");
            for(var i=0; i<result.length;i++){
            	$("#"+selectboxId).append("<option value="+result[i].vcenterOid+">"+result[i].vcenterName+"</option>");
            }
            
        },
        error : function(xhr, textStatus) {
        }
    });
}