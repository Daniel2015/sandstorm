<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

        <h1>Video!</h1>
        
        <sql:query var="result" dataSource="jdbc/sandstorm">
            SELECT video_url FROM Videos WHERE video_id=3
        </sql:query>
            <a href="<%=request.getContextPath()%>">Index</a>
<iframe width="420" height="315" src="${result.rows[0].video_url}" 
        allowfullscreen></iframe>

