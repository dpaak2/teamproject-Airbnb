<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, user-scalable=no,  maximum-scale=1, minimum-scale=1, width=device-width" charset="UTF-8">
    <!--CSS LINK-->
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <style>
        #map {
	        height: 600px;
	        width: 100%;
       }
    </style>
    <title> Google Map </title>

</head>
<body>
    <div id="map"></div>

<!--JS LINK-->

<script>
    function mapstart() {
        var addr = {lat: 37.547900, lng: 126.954426};
        var map = new google.maps.Map(document.getElementById('map'), {
            center: addr,
            zoom: 16
        });
        var marker = new google.maps.Marker({
            position: addr,
            map: map
        });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2po9awT3gcPJdB_pK8XKHVZitS2zg-1U&callback=mapstart" async defer></script>

</body>
</html>