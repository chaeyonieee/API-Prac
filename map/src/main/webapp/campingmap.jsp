<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>���� ķ���� ��Ȳ</title>
</head>
<body>
  <h1>���� ķ���� ��Ȳ</h1>

  <!-- ������ ǥ���� div �Դϴ� -->
  <div id="map" style="width:100%;height:700px;"></div>
<!--  �÷��� �� https://localhost:8080 -->
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a56ebb1c6ad3ff9da7c6b9a8286d236&libraries=clusterer"></script>
  <script>
  const lat = 36.3492506;
  const lng = 127.3776511;

    var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
        mapOption = { 
            center: new kakao.maps.LatLng(lat, lng), // ������ �߽���ǥ - �׸���ǻ��
            level: 14 // ������ Ȯ�� ����
        };

    // ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // ��Ŀ Ŭ�����ͷ��� �����մϴ� 
    var clusterer = new kakao.maps.MarkerClusterer({
      map: map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
      averageCenter: true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
      minLevel: 10 // Ŭ������ �� �ּ� ���� ���� 
    });

    // �������� �������� (�������� API)
    const  url = 'https://apis.data.go.kr/B551011/GoCamping/basedList?numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=testAPP&serviceKey=8GpftkvT6FsqBQrob5a6HC8TyaDNFTW6FRqC2rfCSpuQEzKSbppB%2FQBwf0qTjeDoIgLfpZe4d%2BZBndumjPVd%2BA%3D%3D&_type=json';

    fetch(url)
    .then(result => result.json())   // json ������ ��ü�� ��ȯ
    .then(json => {                     
      // console.log(json);              
      const data = json.response.body.items.item;  // ��ü���� ���� ���븸 data�� ����   
      console.log(data);

    // ��Ŀ���� ��Ƴ��� ����
    var markers = [];

    for(let i = 0; i < data.length; i++) {  
      // ��Ŀ�� �����մϴ�
      var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(data[i].mapY, data[i].mapX)
      });

      markers.push(marker);   // ��Ŀ�� �迭�� �߰��մϴ�

      var infowindow = new kakao.maps.InfoWindow( {
          content : data[i].facltNm   // ���������쿡 ǥ���� ����
      });

      // ��Ŀ�� �̺�Ʈ�� ����մϴ�
      // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
      // Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�

      // ��Ŀ�� ���콺�����ϸ� makeOverListener() ����
      kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));  
      // ��Ŀ���� ���콺�ƿ��ϸ� makeOutListener() ����
      kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));   
    }

    // ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
    function makeOverListener(map, marker, infowindow) {
        return function() {
            infowindow.open(map, marker);          
        };
    }

    // ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
    function makeOutListener(infowindow) {
        return function() {
            infowindow.close();
        };
    }

    clusterer.addMarkers(markers);
  });  // fetch ��
  </script>
</body>
</html>