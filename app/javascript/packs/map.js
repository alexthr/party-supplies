import mapboxgl from 'mapbox-gl';
// mapboxgl.accessToken = 'pk.eyJ1IjoiYWxleHRociIsImEiOiJjamtjZDBhNmYwMHkzM2tvenlxZXJ0dHNhIn0.S4gZKUGV_FoVEq4CmXf2Kg';

const mapElement = document.getElementById('map');
mapboxgl.accessToken = mapElement.dataset.pk;

const geojson = JSON.parse(mapElement.dataset.geojson);
console.log(geojson);

const map = new mapboxgl.Map({
    container: 'map', // HTML container id
    style: 'mapbox://styles/mapbox/streets-v9', // style URL
    // center: [markers.long, markers.lat], // starting position as [lng, lat]
    zoom: 13
  });

if (Array.isArray(geojson) === false) {
  console.log("hello");
  const marker = new mapboxgl.Marker()
  .setLngLat([geojson.lng, geojson.lat])
  .addTo(map);
  map.setCenter(marker.getLngLat());
} else {
  // map.fitBounds([[geojson[0].lng, geojson[0].lat], [geojson[1].lng, geojson[0].lat]]);
  geojson.forEach( (coordinates) => {
    console.log(coordinates);
    const marker = new mapboxgl.Marker()
  .setLngLat([coordinates.lng, coordinates.lat])
  .addTo(map);
  });
  map.setCenter(geojson[0]);
}
