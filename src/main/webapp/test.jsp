<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<input type="button" id="startLat">
<div id="startLon"></div>
<script>
    (function() {
        window.onload = function() {
            var startPos;
            var geoSuccess = function(position) {
                startPos = position;
                document.getElementById('startLat').value = startPos.coords.latitude;
                document.getElementById('startLon').value = startPos.coords.longitude;
            };
            navigator.geolocation.getCurrentPosition(geoSuccess);
        };
    })();
</script>
</body>
</html>