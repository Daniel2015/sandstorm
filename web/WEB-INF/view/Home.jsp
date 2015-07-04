<body>
    <canvas id="main" width="578" height="200"></canvas>
    <h2> Listen to your favorite songs everywhere and with everyone, </br> because music brings us together </h2>
    
</body>

<style>
   
#content{ 
    background:black  url("img/storm.jpg")no-repeat fixed center;
   
  }
  #main{
    margin-left:4%;
    margin-top:10%;
 
   
}
h2{
    margin-top:30%;
    text-shadow: 0 0 7px #00FFFF;
    font-family: Verdana;
    color: white;
    opacity:0.6;
    float: right;
    font-size: 100%;
    margin-right:2%;
    line-height: 150%;

    
}


    
    
</style>
<script>
(function(win, doc) {
    
    "use strict";
    
    var main = doc.getElementById("main"),
        mainCtx = main.getContext("2d"),
        sub = doc.createElement("canvas"),
        subCtx = sub.getContext("2d"),
        i = 0,
        WIDTH = 250,
        HEIGHT = 50,
        SIZE = 5,
        INTERVAL = 5;
    
    main.width = sub.width = WIDTH;
    main.height = sub.height = HEIGHT;
  
    build(0);
       
    setInterval(function() {
        main.width = WIDTH;
			 mainCtx.font = "30px AvenirNext-Heavy";
      mainCtx.fillStyle = 'white';
       
        
       mainCtx.fillText("SANDSTORM", 60, 30);
        mainCtx.globalCompositeOperation = "destination-in";
        mainCtx.drawImage(sub, 0, 0);
    }, 1000 / 24);
    
    function build(i) {
        var height = HEIGHT / SIZE,
            max = (i + 1 < height) ? (i + 1) : height;
        
        (function setRect(j) {
            if (j < max) {
                subCtx.rect((i -j) * SIZE, j * SIZE, SIZE, SIZE);
                subCtx.fill();
                setTimeout(function() {
                    setRect(++j);
                }, INTERVAL);
            } else {
                if ((i - HEIGHT / SIZE) * SIZE < win.innerWidth) {
                    build(++i);
                }
            }
        })(0);
    }
    
})(this, document);
    </script>