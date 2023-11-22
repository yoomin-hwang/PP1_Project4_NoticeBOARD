<%--
  Created by IntelliJ IDEA.
  User: Yoomin Hwang
  Date: 2023-11-17
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String filename = "";
    int sizeLimit = 15*1024*1024;

    String realPath = request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if(!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    filename = multipartRequest.getFilesystemName("img");
%>

파일명: <%=filename%><br/>
<img src="${pageContext.request.contextPath}/upload/<%=filename%>">
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="fileupload_ok.jsp" method="post" enctype="multipart/form-data">
    파일 선택 : <input type="file" name="img"/>
    <input type="submit" value="업로드" />

</form>

</body>
</html>