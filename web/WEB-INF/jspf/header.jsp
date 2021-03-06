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
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sandstorm</title>

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
                <h3>Hello, <%=session.getAttribute("first_name")%> <%=session.getAttribute("last_name")%>
                </h3>
            </div>
            <div><paper-button style=" color: white; width:100%;"
                               onclick="location.href = '<%=request.getContextPath()%>/logoutUser'" >
                    Logout</paper-button>
            </div>
            <div><paper-button style=" color: white; width:100%;"
                               onclick="location.href = '<%=request.getContextPath()%>/Account'" >
                    My Account</paper-button>
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
            <script>
                $(function () {
                    $(document.body).on('click', "a[rel='tab']", function (e) {
//e.preventDefault();
                        /*
                         if uncomment the above line, html5 nonsupported browers won't change the url but will display the ajax content;
                         if commented, html5 nonsupported browers will reload the page to the specified link.
                         */

//get the link location that was clicked
                        pageurl = $(this).attr('href');

//to get the ajax content and display in div with id 'content'
                        $.ajax({url: pageurl + '?rel=tab', success: function (data) {
                                $('#content').html(data);
                            }});

//to change the browser URL to the given link location
                        if (pageurl != window.location) {
                            window.history.pushState({path: pageurl}, '', pageurl);
                        }
//stop refreshing to the page given in
                        return false;
                    });
                });
                $(window).bind('popstate', function () {
                    $.ajax({url: location.pathname + '?rel=tab', success: function (data) {
                            $('#content').html(data);
                        }});
                });
            </script>
            <a href="Login" rel="tab">menu1</a> |
            <a href="Register" rel="tab">menu2</a> |
            <a href="Account" rel="tab">menu3</a>

            <audio controls>
                <source src="<%=request.getContextPath()%>/songs/foo.mp3" type="audio/mpeg">
            </audio>

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
            <div id="content" fit>