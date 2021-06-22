$(function() {
				
	var now = new Date();
	var nY = now.getFullYear();
	var nM = now.getMonth() + 1;
	var nD = now.getDate();
	
	getDate(nY, nM, nD, nY, nM, nD);
	
	$("#adst").click(function() {
	
		$("#adst").toggleClass("checked");
		
		if($("#adst").hasClass("checked")) {
			document.getElementById("adst").src = "img/checkbox_checked.png";
			document.getElementById("hidden_adst").value = "Y";
		} else {
			document.getElementById("adst").src = "img/checkbox_outline.png";
			document.getElementById("hidden_adst").value = "N";
		}
	});
});

function getDate(year, month, day, oY, oM, oD) {
	
	var prevButton = "";
	var nextButton = "";
	
	if(month == 1) {
		prevButton = "getDate(" + (year - 1) + ", 12, 1, " + oY + ", " + oM + ", " + oD + ")";
	} else {
		prevButton = "getDate(" + year + ", " + (month - 1) + ", " + 1 + ", " + oY + ", " + oM + ", " + oD + ")";
	}
	
	if(month == 12) {
		nextButton = "getDate(" + (year + 1) + ", 1, 1, " + oY + ", " + oM + ", " + oD + ")";
	} else {
		nextButton = "getDate(" + year + ", " + (month + 1) + ", 1, " + oY + ", " + oM + ", " + oD + ")";
	}
	
	var cur_calendar = "<div id='cal_year'><dl id='prev'><dd><a onclick='" + prevButton + "'>◀</a></dd></dl><dl id='curr'><dd>" + year + ". " + month + ". " + "</dd></dl><dl id='next'><dd><a onclick='" + nextButton + "'>▶</a></dd></dl></div>";
	var cal_container = "<div id='cal_content'></div>";
	
	var week = "<div id='cal_week'><dl><dd>일</dd><dd>월</dd><dd>화</dd><dd>수</dd><dd>목</dd><dd>금</dd><dd>토</dd></dl></div>";
	
	var cal_blank = []; 
	
	var startDay = new Date(year, month-1).getDay();
	var endDay = new Date(year, month, 0).getDate();
	
	for(var i=0; i<startDay; i++) {
		
		cal_blank.push("0");
	}
	
	var cal_count = startDay;
	var cal_content = week + "<div id='cal_contents'><dl id='cal_week'>";
	
	for(var i=0; i<cal_blank.length; i++) {
		
		cal_content += "<dd></dd>";
	}
	
	for(var i=1; i<=endDay; i++) {
		
		var day_link = "getDate(" + year + "," + month + "," + i + "," + oY + "," + oM + "," + oD + ");";
		
		if(i == oD && year == oY && month == oM) {
			cal_content += "<dd id='today' style='background-color:#FFFF8F;' onclick='" + day_link + "'><div>" + i + "</div></dd>";
		} else if(i == day) {
			cal_content += "<dd id='day_select' style='background-color:#FFE08C;' onclick='" + day_link + "'><div>" + i + "</div></dd>";
		} else {
			cal_content += "<dd id='day_not_select' onclick='" + day_link + "'><div>" + i + "</div></dd>";
		}
		
		cal_count++;
		
		if(i != endDay && (startDay + i) % 7 == 0) {
			
			cal_content += "</dl><dl id='cal_week'>";
			cal_count = 0;
		}
	}
	
	for(var i=cal_count; i % 7 != 0; i++) {
		
		cal_content += "<dd></dd>";
	}
	
	cal_content += "</dl></div>";
	
	var selectDay =  year + "-" + month + "-" + day;
	
	document.getElementById("cal_frame").innerHTML = cur_calendar + cal_container;
	document.getElementById("cal_content").innerHTML = cal_content;
	document.getElementById("day").value = selectDay;
}