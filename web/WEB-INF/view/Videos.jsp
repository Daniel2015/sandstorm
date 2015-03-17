<sql:query var="songs" dataSource="jdbc/sandstorm">
    SELECT * FROM Songs
</sql:query>
<c:forEach var="song" items="${songs.rows}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">${song.song_name} <em>by</em> <a href="song?${song.song_id}">${song.song_artist}</a></h3>
        </div>
        <div>
            <audio controls>
                <source src="<%=request.getContextPath()%>/songs/${song.song_name}.mp3" type="audio/mpeg">
            </audio>
        </div>
    </div>
</c:forEach>