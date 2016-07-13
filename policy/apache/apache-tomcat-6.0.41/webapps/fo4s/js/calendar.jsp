<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<META HTTP-EQUIV='Pragma' content='no-cache'>
<META HTTP-EQUIV='Expires' content='-1'>
<SCRIPT LANGUAGE="javascript">
<!--
//
// obj : 날짜 입력을 전달할 input object name
// flag : 날짜+시각 체크입력 허용 방법 (0:체크안함, 1: 과거만 허용, 2: 미래만 허용, 
//								  3:체크안함(date+time), 4: 과거만 허용(date+time), 5: 미래만 허용(date+time))
// h_obj : 함께 체크할... 시 selectbox name
// m_obj : 함께 체크할... 분 selectbox name
// s_obj : 함께 체크할... 초 selectbox name
//

Calendar = function (obj,flag,h_obj,m_obj,s_obj,f_obj,t_obj) {
    this.avail = (document.getElementById) ? true : false;
    if (!this.avail) return;
    
    if(typeof(obj)=='string') {
        obj = parent.document.getElementById(obj);
    }
        
    if (typeof flag == "undefined") flag = 0;
    
    this._checkFlag = flag % 3 ;
    this._h_obj = h_obj;
    this._m_obj = m_obj;
    this._s_obj = s_obj;
    this._f_obj = f_obj;
    this._t_obj = t_obj;
    this._obj = obj;
    if (flag > 2)
    {
    	this._datetime_obj = true;
    }else
    {
    	this._datetime_obj = false;    
    }

    
    this._setDateSeperator = "-";   // 날짜 구분자
    this._setDisableColor = "#999999"; // 선택불가능 날짜 색
    this._setDisableBackground = "";   // 선택불가능 날짜 배경색
    this._setPrevColor = "#999999"; // 이전달 날짜 색
    this._setPrevBackground = "";   // 이전달 날짜 배경색
    this._setNextColor = "#999999"; // 다음달 날짜 색
    this._setNextBackground = "";   // 다음달 날짜 배경색
    this._setNowBold = true;        // 선택 날짜 Bold여부
    this._setNowColor = "blue";     // 선택 날짜 색
    this._setNowBackground = "";    // 선택 날짜 배경색
    this._setTodayBold = true;      // 오늘 날짜 Bold여부
    this._setTodayColor = "red";    // 오늘 날짜 색
    this._setTodayBackground = "";  // 오늘 날짜 배경색

    var classObj = this;
    this.layerObj = parent.document.getElementById("CalendarLayer");
    this.layerObj.style.position= 'absolute';

    this.calForm = document.forms["CalendarForm"];
    this.calForm.cal_year.onchange = function () {
        classObj.year = parseInt(this[this.selectedIndex].value, 10);
        classObj.setCalendar();
    }
    this.calForm.cal_month.onchange = function () {
        classObj.month = parseInt(this[this.selectedIndex].value, 10);
        classObj.setCalendar();
    }

    if (document.all) {
        document.getElementById("CalendarPrevMonth").style.cursor = "hand";
        document.getElementById("CalendarNextMonth").style.cursor = "hand";
        document.getElementById("CalendarToday").style.cursor     = "hand";
        document.getElementById("CalendarClose").style.cursor     = "hand";
    } else {
        document.getElementById("CalendarPrevMonth").style.cursor = "pointer";
        document.getElementById("CalendarNextMonth").style.cursor = "pointer";
        document.getElementById("CalendarToday").style.cursor     = "pointer";
        document.getElementById("CalendarClose").style.cursor     = "pointer";
    }
    document.getElementById("CalendarPrevMonth").onclick = function () {
        classObj.shiftMonth(-1);
    }
    document.getElementById("CalendarNextMonth").onclick = function () {
        classObj.shiftMonth(+1);
    }
    var d = new Date();
//    document.getElementById("CalendarToday").innerHTML = "(" + this.getDateFormat(d.getFullYear(), d.getMonth(), d.getDate()) + ")";
    document.getElementById("CalendarToday").onclick = function () {
        var d = new Date();
        classObj.setDate(d.getFullYear(), d.getMonth(), d.getDate());
        classObj.destroy();
    }
    document.getElementById("CalendarDelete").onclick = function () {
        classObj.delDate();
        classObj.destroy();
    }
    document.getElementById("CalendarClose").onclick = function () {
        classObj.destroy();
    }
    this.show(obj);
}

Calendar.prototype.getDateFormat = function (year, month, day) {
    month++;
    if (month.toString().length == 1) month = "0" + month;
    if (day.toString().length == 1)   day = "0" + day;
    return year + this._setDateSeperator + month + this._setDateSeperator + day;
}

Calendar.prototype.getTimeFormat = function () {  // By KKH
    var classObj = this;
    var d = new Date();
    var thour  = d.getHours()    
    var tminute = d.getMinutes();
    var tsecond = d.getSeconds();
    
    if (thour.toString().length == 1) thour = "0"+thour;
    if (tminute.toString().length == 1) tminute = "0"+tminute;
    if (tsecond.toString().length == 1) tsecond = "0"+tsecond;
            
	return thour+":"+tminute+":"+tsecond; 
}    
    
Calendar.prototype.shiftMonth = function (val) {
    this.month += val;
    d = new Date(this.year, this.month, this.day);
    this.year  = d.getFullYear();
    this.month = d.getMonth();
    this.day   = d.getDate();
    this.setCalendar();
}

Calendar.prototype.setDate = function (year, month, day) {
	if (this._datetime_obj)
	{
	     //서비스요청및 인시던트의 처리종료일시일때 이벤트 발생 2008.12.01 강대일
	     /*
	    if ( this.obj.name =="zEndDate") { 
	       this.obj.value = this.getDateFormat(year, month, day)+" "+this.getTimeFormat();
	       if ( this.obj.value != '')
	       {
	           parent.setEndDateCheck();
	       }
	    }else{
	       this.obj.value = this.getDateFormat(year, month, day)+" "+this.getTimeFormat();
		}*/
		this.obj.value = this.getDateFormat(year, month, day)+" "+this.getTimeFormat();
	}else
	{
		this.obj.value = this.getDateFormat(year, month, day)
	}
	this.obj.focus();
}

Calendar.prototype.delDate = function () {
    this.obj.value = "";
    this.obj.focus();
}

Calendar.prototype.setCalendar = function () {
    if (this.yearOld != this.year) this.setYear(this.calForm.cal_year);
    this.setMonth(this.calForm.cal_month);

    if (this.yearOld != this.year || this.monthOld != this.month) {
        this.drawCalendar(this.year, this.month, this.day);
    }

    this.yearOld = this.year;
    this.monthOld = this.month;
}

Calendar.prototype.drawCalendar = function (year, month, day) {
    var calDate     = new Date(year, month, 1);
    var calWeekday  = calDate.getDay();
    var calDays     = this.getMonthDays(year, month + 1);
    var calPrevDays = this.getMonthDays(year, month);
    var calDay      = 1;
    var calNextDay  = 1;

    for (var i=0; i<6; i++) {  // loop for month-weeks
        for (var j=0; j<7; j++) {  // loop for week-days
            var dayLayer = eval("document.getElementById('CalendarDay_"+ (i+1) +"_"+ (j+1) +"')");
            if (i==0 && j<calWeekday) {
                this.linkDay(dayLayer, year, month - 1, calPrevDays - (calWeekday - j) + 1, 'prev');
            } else if (calDay > calDays) {
                this.linkDay(dayLayer, year, month + 1, calNextDay, 'next');
                calNextDay++;
            } else {
                this.linkDay(dayLayer, year, month, calDay);
                calDay++;
            }
        }
    }
}

Calendar.prototype.linkDay = function (layer, year, month, day, monthTab) {
    var classObj = this;
    var d = new Date();
    layer.innerHTML = day;
    
    if (!classObj.checkTody(year, month, day)) {
        layer.style.fontWeight = "";
        layer.style.color      = (this._setDisableColor) ?  this._setDisableColor : "";
        layer.style.background = (this._setDisableBackground) ? this._setDisableBackground : "";
        layer.style.cursor = "default";
    } else{
        if (this.yearSet == year && this.monthSet == month && this.daySet == day) { // 선택날짜 효과
            layer.style.fontWeight = (this._setNowBold == true) ? "bold" : "";
            layer.style.color      = (this._setNowColor) ? this._setNowColor : "";
            layer.style.background = (this._setNowBackground) ? this._setNowBackground : "";
        } else if (d.getFullYear() == year && d.getMonth() == month && d.getDate() == day) { // 오늘날짜 효과
            layer.style.fontWeight = (this._setTodayBold == true) ? "bold" : "";
            layer.style.color      = (this._setTodayColor) ? this._setTodayColor : "";
            layer.style.background = (this._setTodayBackground) ? this._setTodayBackground : "";
        } else if (monthTab == 'prev') {   // 이전달 효과
            layer.style.fontWeight = "";
            layer.style.color      = (this._setPrevColor) ?  this._setPrevColor : "";
            layer.style.background = (this._setPrevBackground) ? this._setPrevBackground : "";
        } else if (monthTab == 'next') { // 다음달 효과
            layer.style.fontWeight = "";
            layer.style.color      = (this._setNextColor) ? this._setNextColor: "";
            layer.style.background = (this._setNextBackground) ? this._setNextBackground : "";
        } else {
            layer.style.fontWeight = "";
            layer.style.color      = "";
            layer.style.background = "";
        }
        layer.style.cursor = (document.all) ? "hand" : "pointer";
    }
    layer.onclick = function () {
        if (classObj.checkTody(year, month, day)) {
            if (classObj.checkTerm(year, month, day)) {
                var d = new Date(year, month, day);
                classObj.setDate(d.getFullYear(), d.getMonth(), d.getDate());
                classObj.postProcess(year, month, day);
                classObj.destroy();
            }else{
                alert("기간선택이 잘못되었습니다.");
            }
        }
    }
}

Calendar.prototype.setYear = function (yearObj) {
    yearObj.options.length = 0;
    for (var i=this.year-7, j=0; i<=this.year+7; i++, j++) {
        yearObj.options[j] = new Option(i, i, false);
        if (i == this.year) yearObj.options[j].selected = true;
    }
}

Calendar.prototype.setMonth = function (monthObj) {
    monthObj.selectedIndex = this.month;
}

Calendar.prototype.show = function (obj) {
    if (!this.avail || this.obj == obj) return;

    this.obj = obj;

    var classObj = this;
    var objTmp = this.obj;
    var layerX = 0;
    var layerY = 0;
    while (objTmp) {
        layerX += objTmp.offsetLeft;
        layerY += objTmp.offsetTop+8;
        objTmp = objTmp.offsetParent;
    }
    this.layerObj.style.left = layerX+"px";
    this.layerObj.style.top  = layerY-17+"px";
    this.layerObj.style.display = "block";

    var datePattern = /^([0-9]{4})[\-\.]?([01][0-9])[\-\.]?([0-3][0-9])$/;
    if (datePattern.test(this.obj.value)) {
        datePattern.exec(this.obj.value);
        var d = new Date(parseInt(RegExp.$1, 10), parseInt(RegExp.$2, 10) - 1, parseInt(RegExp.$3, 10));
    } else {
        var d = new Date();
    }
    this.year  = d.getFullYear();
    this.month = d.getMonth();
    this.day   = d.getDate();
    this.yearSet  = this.year;
    this.monthSet = this.month;
    this.daySet   = this.day;
    this.setCalendar();
}

Calendar.prototype.getMonthDays = function (year, month) {
    var d = new Date(year, month, 0);
    return d.getDate();
}

Calendar.prototype.checkTody = function (year, month, day) {    // By KKH
    var classObj = this;
    var d = new Date();
    var tyear  = d.getFullYear();
    var tmonth = d.getMonth();
    var tday   = d.getDate();
    var today = new Date(tyear, tmonth, tday);
    var inputdate = new Date(year, month, day);
    if (classObj._checkFlag==1) {
        if (inputdate<=today) return true;
        else return false;
    }else if (classObj._checkFlag==2) {
        if (inputdate>=today) return true;
        else return false;
    }else return true;
}

Calendar.prototype.checkTerm = function (year, month, day) {    // By KKH
    var classObj = this;
    if (((typeof classObj._f_obj != "undefined")||(typeof classObj._t_obj != "undefined"))&&(classObj._f_obj.value||classObj._t_obj.value)) {
        if (typeof classObj._f_obj != "undefined") {
            if (classObj._f_obj) {
                if (classObj._f_obj.value) {
                    var fromDate = new Date(parseInt(classObj._f_obj.value.substr(0,4)),parseInt(classObj._f_obj.value.substr(5,2))-1,parseInt(classObj._f_obj.value.substr(8,2)));
                }else var fromDate = null;
            }else var fromDate = null;
        }else var fromDate = null;
        if (typeof classObj._t_obj != "undefined") {
            if (classObj._t_obj) {
                if (classObj._t_obj.value) {
                    var toDate = new Date(parseInt(classObj._t_obj.value.substr(0,4)),parseInt(classObj._t_obj.value.substr(5,2))-1,parseInt(classObj._t_obj.value.substr(8,2)));
                }else var toDate = null;
            }else var toDate = null;
        }else var toDate = null;

        if (classObj._obj.name == classObj._f_obj.name) var fromDate = new Date(year, month, day);
        if (classObj._obj.name == classObj._t_obj.name) var toDate = new Date(year, month, day);

        if (fromDate && toDate) {
            if (fromDate.valueOf()>toDate.valueOf()) return false;
            else return true;
        }else return true;
    }else return true;
}


Calendar.prototype.postProcess = function (year, month, day) {  // By KKH
    var classObj = this;
    var d = new Date();
    var thour  = d.getHours()
    var tminute = d.getMinutes();
    var tsecond = d.getSeconds();

    if (typeof classObj._h_obj != "undefined") {
        if (classObj._h_obj) {
            classObj.removeOptions(classObj._h_obj);
            var optionArr = classObj.getArray("hour", year, month, day);
            for (i=0;i<optionArr.length;i++) {
                classObj.addOptions(classObj._h_obj,optionArr[i],optionArr[i]);
            }
            classObj.selectOptions(classObj._h_obj,thour);
        }
    }
    if (typeof classObj._m_obj != "undefined") {
        if (classObj._m_obj) {
        /*  classObj.removeOptions(classObj._m_obj);
            var optionArr = classObj.getArray("minute", year, month, day);
            for (i=0;i<optionArr.length;i+=10) {
                classObj.addOptions(classObj._m_obj,optionArr[i],optionArr[i]);
            }
            classObj.selectOptions(classObj._m_obj,tminute); */
        }
    }
    if (typeof classObj._s_obj != "undefined") {
        if (classObj._s_obj) {
        /*  classObj.removeOptions(classObj._s_obj);
            var optionArr = classObj.getArray("second", year, month, day);
            for (i=0;i<optionArr.length;i+=10) {
                classObj.addOptions(classObj._s_obj,optionArr[i],optionArr[i]);
            }
            classObj.selectOptions(classObj._s_obj,tsecond); */
        }
    }
    return;
}

Calendar.prototype.getArray = function (mode, year, month, day) {   // By KKH
    var classObj = this;
    var inputdate = new Date(year, month, day);
    var today = new Date();
    var tyear  = today.getFullYear();
    var tmonth = today.getMonth();
    var tday   = today.getDate();
    var todate = new Date(tyear, tmonth, tday);
    var result = new Array;

    if ((year==tyear)&&(month==tmonth)&&(day==tday))  {
        if (mode=="hour") {
            var thisNum = today.getHours();
            if (classObj._checkFlag==0) { var fromNum=0; var toNum=23; }
            if (classObj._checkFlag==1) { var fromNum=0; var toNum=thisNum; }
            if (classObj._checkFlag==2) { var fromNum=thisNum+1; var toNum=23; }
        }
        if (mode=="minute") {
            var tnum = today.getMinutes();
            if (classObj._checkFlag==0) { var fromNum=0; var toNum=59; }
            if (classObj._checkFlag==1) { var fromNum=0; var toNum=thisNum; }
            if (classObj._checkFlag==2) { var fromNum=thisNum+1; var toNum=59; }
        }
        if (mode=="second") {
            var tnum = today.getSeconds();
            if (classObj._checkFlag==0) { var fromNum=0; var toNum=59; }
            if (classObj._checkFlag==1) { var fromNum=0; var toNum=thisNum; }
            if (classObj._checkFlag==2) { var fromNum=thisNum+1; var toNum=59; }
        }
        for (i=fromNum;i<=toNum;i++) result[i-fromNum] = i;
    }else if (classObj.checkTody(year, month, day)) {
        if (mode=="hour") { var fromNum=0; var toNum=23; }
        if (mode=="minute") { var fromNum=0; var toNum=59; }
        if (mode=="second") { var fromNum=0; var toNum=59; }
        for (i=fromNum;i<=toNum;i++) result[i-fromNum] = i;
    }
    return result;
}

Calendar.prototype.removeOptions = function (obj) {
    for (var i=obj.length; i>=0; i--) {
        obj.options[i] = null;
    }
    //obj.selectedIndex = 0;
    return true;
}

Calendar.prototype.selectOptions = function (obj,val) {
    for (var i=0; i<obj.length; i++) {
        if (obj.options[i].value==val) obj.selectedIndex=i;
    }
    return true;
}

Calendar.prototype.addOptions = function (obj,val,text) {
    var NewOption = new Option();
    NewOption.value = val;
    NewOption.text = text;
    obj.add(NewOption);
    return true;
}

Calendar.prototype.destroy = function () {
    this.layerObj.style.display = "none";
    this.obj = null;
    this.yearOld = null;
    this.monthOld = null;
}
//-->
</script>

<style>
    table, td {font-size: 8pt; font-family: 굴림}
    div, form {margin:0; padding:0; }
    select {font-size: 8pt; font-family: 굴림; background-color:#e5e5e5}
    a:hover {text-decoration: underline;color:#9999ff}
    a:link { text-decoration: none;}
    a:visited { text-decoration: none;}
    a:active { text-decoration: none;}
    .red { color:red; }
    .blue {  }
</style>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

<div id="CalendarLayer">

<form name="CalendarForm">

<table border="0" cellspacing="1" cellpadding="0" width="172" bgcolor="#666666">
    <tr>
        <td bgcolor="#FFFFFF" align="center">
                
            <table border="0" cellspacing="0" cellpadding="0" width="170" bgcolor="#396F9F">
                <tr height="25">
                    <td align="right" width="15">    
                        <div id="CalendarPrevMonth"><font color="white">◁</font></div>
                    </td>
                    <td align="center" width="140">
                        <select name="cal_year"></select>
                        <select name="cal_month">
                            <option value="0">1</option>
                            <option value="1">2</option>
                            <option value="2">3</option>
                            <option value="3">4</option>
                            <option value="4">5</option>
                            <option value="5">6</option>
                            <option value="6">7</option>
                            <option value="7">8</option>
                            <option value="8">9</option>
                            <option value="9">10</option>
                            <option value="10">11</option>
                            <option value="11">12</option>
                        </select>
                    </td>
                    <td align="left" width="15">
                        <div id="CalendarNextMonth"><font color="white">▷</font></div>
                    </td>
                </tr>
            </table>
            <table border="0" cellspacing="0" cellpadding="0" width="140">
                <tr align="center" height="20">
                    <th width="20" class="red">일</th>
                    <th width="20">월</th>
                    <th width="20">화</th>
                    <th width="20">수</th>
                    <th width="20">목</th>
                    <th width="20">금</th>
                    <th width="20" class="blue">토</th>
                </tr>
                <tr>
                    <td height="1" colspan="7" bgcolor="black"></td>
                </tr>
            </table>
    
            <table border="0" cellspacing="0" cellpadding="1" width="140">
                <tr align="center" height="18">
                    <td width="20" class="red"><div id="CalendarDay_1_1"></div></td>
                    <td width="20"><div id="CalendarDay_1_2"></div></td>
                    <td width="20"><div id="CalendarDay_1_3"></div></td>
                    <td width="20"><div id="CalendarDay_1_4"></div></td>
                    <td width="20"><div id="CalendarDay_1_5"></div></td>
                    <td width="20"><div id="CalendarDay_1_6"></div></td>
                    <td width="20" class="blue"><div id="CalendarDay_1_7"></div></td>
                </tr>
                <tr align="center" height="18">
                    <td width="20" class="red"><div id="CalendarDay_2_1"></div></td>
                    <td width="20"><div id="CalendarDay_2_2"></div></td>
                    <td width="20"><div id="CalendarDay_2_3"></div></td>
                    <td width="20"><div id="CalendarDay_2_4"></div></td>
                    <td width="20"><div id="CalendarDay_2_5"></div></td>
                    <td width="20"><div id="CalendarDay_2_6"></div></td>
                    <td width="20" class="blue"><div id="CalendarDay_2_7"></div></td>
                </tr>
                <tr align="center" height="18">
                    <td width="20" class="red"><div id="CalendarDay_3_1"></div></td>
                    <td width="20"><div id="CalendarDay_3_2"></div></td>
                    <td width="20"><div id="CalendarDay_3_3"></div></td>
                    <td width="20"><div id="CalendarDay_3_4"></div></td>
                    <td width="20"><div id="CalendarDay_3_5"></div></td>
                    <td width="20"><div id="CalendarDay_3_6"></div></td>
                    <td width="20" class="blue"><div id="CalendarDay_3_7"></div></td>
                </tr>
                <tr align="center" height="18">
                    <td width="20" class="red"><div id="CalendarDay_4_1"></div></td>
                    <td width="20"><div id="CalendarDay_4_2"></div></td>
                    <td width="20"><div id="CalendarDay_4_3"></div></td>
                    <td width="20"><div id="CalendarDay_4_4"></div></td>
                    <td width="20"><div id="CalendarDay_4_5"></div></td>
                    <td width="20"><div id="CalendarDay_4_6"></div></td>
                    <td width="20" class="blue"><div id="CalendarDay_4_7"></div></td>
                </tr>
                <tr align="center" height="18">
                    <td width="20" class="red"><div id="CalendarDay_5_1"></div></td>
                    <td width="20"><div id="CalendarDay_5_2"></div></td>
                    <td width="20"><div id="CalendarDay_5_3"></div></td>
                    <td width="20"><div id="CalendarDay_5_4"></div></td>
                    <td width="20"><div id="CalendarDay_5_5"></div></td>
                    <td width="20"><div id="CalendarDay_5_6"></div></td>
                    <td width="20" class="blue"><div id="CalendarDay_5_7"></div></td>
                </tr>
                <tr align="center" height="18">
                    <td width="20" class="red"><div id="CalendarDay_6_1"></div></td>
                    <td width="20"><div id="CalendarDay_6_2"></div></td>
                    <td width="20"><div id="CalendarDay_6_3"></div></td>
                    <td width="20"><div id="CalendarDay_6_4"></div></td>
                    <td width="20"><div id="CalendarDay_6_5"></div></td>
                    <td width="20"><div id="CalendarDay_6_6"></div></td>
                    <td width="20" class="blue"><div id="CalendarDay_6_7"></div></td>
                </tr>
            </table>
            
            <table border="0" cellspacing="0" cellpadding="0" width="140">
                <tr>
                    <td height="1" colspan="7" bgcolor="black"></td>
                </tr>
            </table>
            <table border="0" cellspacing="1" cellpadding="2" width="160">
                <tr>
                    <td colspan="7" align="center">
                        <div id="CalendarToday" style="display:inline;cursor:hand;">오늘</div>&nbsp;|
                        <div id="CalendarDelete" style="display:inline;cursor:hand;">삭제</div>&nbsp;|
                        <div id="CalendarClose" style="display:inline;cursor:hand;">닫기</div>
                    </td>
                </tr>
            </table>
        
        </td>
    </tr>
</table>

</form>

</div>

</body>
</html>