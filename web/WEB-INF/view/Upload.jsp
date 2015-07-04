<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<style>
    .btn-file {
        position: relative;
        overflow: hidden;
    }
    .btn-file input[type=file] {
        position: absolute;
        top: 0;
        right: 0;
        min-width: 100%;
        min-height: 100%;
        font-size: 100px;
        text-align: right;
        filter: alpha(opacity=0);
        opacity: 0;
        outline: none;
        background: white;
        cursor: inherit;
        display: block;
    }
</style>
<div class="container">
    <div class="jumbotron">
        <h2>Upload Music</h2>
        <form method="POST" action="FileUploadServlet" enctype="multipart/form-data" >
            <span class="btn btn-primary btn-file">
                Browse <input  type="file" name="file" id="file" /> <br/>
            </span>
            <paper-input-decorator floatingLabel label="Artist" autovalidate>
                <input type="text" id="artist" name="artist" is="core-input" maxlength="30" required>
            </paper-input-decorator>
            <%--           
                   <sql:query var="result" dataSource="jdbc/sandstorm">
                          SELECT artist_name, artist_id FROM artists
                      </sql:query>
                      <select class="form-control" name="artist">
                          <c:forEach var="row" items="${result.rows}">
                              <option value="<c:out value="${row.artist_id}"/>"><c:out value="${row.artist_name}"/></option>
                          </c:forEach>
                      </select>
                      <sql:query var="results" dataSource="jdbc/sandstorm">
                          SELECT genre_id, genre_name FROM genres
                      </sql:query>
                      <select class="form-control" name="genre">
                          <c:forEach var="row" items="${results.rows}">
                              <option value="<c:out value="${row.genre_id}"/>"><c:out value="${row.genre_name}"/></option>
                          </c:forEach>
                      </select>
            --%>    

            <paper-input-decorator floatingLabel label="Song name" autovalidate>
                <input type="text" id="songName" name="songName" is="core-input" maxlength="30" required>

            </paper-input-decorator>
            <paper-input-decorator floatingLabel label="Genre" autovalidate>
                <input type="text" id="songGenre" name="songGenre" is="core-input" maxlength="30" required>

            </paper-input-decorator>
            <paper-input-decorator floatingLabel label="Album" autovalidate>
                <input type="text" id="songAlbum" name="songAlbum" is="core-input" maxlength="30" required>

            </paper-input-decorator>
            <paper-input-decorator floatingLabel label="Year" autovalidate>
                <input type="text" id="songYear" name="songYear" is="core-input" maxlength="30" required>

            </paper-input-decorator>
            <span class="btn btn-primary btn-file">
                Poster(optional) <input  type="file" name="poster" id="poster" /> <br/>
            </span>
            <input class="btn btn-success" style="width: 100%;" type="submit" value="Upload" name="upload" id="upload" />
        </form>
    </div>
</div>