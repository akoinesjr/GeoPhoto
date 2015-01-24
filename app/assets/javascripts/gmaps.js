function addMarkers(){
	for (i=0; i < locations.length; i++){
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(locations[i][0],locations[i][1]),
			map: map,
			html: (i+1).toString()
		})
		markers.push(marker)  
	}
