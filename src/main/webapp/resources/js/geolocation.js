if('geolocation' in navigator) {
	  (function() {
	        window.onload = function() {
	            var startPos;
	            var geoSuccess = function(position) {
	                var startPos = position;
	                document.getElementById('startLat').value = startPos.coords.latitude;
	                document.getElementById('startLon').value = startPos.coords.longitude;
	            };
	            navigator.geolocation.getCurrentPosition(geoSuccess);
	        };
	    })();
	} else {
	    alert("위치 정보를 가져오지 못했습니다."); 
	}