<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="model.User"%>
<%@page import="model.UserBean"%>
<!DOCTYPE html>
<html ng-app="phonecatApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="bower_components/webcomponentsjs/webcomponents.min.js"></script>
        <link rel="import" href="bower_components/paper-elements/paper-elements.html">
        <link rel="import" href="bower_components/core-elements/core-elements.html">
        <link rel="import" href="bower_components/paper-input/paper-char-counter.html">
        <!-- angularJS 1.3.14 -->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>

        <!-- jquery 2.1.3 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/main.css">

        <script>
            document.addEventListener('polymer-ready', function () {
                var navicon = document.getElementById('navicon');
                var drawerPanel = document.getElementById('drawerPanel');
                navicon.addEventListener('click', function () {
                    drawerPanel.togglePanel();
                });
            });
        </script>
    </head>
    <body fullbleed vertical layout>
    <core-drawer-panel id="drawerPanel">
        <core-header-panel id="side_header" navigation style="background-color: #534f4f; opacity: 0.90;" drawer>
            <core-toolbar style="background-color: #56BA89;">Sandstorm</core-toolbar>

            <%          if (session.getAttribute("username") != null) {%>

            <div style="color:white;">
                <h3>Hello, <%=session.getAttribute("first_name")%> <%=session.getAttribute("first_name")%>
                </h3>
            </div>
            <div><paper-button style=" color: white; width:100%;"
                               onclick="location.href = '<%=request.getContextPath()%>/logoutUser'" >
                    Logout</paper-button>
            </div>
                    
            <% } else {%>
            
            <div><paper-button
                    <c:choose><c:when test="${pageContext.request.requestURI.endsWith('/Login.jsp')}">
                            style=" color: red; width:100%;"
                        </c:when><c:otherwise>
                            style=" color: white; width:100%;"
                        </c:otherwise></c:choose> 
                    onclick="location.href = '<%=request.getContextPath()%>/Login'" >
                    Login</paper-button>
            </div>
            <div><paper-button
                    <c:choose><c:when test="${pageContext.request.requestURI.endsWith('/Register.jsp')}">
                            style=" color: red; width:100%;"
                        </c:when><c:otherwise>
                            style=" color: white; width:100%;"
                        </c:otherwise></c:choose> 
                    onclick="location.href = '<%=request.getContextPath()%>/Register'" >
                    Register</paper-button>
            </div>
                    
            <% }%>

        </core-header-panel>
        <core-header-panel main flex mode="seaded">
            <core-toolbar id="main_header">
                <paper-tabs selected="0" style="display: inline-block; width: 100%;">
                    <paper-tab onclick="">Music</paper-tab>
                    <paper-tab>Radio</paper-tab>
                    <paper-tab>Playlists</paper-tab>
                    <paper-tab>Search</paper-tab>
                    <paper-tab>About us</paper-tab>
                </paper-tabs>
                <paper-icon-button id="menu_toggle" icon="menu" core-drawer-toggle></paper-icon-button>
            </core-toolbar>
            <div fit>