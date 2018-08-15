import mapboxgl from 'mapbox-gl';
// mapboxgl.accessToken = 'pk.eyJ1IjoiYWxleHRociIsImEiOiJjamtjZDBhNmYwMHkzM2tvenlxZXJ0dHNhIn0.S4gZKUGV_FoVEq4CmXf2Kg';

const mapElement = document.getElementById('map');
mapboxgl.accessToken = mapElement.dataset.pk;

const markers = JSON.parse(mapElement.dataset.markers)

const map = new mapboxgl.Map({
    container: 'map', // HTML container id
    style: 'mapbox://styles/mapbox/streets-v9', // style URL
    center: [markers.long, markers.lat], // starting position as [lng, lat]
    zoom: 13
  });
const marker = new mapboxgl.Marker()
.setLngLat([markers.long, markers.lat])
.addTo(map);

// export { addMap };
