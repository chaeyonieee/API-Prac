
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>���� �����ϱ�</title>
    
</head>
<body>
<!-- ������ ǥ���� div �Դϴ� -->
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a56ebb1c6ad3ff9da7c6b9a8286d236"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>
</body>
</html>