<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/styles.css" rel="stylesheet" />
<link href="/resources/css/user/myinfo.css" rel="stylesheet" />
<title>내 정보</title>
</head>
<body>
 	<tiles:insertAttribute name="header"/>
		<div id="wrap" class="wrap shoppingid">
	  			<tiles:insertAttribute name="menu"/>
	  	<div id = "bodyTile">
		  		<tiles:insertAttribute name="content"/>
	  	</div>
	  	</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="/resources/js/scripts.js"></script>
</html>