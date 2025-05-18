<div id="static-osm-map" class="h-11/12 w-11/12 rounded-lg border border-gray-200"></div>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<script>
    // Konfigurasi Peta
    const map = L.map('static-osm-map').setView([-7.797068, 110.370529], 13);

    // Tambahkan Tile Layer OSM
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Tambahkan Marker Contoh
    const marker = L.marker([-7.797068, 110.370529]).addTo(map);
    marker.bindPopup("<b>Lokasi Contoh</b><br>Ini adalah contoh marker statis").openPopup();

    // Tambahkan Circle Contoh
    const circle = L.circle([-7.802, 110.370], {
        color: 'red',
        fillColor: '#f03',
        fillOpacity: 0.5,
        radius: 500
    }).addTo(map);
    circle.bindPopup("Ini adalah area radius 500m");

    // Tambahkan Polygon Contoh
    const polygon = L.polygon([
        [-7.795, 110.365],
        [-7.800, 110.365],
        [-7.798, 110.375]
    ]).addTo(map);
    polygon.bindPopup("Ini adalah area poligon");
</script>
