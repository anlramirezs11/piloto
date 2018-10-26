
<!DOCTYPE html>
<html>
<head>
    <title>Alerta la Obra</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600" rel="stylesheet"> 
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css" integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js" integrity="sha512-nMMmRyTVoLYqjP9hrbed9S+FzjZHW5gY1TWCHA5ckwXZBadntCNs8kEqAWdrb9O7rxbCaA4lKTIWjDXZxflOcA==" crossorigin=""></script>
    <script type="text/javascript" src="js/bogota.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <!-- Archivos CSS -->
    <link href="css/home.css" rel="stylesheet" type="text/css"/> 
</head>
<body onload="initMAP()">
<div class="map">
    <div id='map'></div>
</div>
<div class="info">
    <h1 style="font-size: 50px; color: #336699" align="center">Alcaldía Local de <strong id="titulo"></strong></h1>
    <p style="font-size: 30px; margin-left: 30px;">Las 5 Variables</p>
    <div class="container">
        <div onclick="viewInfo(1)">
            <img  src="image/btn1.png"/>            
        </div>
        <div onclick="viewInfo(2)">
            <img  src="image/btn2.png"/>            
        </div>
        <div onclick="viewInfo(3)">
            <img  src="image/btn3.png"/>           
        </div>
        <div onclick="viewInfo(4)">
            <img src="image/btn4.png"/>            
        </div>
        <div onclick="viewInfo(5)">
            <img  src="image/btn5.png"/>            
        </div>       
    </div>
    <div class="container informacion info1">
        <div class="data container" style="font-size: 20px;">
            <div><img style="width: 100px; margin-top: 15px; margin-left: 20px" src="image/secop1_normal.png"/></div>
            <div style= "margin-left: 20px; ">
                <br><br><br><strong style="font-size: 30px;" id="contratosSECOPI"></strong> Contratos Celebrados
            </div>            
        </div>
        <div class="data container" style="font-size: 20px;">
             <div><img style="width: 100px; margin-top: 15px; margin-left: 20px" src="image/secop_2_normal.png"/></div>
            <div style= "margin-left: 20px; ">
                <br><br><br><strong style="font-size: 30px;" id="contratosSECOPII"></strong> Contratos Celebrados
            </div>
        </div>               
    </div>
    <div class="informacion info1">
        <h1>SECOPI Y SECOP II</h1>
        <div class="FoundData">
        </div>
</div>
    <div class="container informacion info2"> 
        <img style="width: 1200px; margin-top: 15px; margin-left: 20px" src="image/contractual.png"/>
    </div>
    <div class="container informacion info3"> 
        <img style="width: 1200px; margin-top: 15px; margin-left: 20px" src="image/proceso.png"/>
    </div>
    <div class="container informacion info4">
        <div class="data container" style="font-size: 20px;">
            <div><img style="width: 100px; margin-top: 15px; margin-left: 20px" src="image/secop1_normal.png"/></div>
            <div style= "margin-left: 20px; ">
                <br><br><br><strong style="font-size: 30px;" id="contratosSECOPI">54</strong> Contratos Celebrados de los <br> cuales <strong>8</strong> presentan irregularidades
            </div>            
        </div>
        <div class="data container" style="font-size: 20px;">
             <div><img style="width: 100px; margin-top: 15px; margin-left: 20px" src="image/secop_2_normal.png"/></div>
            <div style= "margin-left: 20px; ">
                <br><br><br><strong style="font-size: 30px;" id="contratosSECOPII">6</strong> Contratos Celebrados los <br> cuales no tiene irregulariadades.
            </div>
        </div>               
    </div>
    <div class="informacion info4">
        <h1>SECOPI Y SECOP II</h1>
        <div class="Irregular">
        </div>
</div>
    
    
    
    <div class="container informacion" id="info5">
                <div class="data">
                    dfdsf
                </div>
                <div class="data">
                    dfds
                </div>               
            </div>
</div>





<script type="text/javascript">
var SECOPII= "https://www.datos.gov.co/resource/9f3w-id9a.json?$$app_token=glFv4rbJcL4JLD1Q3UJrlDthE";
var SECOPI= "https://www.datos.gov.co/resource/c6dm-udt9.json?$$app_token=glFv4rbJcL4JLD1Q3UJrlDthE";
var map=null
var contratos=0;
     var arryColSECOP;//Total de Colmnas que trae el SecopI
function initMAP(){
    $(".informacion").hide("slow");
    $(".info").hide("slow");    
    $(".info1").show("slow");
    domap();
    selectBD();
    countContractI(); 
    countContractII();
    irregularidades();
}
function viewInfo(id){
    $(".informacion").hide("slow");
    $(".info"+id).show("slow");
}

function selectBD(){
        selectedBD= "https://www.datos.gov.co/resource/c6dm-udt9.json?$$app_token=glFv4rbJcL4JLD1Q3UJrlDthE";
         $.ajax({
            url: selectedBD,
            type: "GET",
            data: {
                "$limit":1
            },
            error: function(xhr, status, error) {
                alert("Ocurrió un error al tratar de obtener las columnas, por favor contacte al administrador");
            },
            success: function(data, textStatus, jqXHR){
                arryColSECOP=Object.keys(data[0]);
            }
        });       
    }

function countContractI(){
    var anno;
    var aux=0;
        var searchFilter="&tipo_de_contrato=Obra&nombre_de_la_entidad="+encodeURI("BOGOTÁ D.C. - ALCALDÍA LOCAL CIUDAD BOLÍVAR");     
        var url=SECOPI+searchFilter;
        $.ajax({
            url: url,
            type: "GET",
            data: {
                "$limit":10000
            },
            error: function(xhr, status, error) {
                alert("Ocurrió un error al tratar de obtener las columnas, por favor contacte al administrador");
            },
            success: function(data, textStatus, jqXHR){
                
            $("#contratosSECOPI").html(data.length);        
            bogota.features[18].properties.Contratos=bogota.features[18].properties.Contratos+ data.length;
            showFoundDataI(data);
            }
           });
    }
function irregularidades(){
    var url= "https://www.datos.gov.co/resource/c6dm-udt9.json?$$app_token=glFv4rbJcL4JLD1Q3UJrlDthE&tipo_de_contrato=Obra&nombre_de_la_entidad=BOGOT%C3%81%20D.C.%20-%20ALCALD%C3%8DA%20LOCAL%20CIUDAD%20BOL%C3%8DVAR&$where=anno_cargue_secop%3E%272015%27"
    $.ajax({
            url: url,
            type: "GET",
            data: {
                "$limit":10000
            },
            error: function(xhr, status, error) {
                alert("Ocurrió un error al tratar de obtener las columnas, por favor contacte al administrador");
            },
            success: function(data, textStatus, jqXHR){   
            showFoundDatairregular(data);
            }
           });
    
    
}    

function countContractII(){
        var searchFilter="&tipo_de_contrato=Obra&nombre_entidad="+encodeURI("ALCALDIA LOCAL DE CIUDAD BOLIVAR");     
        var url=SECOPII+searchFilter;
        $.ajax({
            url: url,
            type: "GET",
            data: {
                "$limit":10000
            },
            error: function(xhr, status, error) {
                alert("Ocurrió un error al tratar de obtener las columnas, por favor contacte al administrador");
            },
            success: function(data, textStatus, jqXHR){
                $("#contratosSECOPII").html(data.length);
                bogota.features[18].properties.Contraros= bogota.features[18].properties.Contraros+ data.length;        
                             showFoundDataII(data);

            }
        });  


    }
function replace(str){
        str= str.replace("nn", "ñ");        
        str= str.replace("a_o", "año");
        str= str.replace("laño", "la o");
        var re=/_/g;
        str= str.replace(re, " ");
        str= str.replace("ci n", "ción");
        str= str.replace("cion", "ción");
        str= str.replace("c digo", "código");
        str= str.replace("codigo", "código");
        str= str.replace("cuantia", "cuantía");
        str= str.replace("regimen", "régimen");
        str= str.replace("numero", "número");
        str= str.replace("dias", "días");
        str= str.replace("item", "ítem");        
        str= str.charAt(0).toUpperCase() + str.slice(1);
        return str;
    }
 function showFoundDataI(data){
     var html="";
        html+="<table id='t1' class='tableRecords'><tr id='fixedRow'>";
        for(var j=0; j<arryColSECOP.length ;j++){
            html+="<th>"+replace(arryColSECOP[j])+"</th>";
            }
        html+="</tr>";
        $(".FoundData").html(html); 
        for(var i=0; i<data.length ;i++){ 
            html+="<tr>";
            arryFormattedData=[];
            var aux=0;
            for(var j=0; j<Object.values(data[i]).length ;j++){
                if(Object.keys(data[i])[j]==arryColSECOP[aux]){
                    arryFormattedData[aux]=Object.values(data[i])[j];
                }
                else{
                    arryFormattedData[aux]="No Data";
                    aux++;                    
                    arryFormattedData[aux]=Object.values(data[i])[j];
                }
                aux++;                             
            }
            for(var j=0; j<arryFormattedData.length ;j++){
                html+="<td>"+arryFormattedData[j]+"</td>";
                
            }
            html+="</tr>";
        } 
        html+="</table>";
    $(".FoundData").html(html);
 };

function showFoundDataII(data){
  console.log(data)   
 };
 
 
 function showFoundDatairregular(data){
     
     var html="";
        html+="<table id='t2' class='tableRecords1'><tr id='fixedRow'>";
        for(var j=0; j<arryColSECOP.length ;j++){
            html+="<th>"+replace(arryColSECOP[j])+"</th>";
            }
        html+="</tr>";
        $(".Irregular").html(html); 
        for(var i=0; i<data.length ;i++){ 
            html+="<tr>";
            arryFormattedData=[];
            var aux=0;
            for(var j=0; j<Object.values(data[i]).length ;j++){
                if(Object.keys(data[i])[j]==arryColSECOP[aux]){
                    arryFormattedData[aux]=Object.values(data[i])[j];
                }
                else{
                    arryFormattedData[aux]="No Data";
                    aux++;                    
                    arryFormattedData[aux]=Object.values(data[i])[j];
                }
                aux++;                             
            }
            for(var j=0; j<arryFormattedData.length ;j++){
                html+="<td>"+arryFormattedData[j]+"</td>";
                
            }
            html+="</tr>";
        } 
        html+="</table>";
    $(".Irregular").html(html); 
 }
function domap(){
    map = L.map('map').setView([4.4, -74.2], 10);
	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		maxZoom: 11,
                minZoom: 10,
		attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors ',
		id: 'mapbox.light'
	}).addTo(map);
	var info = L.control();
	info.onAdd = function (map) {
		this._div = L.DomUtil.create('div', 'info');
		this.update();
		return this._div;
	};
	info.update = function (props) {
		this._div.innerHTML = '<div class="logo"><img style="width: 240px" src="image/logo.png"/></div>'+(props ? '<div class="infoLocal"><h4 class="titulo">Alcaldía Local de<br><br>'+props.NOMBRE+'</h4>\n\
                        <p class="desc">Herramienta de control preventivo a posibles señales de irregularia en procesos de obra publica</p><div class="subtitulo">INDICADORES</div><h> \n\
                        <div class="indicadores"><img style="width: 50px; margin-top: 15px; margin-left: 20px" src="image/Recurso_1.png"/> <l style="font-size: 15px; margin-left: 5px;">Obras Publicas <strong style="font-size: 20px;">' + props.Contraros+ '</strong></l></div>\n\
                        <div class="indicadores"><img style="width: 50px; margin-top: 15px; margin-left: 20px" src="image/alerta.png"/> <l style="font-size: 15px; margin-left: 5px;">Alertas Encontradas <strong style="font-size: 20px;">' + props.Irregulariades+ '</strong></l></div>\n\
                        <div>'
			: '<br><p style="width: 300px; margin: 20px auto" align="center">Visite cada localdiad para ver la <br> contración en Obras Publicas</p>');
	};
	info.addTo(map);
	function getColor(d) {
		return d > 10 ? '#FF3333' :
                       d > 5  ? '#FF9966' :
                                '#FFFF99';
	}
	function style(feature) {
		return {
			weight: 2,
			opacity: 1,
			color: 'white',
			dashArray: '3',
			fillOpacity: 0.7,
			fillColor: getColor(feature.properties.Irregulariades)
		};
	}
	function highlightFeature(e) {
		var layer = e.target;

		layer.setStyle({
			weight: 5,
			color: '#666',
			dashArray: '',
			fillOpacity: 0.7
		});

		if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
			layer.bringToFront();
		}

		info.update(layer.feature.properties);
	}

	var geojson;
	function resetHighlight(e) {
		geojson.resetStyle(e.target);
		info.update();
	}

	function zoomToFeature(e) {
            var layer = e.target;
            $("#titulo").html(layer.feature.properties.NOMBRE);
            $(".info").show("slow");

	}

	function onEachFeature(feature, layer) {
		layer.on({
			mouseover: highlightFeature,
			mouseout: resetHighlight,
			click: zoomToFeature
		});
	}

	geojson = L.geoJson(bogota, {
		style: style,
		onEachFeature: onEachFeature
	}).addTo(map);

	map.attributionControl.addAttribution('Population data &copy; <a href="https://www.colombiacompra.gov.co/">Colombia Compra Eficiente</a>');


	var legend = L.control({position: 'bottomleft'});

	legend.onAdd = function (map) {

		var div = L.DomUtil.create('div', 'info legend'),
			grades = [0, 5, 10],
			labels = ["Numero de irregularidades"],
			from, to;

		for (var i = 0; i < grades.length; i++) {
			from = grades[i];
			to = grades[i + 1];
			labels.push(
				'<i style="background:' + getColor(from + 1) + '"></i> ' +
				from + (to ? '&ndash;' + to : '+'));
		}

		div.innerHTML = labels.join('<br>');
		return div;
	};

	legend.addTo(map);
}
</script>
</body>
</html>