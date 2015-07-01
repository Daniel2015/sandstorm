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
<div class="">
    <h2>Music</h2>
  
    <div class="tagfield">
        <label for="tags">Tags: </label>
        <input id="tags">
    </div>
    <div class="panel">
    <table class="blue">
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
        </div>

        <style>
            body{
  font:1.2em normal Arial,sans-serif;
  color:white;
  background-color: black;
}

h1{
  text-align:center;
  text-transform:uppercase;
  letter-spacing:-2px;
  font-size:2.5em;
  margin:20px 0;
}

.container{
  width:90%;
  margin:auto;
}

table{
  border-collapse:collapse;
  width:100%;
}



.blue thead{
  background:#1ABC9C;
}



thead{
  color:white;
  padding:5px;
}

th,td{
  text-align:center;
  padding:5px 0;
  color:white
}

tbody tr:nth-child(even){
  background:#ECF0F1;
}

tbody tr:hover{
background:#BDC3C7;
  color:#FFFFFF;
}

.fixed{
  top:0;
  position:fixed;
  width:auto;
  display:none;
  border:none;
}



.up{
  cursor:pointer;
}
.panel{
    margin-left: 3%;
    margin-right: 3%;
    background-color: black;
    
    
}
.tagfield{margin-left:10%;}
        </style>
        <script>
            ;(function($) {
   $.fn.fixMe = function() {
      return this.each(function() {
         var $this = $(this),
            $t_fixed;
         function init() {
            $this.wrap('<div class="container" />');
            $t_fixed = $this.clone();
            $t_fixed.find("tbody").remove().end().addClass("fixed").insertBefore($this);
            resizeFixed();
         }
         function resizeFixed() {
            $t_fixed.find("th").each(function(index) {
               $(this).css("width",$this.find("th").eq(index).outerWidth()+"px");
            });
         }
         function scrollFixed() {
            var offset = $(this).scrollTop(),
            tableOffsetTop = $this.offset().top,
            tableOffsetBottom = tableOffsetTop + $this.height() - $this.find("thead").height();
            if(offset < tableOffsetTop || offset > tableOffsetBottom)
               $t_fixed.hide();
            else if(offset >= tableOffsetTop && offset <= tableOffsetBottom && $t_fixed.is(":hidden"))
               $t_fixed.show();
         }
         $(window).resize(resizeFixed);
         $(window).scroll(scrollFixed);
         init();
      });
   };
})(jQuery);

$(document).ready(function(){
   $("table").fixMe();
   $(".up").click(function() {
      $('html, body').animate({
      scrollTop: 0
   }, 2000);
 });
});</script>
