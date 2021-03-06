var infosUtil = infosUtil || {};

/**
 * 随机数
 * @param n
 * @returns {String}
 */
infosUtil.RndNum = function(n) {
	var rnd = "";
	for ( var i = 0; i < n; i++)
		rnd += Math.floor(Math.random() * 10);
	return rnd;
};

/**
 * 接收HTML参数
 * request.QueryString("id");
 */
infosUtil.request = {
	QueryString : function(val) {
		var uri = window.location.search;
		var re = new RegExp("" + val + "=([^&?]*)", "ig");
		return ((uri.match(re)) ? (uri.match(re)[0].substr(val.length + 1)) : null);
	}
}

/**
 * 打开新的窗口
 * @param url
 */
infosUtil.openWin = function(url) {
	var width  = screen.availWidth-10;
	var height = screen.availHeight-50;
	var leftm  = 0;
	var topm   = 0;
	var args = "toolbar=0,location=0,maximize=1,directories=0,status=0,menubar=0,scrollbars=1, resizable=1,left=" + leftm+ ",top=" + topm + ", width="+width+", height="+height;
	var w = window.open(url,"",args);
	if(!w){
		alertify.error('发现弹出窗口被阻止，请更改浏览器设置，以便正常使用本功能！');
		return ;
	}
} ;

/**
 * 字符串和date 转换
 * @param c_date
 * @returns
 */
infosUtil.str2date = function(c_date) {
    if (!c_date)
        return "";
    var tempArray = c_date.split("-");
    if (tempArray.length != 3) {
        alert("你输入的日期格式不正确,正确的格式:2000-05-01 02:54:12");
        return 0;
    }
    var dateArr = c_date.split(" ");
    var date = null;
    if (dateArr.length == 2) {
        var yymmdd = dateArr[0].split("-"); 
        var hhmmss = dateArr[1].split(":");
        date = new Date(yymmdd[0], yymmdd[1] - 1, yymmdd[2], hhmmss[0], hhmmss[1], hhmmss[2]);
    } else {
        date = new Date(tempArray[0], tempArray[1] - 1, tempArray[2], 00, 00, 01);
    }
    return date;
};

/**
 * 格式化数字
 * @param s 数字
 * @param n 保留小数点位数
 * @returns {String}
 */
infosUtil.numberf = function(s, n)   
{   
   n = n > 0 && n <= 20 ? n : 2;   
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";   
   var l = s.split(".")[0].split("").reverse(),   
   r = s.split(".")[1];   
   t = "";   
   for(var i = 0; i < l.length; i ++ )   
   {   
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
   }   
   return t.split("").reverse().join("") + "." + r;   
};

/**
 * 计算时差
 * @param startTime
 * @param endTime
 * @returns {___anonymous2895_2964} 返回对象
 */
infosUtil.difference = function(startTime, endTime) {
	startTime = startTime.replace(/\-/g, "/");
	endTime = endTime.replace(/\-/g, "/");
	var sTime = new Date(startTime);
	var eTime = new Date(endTime);
	var dates = eTime.getTime() - sTime.getTime() ;
	
	//计算出相差天数
	var days=Math.floor(dates/(24*3600*1000)) ;
	
	//计算出小时数
	var leave1=dates%(24*3600*1000) ;    	//计算天数后剩余的毫秒数
	var hours=Math.floor(leave1/(3600*1000)) ;
	
	//计算相差分钟数
	var leave2=leave1%(3600*1000) ;        	//计算小时数后剩余的毫秒数
	var minutes=Math.floor(leave2/(60*1000)) ;
	
	//计算相差秒数
	var leave3=leave2%(60*1000) ;			//计算分钟数后剩余的毫秒数
	var seconds=Math.round(leave3/1000) ;
	
	var diff = {"days": days, "hours": hours, "minutes": minutes, "seconds": seconds} ;
	
	return diff ;
} ;


/**
 * 例子：
 * compareCalendar(str2date("2013-05-02 11:11:11").format("YYYY-MM-dd hh:mm:ss"), str2date("2013-05-07 11:11:11").format("YYYY-MM-dd hh:mm:ss"));
 */

/**
 * 比较日期大小
 * @param checkStartDate
 * @param checkEndDate
 * @returns {Boolean}
 */
infosUtil.compareDate = function(checkStartDate, checkEndDate) {
	var arys1 = new Array();
	var arys2 = new Array();
	if (checkStartDate != null && checkEndDate != null) {
		arys1 = checkStartDate.split('-');
		var sdate = new Date(arys1[0], parseInt(arys1[1] - 1), arys1[2]);
		arys2 = checkEndDate.split('-');
		var edate = new Date(arys2[0], parseInt(arys2[1] - 1), arys2[2]);
		if (sdate > edate) {
			//alert("日期开始时间大于结束时间");
			return false;
		} else {
			//alert("通过");
			return true;
		}
	}
};

/**
 * 判断日期，时间大小  
 * @param startDate
 * @param endDate
 * @returns {Boolean}
 */
infosUtil.compareTime = function(startDate, endDate) {
	if (startDate.length > 0 && endDate.length > 0) {
		var startDateTemp = startDate.split(" ");
		var endDateTemp = endDate.split(" ");

		var arrStartDate = startDateTemp[0].split("-");
		var arrEndDate = endDateTemp[0].split("-");

		var arrStartTime = startDateTemp[1].split(":");
		var arrEndTime = endDateTemp[1].split(":");

		var allStartDate = new Date(arrStartDate[0], arrStartDate[1],
				arrStartDate[2], arrStartTime[0], arrStartTime[1],
				arrStartTime[2]);
		var allEndDate = new Date(arrEndDate[0], arrEndDate[1], arrEndDate[2],
				arrEndTime[0], arrEndTime[1], arrEndTime[2]);

		if (allStartDate.getTime() >= allEndDate.getTime()) {
			//alert("startTime不能大于endTime，不能通过");
			return false;
		} else {
			//alert("startTime小于endTime，所以通过了"); 
			return true;
		}
	} else {
		alert("时间不能为空");
		return false;
	}
} ;

/**
 * 比较日期，时间大小  
 * @param startDate
 * @param endDate
 */
infosUtil.compareCalendar = function(startDate, endDate) {
	if (startDate.indexOf(" ") != -1 && endDate.indexOf(" ") != -1) {
		//包含时间，日期  
		return infosUtil.compareTime(startDate, endDate);
	} else {
		//不包含时间，只包含日期  
		return infosUtil.compareDate(startDate, endDate);
	}
} ;  


/**
 * @author 杨浩泉
 * 格式化日期时间
 * @param format
 * @returns
 */
Date.prototype.format = function(format) {
	/*
	 * eg:format="YYYY-MM-dd hh:mm:ss";
	 */
	var o = {
		"Y+" : this.getFullYear(),
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	// millisecond
	};

	if (/(Y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}

	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};

