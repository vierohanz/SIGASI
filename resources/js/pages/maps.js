console.log("leaflet map init");

  var map = L.map('map').setView([-7.2, 110.2], 8);
  L.tileLayer('https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, &copy; <a href="https://carto.com/attributions">CARTO</a>',
    maxZoom: 19
  }).addTo(map);

  let geoLayer;
  let geojsonData;

  fetch('/geojson/JT_1105.geojson')
    .then(response => response.json())
    .then(geojson => {
      geojsonData = geojson;
      console.log(geojsonData);  // Tambahkan ini untuk cek data
      drawMap();
    });

  function getPopupContent(feature) {
    let tahun = document.getElementById('tahunSelect').value;
    let namaKab = feature.properties.kota;
    let stuntingField = 'stunting_' + tahun + 'prevalensi_stunting';
    let stuntingValue = feature.properties[stuntingField];

    let stuntingText = stuntingValue ? stuntingValue + "%" : "Data tidak tersedia";
    return 'Kabupaten/Kota: ' + namaKab + '<br>Stunting (' + tahun + '): ' + stuntingText;
  }

  function getColor(prevalensi) {
    return prevalensi > 30 ? '#997599' :  // Merah Tua
           prevalensi > 20 ? '#d74e5e' :  // Orange
           prevalensi > 10 ? '#f7da83' :  // Kuning
                             '#31a354';  // Hijau
  }

  function style(feature) {
    let tahun = document.getElementById('tahunSelect').value;
    let stuntingField = 'stunting_' + tahun + 'prevalensi_stunting';
    let stuntingValue = parseFloat(feature.properties[stuntingField]);

    return {
      fillColor: getColor(stuntingValue),
      weight: 1,
      opacity: 1,
      color: '#74866c',
      fillOpacity: 0.7
    };
  }

   const legend = L.control({ position: 'bottomright' });

  legend.onAdd = function (map) {
    const div = L.DomUtil.create('div', 'info legend');
    div.innerHTML = `
      <div><span style="background-color:#997599"></span>>30%</div>
      <div><span style="background-color:#d74e5e"></span>>20%</div>
      <div><span style="background-color:#f7da83"></span>>10%</div>
      <div><span style="background-color:#31a354"></span><10%</div>
    `;
    return div;
  };

  legend.addTo(map);

  const selectControl = L.control({ position: 'topright' });

selectControl.onAdd = function (map) {
  const div = L.DomUtil.create('div', 'leaflet-control-select');
  div.innerHTML = `
    <select id="tahunSelect" style="
      padding: 6px;
      border-radius: 5px;
      border: 1px solid #ccc;
      font-size: 14px;
    ">
      <option value="2021">2021</option>
      <option value="2022">2022</option>
      <option value="2023" selected>2023</option>
    </select>
  `;

  // Mencegah map dari zoom/pan saat select di klik
  L.DomEvent.disableClickPropagation(div);

  return div;
};

const info = L.control({position: 'bottomleft'});

info.onAdd = function (map) {
  this._div = L.DomUtil.create('div', 'info');
  this.update();
  return this._div;
};

info.update = function (props) {
  this._div.innerHTML = '<h4>Data Stunting</h4>' +  (props ?
    '<b>' + props.ADM2_EN + '</b><br />' + (props['stunting_' + document.getElementById('tahunSelect').value + 'prevalensi_stunting'] || "Tidak ada data") + '%'
    : 'Arahkan mouse ke wilayah');
};

info.addTo(map);

function highlightFeature(e) {
  var layer = e.target;

  layer.setStyle({
    weight: 3,
    color: '#666',
    dashArray: '',
    fillOpacity: 0.7
  });

  layer.bringToFront();
  info.update(layer.feature.properties);
}

function resetHighlight(e) {
  geoLayer.resetStyle(e.target);
  info.update();
}

selectControl.addTo(map);

  function drawMap() {
    if (geoLayer) {
      geoLayer.remove();
    }

geoLayer = L.geoJSON(geojsonData, {
  style: style,
  onEachFeature: function (feature, layer) {
    layer.on({
      mouseover: highlightFeature,
      mouseout: resetHighlight,
      click: function () {
        layer.bindPopup(getPopupContent(feature)).openPopup();
      }
    });
  }
}).addTo(map);
  }

function updateMap() {
    console.log("Tahun baru:", document.getElementById('tahunSelect').value);

  if (!geoLayer) return;

  geoLayer.eachLayer(function (layer) {
    const newStyle = style(layer.feature);
    layer.setStyle(newStyle);
    layer.setPopupContent(getPopupContent(layer.feature)); // Update popup
  });

  info.update(); // Reset info control
}
document.getElementById('tahunSelect').addEventListener('change', updateMap);

window.updateMap = updateMap;
