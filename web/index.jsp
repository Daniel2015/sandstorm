<%@page import="com.google.gson.Gson"%>
<%@page import="model.SongBean.songView"%>
<%@page import="model.SongBean"%>
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
        <link type="text/css" href="css/jplayer.blue.monday.css" rel="stylesheet" />
        <script src="bower_components/webcomponentsjs/webcomponents.min.js"></script>
        <link rel="import" href="bower_components/paper-elements/paper-elements.html">
        <link rel="import" href="bower_components/core-elements/core-elements.html">
        <link rel="import" href="bower_components/paper-input/paper-char-counter.html">
        <!-- angularJS 1.3.14 -->
        <script src="bower_components/angular/angular.min.js"></script>
        <script src="bower_components/angular-route/angular-route.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/slide.css">
        <!-- Radio js -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="js/bootstrap.min.js"></script>


        <script src="js/route.js"></script>
        <script type="text/javascript" src="js/jquery.jplayer.min.js"></script>
        <script type="text/javascript" src="js/jplayer.playlist.min.js"
        <script type="text/javascript" src="js/jPlayerInit.js"></script>
            <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
            <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
            <link rel="stylesheet" type="text/css" href="css/main.css">
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
                <%--   <div><paper-button style=" color: white; width:100%; margin:0 0px;"
                onclick="location.href = '<%=request.getContextPath()%>/#/Profile'">
Profile</paper-button> --%>
                </div>
                <div><paper-button style=" color: white; width:100%; margin:0 0px;"
                                   onclick="location.href = '<%=request.getContextPath()%>/#/Upload'">
                        Upload Music</paper-button>
                </div>
                <%
                    Integer userid = (Integer) request.getSession().getAttribute("user_id");
                    SongBean p = new SongBean();
                    List<songView> jsonPlaylist = p.getPlaylist(userid);
                    String json = new Gson().toJson(jsonPlaylist);%> 
                <script>

                    //<![CDATA[
                    $(document).ready(function () {

                        new jPlayerPlaylist({
                            jPlayer: "#jquery_jplayer_1",
                            cssSelectorAncestor: "#jp_container_1"
                        },
                       <%=json%>
                                , {
                                    playlistOptions: {
                                        enableRemoveControls: true
                                    },
                                    swfPath: "/js",
                                    supplied: "webmv, ogv, m4v, oga, mp3",
                                    useStateClassSkin: true,
                                    autoBlur: false,
                                    smoothPlayBar: true,
                                    keyEnabled: true,
                                    audioFullScreen: true,
                                    wmode:"window",
                                    size: {
                                        width: "100%"
                                    }
                                });
                    });
                    //]]>

                </script>

                <div id="jp_container_1" class="jp-video jp-video-270p" style="width:100%" role="application" aria-label="media player">
                    <div class="jp-type-playlist">
                        <div id="jquery_jplayer_1" class="jp-jplayer" style="line-height: 0px;"></div>
                        <div class="jp-gui">

                            <div class="jp-interface">
                                <div class="jp-progress">
                                    <div class="jp-seek-bar">
                                        <div class="jp-play-bar"></div>
                                    </div>
                                </div>
                                <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                                <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                                <div class="jp-details">
                                    <div class="jp-title" aria-label="title">&nbsp;</div>
                                </div>
                                <div class="jp-controls-holder" style="width:100%;">
                                    <div class="jp-volume-controls" style="left: 10px;">
                                        <button class="jp-mute" role="button" tabindex="0">mute</button>
                                        <button class="jp-volume-max" role="button" tabindex="0">max volume</button>
                                        <div class="jp-volume-bar">
                                            <div class="jp-volume-bar-value"></div>
                                        </div>
                                    </div>
                                    <div class="jp-controls" style="margin-top: 30px;margin-left: 60px;">
                                        <button class="jp-previous" role="button" tabindex="0">previous</button>
                                        <button class="jp-play" role="button" tabindex="0">play</button>
                                        <button class="jp-next" role="button" tabindex="0">next</button>
                                        <button class="jp-stop" role="button" tabindex="0">stop</button>
                                    </div>
                                    <div class="jp-toggles" style="left:150px;">
                                        <button class="jp-repeat" role="button" tabindex="0">repeat</button>
                                        <button class="jp-shuffle" role="button" tabindex="0">shuffle</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="jp-playlist">
                            <ul>
                                <!-- The method Playlist.displayPlaylist() uses this unordered list -->
                                <li></li>
                            </ul>
                        </div>
                        <div class="jp-no-solution">
                            <span>Update Required</span>
                            To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                        </div>
                    </div>
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




            </core-header-panel>

            <core-header-panel main flex mode="seaded">
                <core-toolbar id="main_header">
                    <paper-tabs selected="0" style="display: inline-block; width: 100%; margin:0 0px;">
                        <paper-tab <% if (session.getAttribute("username") == null) {%> onclick="location.href = '<%=request.getContextPath()%>/#/'" <% } else {%> onclick="location.href = '<%=request.getContextPath()%>/#/'" <% } %>>Home</paper-tab>
                        <paper-tab <% if (session.getAttribute("username") == null) {%> onclick="location.href = '<%=request.getContextPath()%>/#/Login'" <% } else {%> onclick="location.href = '<%=request.getContextPath()%>/#/Music'" <% } %>>Music</paper-tab>
                        <paper-tab <% if (session.getAttribute("username") == null) {%> onclick="location.href = '<%=request.getContextPath()%>/#/Login'" <% } else {%> onclick="location.href = '<%=request.getContextPath()%>/#/Radio'" <% }%>>Radio </paper-tab> 
                            <%--                      <paper-tab <% if (session.getAttribute("username") == null) {%> onclick="location.href = '<%=request.getContextPath()%>/#/Login'" <% } else {%> onclick="location.href = '<%=request.getContextPath()%>/#/Playlists'" <% }%>>Playlists</paper-tab> --%>
                            <%--  <paper-tab <% if (session.getAttribute("username") == null) {%> onclick="location.href = '<%=request.getContextPath()%>/#/Login'" <% } else {%> onclick="location.href = '<%=request.getContextPath()%>/#/Users'" <% }%>>Users</paper-tab>                              --%>
                        <paper-tab onclick="location.href = '<%=request.getContextPath()%>/#/AboutUs'">About us</paper-tab>
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
