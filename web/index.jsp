<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="model.User"%>
<%@page import="model.UserBean"%>
<!DOCTYPE html>
<html ng-app="sandstormApp">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sandstorm</title>
        <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
        <link type="text/css" href="css/jplayer.pink.flag.css" rel="stylesheet" />
        <script src="bower_components/webcomponentsjs/webcomponents.min.js"></script>
        <link rel="import" href="bower_components/paper-elements/paper-elements.html">
        <link rel="import" href="bower_components/core-elements/core-elements.html">
        <link rel="import" href="bower_components/paper-input/paper-char-counter.html">
        <!-- angularJS 1.3.14 -->
        <script src="bower_components/angular/angular.min.js"></script>
        <script src="bower_components/angular-route/angular-route.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/slide.css">
  <!-- Radio js -->
        <script type="text/javascript" src="js/coverflow-slideshow.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/main.css">
        <script src="js/route.js"></script>
        <script type="text/javascript" src="js/jquery.jplayer.min.js"></script>
        <script type="text/javascript" src="js/jplayer.playlist.min.js"
        <script type="text/javascript" src="js/jPlayerInit.js"></script>
         

        </head>
        <body fullbleed vertical layout ng-controller="mainController">
        <core-drawer-panel id="drawerPanel">
            <core-header-panel id="side_header" navigation style="background-color: #534f4f; opacity: 0.90;" drawer>
                <core-toolbar style="background-color: #56BA89;">

                    Sandstorm <paper-icon-button id="menu_toggle_mobile" icon="menu" core-drawer-toggle></paper-icon-button></core-toolbar>

                <%          if (session.getAttribute("username") != null) {%>

                <div style="color:white;">
                    <h5>Hello, <%=session.getAttribute("first_name")%> <%=session.getAttribute("last_name")%>
                    </h5>
                </div>
                <div><paper-button style=" color: white; width:100%; margin:0 0px;"
                                   onclick="location.href = '<%=request.getContextPath()%>/logoutUser'">
                        Logout</paper-button>
                </div>
                <div><paper-button style=" color: white; width:100%; margin:0 0px;"
                                   onclick="location.href = '<%=request.getContextPath()%>/#/Account'">
                        My Account</paper-button>
                </div>
                <div><paper-button style=" color: white; width:100%; margin:0 0px;"
                                   onclick="location.href = '<%=request.getContextPath()%>/#/Profile'">
                        Profile</paper-button>
                </div>
                <div><paper-button style=" color: white; width:100%; margin:0 0px;"
                                   onclick="location.href = '<%=request.getContextPath()%>/#/Upload'">
                        Upload Music</paper-button>
                </div>
                <% } else {%>

                <div><paper-button
                        <c:choose><c:when test="${pageContext.request.requestURI.endsWith('/Login.jsp')}">
                                style=" color: red; width:100%; margin:0 0px;"
                            </c:when><c:otherwise>
                                style=" color: white; width:100%; margin:0 0px;"
                            </c:otherwise></c:choose> 
                        onclick="location.href = '<%=request.getContextPath()%>/#/Login'">
                        Login</paper-button>
                </div>
                <div><paper-button
                        <c:choose><c:when test="${pageContext.request.requestURI.endsWith('/Register.jsp')}">
                                style=" color: red; width:100%; margin:0 0px;"
                            </c:when><c:otherwise>
                                style=" color: white; width:100%; margin:0 0px;"
                            </c:otherwise></c:choose> 
                        onclick="location.href = '<%=request.getContextPath()%>/#/Register'">
                        Register</paper-button>
                </div>

                <% }%>
                <script>

                            //<![CDATA[
                            $(document).ready(function () {

                                new jPlayerPlaylist({
                                    jPlayer: "#jquery_jplayer_1",
                                    cssSelectorAncestor: "#jp_container_1"
                                }, [
                                    {
                                        title: "Bubble",
                                        mp3: "songs/foo.mp3"
                                    },
                                    {
                                        title: "Bubbles",
                                        mp3: "songs/foo2.mp3"
                                    },
                                    {
                                        title: "Bubbles",
                                        mp3: "songs/foo3.mp3"
                                    },
                                    {
                                        title: "Bubbles",
                                        mp3: "songs/foo4.mp3"
                                    },
                                    {
                                        title: "Bubbles",
                                        mp3: "songs/foo5.mp3"
                                    },
                                    {
                                        title: "Bubbles",
                                        mp3: "songs/foo6.mp3"
                                    },
                                    {
                                        title: "Bubbles",
                                        mp3: "songs/foo7.mp3"
                                    },
                                    {
                                        title: "Bubbles",
                                        mp3: "songs/foo8.mp3"
                                    },
                                    {
                                        title: "Bubbles",
                                        mp3: "songs/foo9.mp3"
                                    }
                                ], {
                                    swfPath: "/js",
                                    supplied: "mp3",
                                    wmode: "window",
                                    useStateClassSkin: true,
                                    autoBlur: false,
                                    smoothPlayBar: true,
                                    keyEnabled: true
                                });
                            });
                            //]]>

                </script>
                <div id="jquery_jplayer_1" class="jp-jplayer"></div>
                <div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
                    <div class="jp-type-playlist">
                        <div class="jp-gui jp-interface">
                            <div class="jp-volume-controls">
                                <button class="jp-mute" role="button" tabindex="0">mute</button>
                                <button class="jp-volume-max" role="button" tabindex="0">max volume</button>
                                <div class="jp-volume-bar">
                                    <div class="jp-volume-bar-value"></div>
                                </div>
                            </div>
                            <div class="jp-controls-holder">
                                <div class="jp-controls">
                                    <button class="jp-previous" role="button" tabindex="0">previous</button>
                                    <button class="jp-play" role="button" tabindex="0">play</button>
                                    <button class="jp-stop" role="button" tabindex="0">stop</button>
                                    <button class="jp-next" role="button" tabindex="0">next</button>
                                </div>
                                <div class="jp-progress">
                                    <div class="jp-seek-bar">
                                        <div class="jp-play-bar"></div>
                                    </div>
                                </div>
                                <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                                <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                                <div class="jp-toggles">
                                    <button class="jp-repeat" role="button" tabindex="0">repeat</button>
                                    <button class="jp-shuffle" role="button" tabindex="0">shuffle</button>
                                </div>
                            </div>
                        </div>
                        <div class="jp-playlist">
                            <ul>
                                <li>&nbsp;</li>
                            </ul>
                        </div>
                        <div class="jp-no-solution">
                            <span>Update Required</span>
                            To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                        </div>
                    </div>
                </div>



            </core-header-panel>

            <core-header-panel main flex mode="seaded">
                <core-toolbar id="main_header">
                    <paper-tabs selected="0" style="display: inline-block; width: 100%; margin:0 0px;">

                        <paper-tab <% if (session.getAttribute("username") == null) {%> onclick="location.href = '<%=request.getContextPath()%>/#/Login'" <% } else {%> onclick="location.href = '<%=request.getContextPath()%>/#/Music'" <% } %>>Music</paper-tab>
                        <paper-tab <% if (session.getAttribute("username") == null) {%> onclick="location.href = '<%=request.getContextPath()%>/#/Login'" <% } else {%> onclick="location.href = '<%=request.getContextPath()%>/#/Radio'" <% } %>>Radio </paper-tab>
                        <paper-tab <% if (session.getAttribute("username") == null) {%> onclick="location.href = '<%=request.getContextPath()%>/#/Login'" <% } else {%> onclick="location.href = '<%=request.getContextPath()%>/#/Playlists'" <% }%>>Playlists</paper-tab>
                        <paper-tab <% if (session.getAttribute("username") == null) {%> onclick="location.href = '<%=request.getContextPath()%>/#/Login'" <% } else {%> onclick="location.href = '<%=request.getContextPath()%>/#/Users'" <% }%>>Users</paper-tab>
                        <paper-tab>About us</paper-tab>
                    </paper-tabs>
                    <paper-icon-button id="menu_toggle" icon="menu" core-drawer-toggle></paper-icon-button>
                </core-toolbar>
                <div ng-view id="content" fit>
                    {{ message}}
                    Index page
                </div>     
            </core-header-panel>
        </core-drawer-panel>                 
        <footer>
        </footer>                  
    </body>
</html>
