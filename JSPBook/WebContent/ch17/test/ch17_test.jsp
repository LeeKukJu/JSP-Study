<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
   문제)
   304호 전원의 이름을 리스트에 저장하고 또는 배열에 저장하고
   각 성씨의 명수를 출력해주세요.
   
   '홍'씨 성을 가진 사람 몇 명 : 2명
   '유'씨 성을 가진 사람 몇 명 : 6명
   '정'씨 성을 가진 사람 몇 명 : 4명
    ....
    ....
 -->
    
    <c:set value="0" var="hongCnt"/>
    <c:set value="0" var="yuCnt"/>
    <c:set value="0" var="jeongCnt"/>
    <c:set value="0" var="haCnt"/>
    <c:set value="0" var="parkCnt"/>
    <c:set value="0" var="gilCnt"/>
    <c:set value="0" var="noCnt"/>
  
<c:set value="홍길동,홍길순,유재석,정형돈,하동훈,정준하,박명수,김성준,노홍철" var="names"/>
<c:set value="${fn:split(names, ',')}" var="name"/>

<c:forEach items="${name }" var="nm" varStatus="stat">
   <c:choose>
      <c:when test="${fn:substring(name[stat.index],0,1) == '홍' }">
         <c:set value="${hongCnt +1 }" var="hongCnt"/>
      </c:when>
      <c:when test="${fn:substring(name[stat.index],0,1) == '유' }">
         <c:set value="${yuCnt +1 }" var="yuCnt"/>
      </c:when>
      <c:when test="${fn:substring(name[stat.index],0,1) == '정' }">
         <c:set value="${jeongCnt +1 }" var="jeongCnt"/>
      </c:when>
      <c:when test="${fn:substring(name[stat.index],0,1) == '하' }">
         <c:set value="${haCnt +1 }" var="haCnt"/>
      </c:when>
      <c:when test="${fn:substring(name[stat.index],0,1) == '박' }">
         <c:set value="${parkCnt +1 }" var="parkCnt"/>
      </c:when>
      <c:when test="${fn:substring(name[stat.index],0,1) == '길' }">
         <c:set value="${gilCnt +1 }" var="gilCnt"/>
      </c:when>
      <c:when test="${fn:substring(name[stat.index],0,1) == '노' }">
         <c:set value="${noCnt +1 }" var="noCnt"/>
      </c:when>
   </c:choose>
   <hr/>
   <p>[${stat.count }]당신의 이름은? ${nm }</p>
   <font color="red" style="font-size:10px;">
      '${fn:substring(name[stat.index],0,1) }'씨 Count 증가!
   </font>
   <table>
      <tr>
         <td>홍</td><td>유</td><td>정</td><td>하</td><td>박</td><td>길</td><td>노</td>
      </tr>
      <tr>
         <td>${hongCnt }</td><td>${yuCnt }</td><td>${jeongCnt }</td><td>${haCnt }</td><td>${parkCnt }</td><td>${gilCnt }</td>
         <td>${noCnt }</td>
      </tr>
   </table>
   <hr/>
</c:forEach>

<h3>최종집계결과!!!</h3>
   <table border="1" width="100%">
      <tr align="center">
         <td>홍</td><td>유</td><td>정</td><td>하</td><td>박</td><td>길</td><td>노</td>
      </tr>
      <tr align="center">
         <td>${hongCnt }</td><td>${yuCnt }</td><td>${jeongCnt }</td><td>${haCnt }</td><td>${parkCnt }</td><td>${gilCnt }</td>
         <td>${noCnt }</td>
         
      </tr>
   </table>
</body>
</html>