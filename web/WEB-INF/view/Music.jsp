<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="model.SongBean"%>
<%@page import="model.Song"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
            <%
                response.setCharacterEncoding("UTF-8");
                SongBean s = new SongBean();
                List<Song> list = s.getSongs();
                String json = new Gson().toJson(list);
                List<String> asd= s.searchSongs();
                String jsons = new Gson().toJson(asd);
              %>
<script>
    $(function () {
        var availableTags = <%=jsons%>;
        $("#tags").autocomplete({
            source: availableTags
        });
    });
</script>
<div class="panel">
    <h2>Music</h2>
    <p>This is the whole set of music files</p>  
    <div>
        <label for="tags">Tags: </label>
        <input id="tags">
    </div>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Artist</th>
                <th>Song</th>
                <th>Genre</th>
                <th>Album</th>
                <th>Year</th>
                <th>Add to playlist</th>
            </tr>
        </thead>
        <tbody>
<%  for (Song song : list) {
            %>
            <tr>
                <td><%=song.getArtist()%></td>
                <td><%=song.getSongName()%></td>
                <td><%=song.getGenre()%></td>
                <td><%=song.getAlbum()%></td>
                <td><%=song.getYear()%></td>
                <td> <form method="POST" action="PlaylistServlet"  name="addSong">

                        <input type="hidden" id="songID" name="songID" value="<%=song.getSongId()%>"/> 
                        <input type="hidden" id="userId" name="userID" value="<%=session.getAttribute("user_id")%>"/>  
                        <button class="btn btn-success" style="width: 100%;">Add</button>
                    </form></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

