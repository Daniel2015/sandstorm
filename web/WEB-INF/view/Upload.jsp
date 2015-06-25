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
            <paper-input-decorator floatingLabel label="Song name" autovalidate>
                <input type="text" id="songName" name="songName" is="core-input" maxlength="30" required>

            </paper-input-decorator>
            <input class="btn btn-success" style="width: 100%;" type="submit" value="Upload" name="upload" id="upload" />
        </form>
    </div>
</div>