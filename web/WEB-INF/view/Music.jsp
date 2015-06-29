<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<div class="panel">
    <h2>Music</h2>
    <p>This is the whole set of music files</p>            
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
            <sql:query var="result" dataSource="jdbc/sandstorm">
                SELECT SONG_ID, SONG_NAME, ARTIST_NAME, SONG_GENRE, SONG_ALBUM, SONG_YEAR FROM SONGSET
            </sql:query>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.SONG_NAME}"/></td>
                    <td><c:out value="${row.ARTIST_NAME}"/></td>
                    <td><c:out value="${row.SONG_GENRE}"/></td>
                    <td><c:out value="${row.SONG_ALBUM}"/></td>
                    <td><c:out value="${row.SONG_YEAR}"/></td>
                    <td> <form method="POST" action="PlaylistServlet"  name="addSong">

                            <input type="hidden" id="songID" name="songID" value="<c:out value="${row.SONG_ID}"/>"/> 
                            <input type="hidden" id="userId" name="userID" value="<%=session.getAttribute("user_id")%>"/>  
                            <button class="btn btn-success" style="width: 100%;">Add</button>
                        </form></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

