<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>API���� �ڷ� ��������</title>
</head>
<body>
  <script>
    // �������� ��������
    var  url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?ServiceKey=FSYGYSHOVs2%2BJnU1JYGsvu95uuPcadpsYhM84SBOWXXCO4eHbhLP4efKKIz8PLbyO6tf93i5ajseadFg%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json';

    fetch(url)
    .then(result => result.json())   // json ������ ��ü�� ��ȯ
    .then(json => {                     
      // console.log(json);  
      const data = json.response.body.items.item;  // ��ü���� ���� ���븸 data�� ����   
      console.log(data);            
    });
  </script>
</body>
</html>