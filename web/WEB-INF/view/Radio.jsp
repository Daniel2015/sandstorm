
<link rel="stylesheet" type="text/css" href="css/slide.css">
<script type="text/javascript" src="js/coverflow-slideshow.js"></script>

<div id="jquery-script-menu">


    <script>
//<![CDATA[
        $(document).ready(function () {

            var stream2 = {
                title: "Z-rock",
                mp3: "http://46.10.150.243/z-rock.mp3"
            },
            ready = false;

            $("#jquery_jplayer_2").jPlayer({
                ready: function (event) {
                    ready = true;
                    $(this).jPlayer("setMedia", stream2);
                },
                pause: function () {
                    $(this).jPlayer("clearMedia");
                },
                error: function (event) {
                    if (ready && event.jPlayer.error.type === $.jPlayer.error.URL_NOT_SET) {
                        // Setup the media stream again and play it.
                        $(this).jPlayer("setMedia", stream2).jPlayer("play");
                    }
                },
                swfPath: "js",
                supplied: "mp3",
                preload: "none",
                wmode: "window",
                useStateClassSkin: true,
                cssSelectorAncestor: '#jp_container_2',
                autoBlur: false,
                keyEnabled: true,
                cssSelector: {
                    videoPlay: '.jp-video-play',
                    play: '.jp-play2'}
            });


            var stream3 = {
                title: "Njoy",
                mp3: "http://46.10.150.243/njoy.mp3"
            },
            ready = false;

            $("#jquery_jplayer_3").jPlayer({
                ready: function (event) {
                    ready = true;
                    $(this).jPlayer("setMedia", stream3);
                },
                pause: function () {
                    $(this).jPlayer("clearMedia");
                },
                error: function (event) {
                    if (ready && event.jPlayer.error.type === $.jPlayer.error.URL_NOT_SET) {
                        // Setup the media stream again and play it.
                        $(this).jPlayer("setMedia", stream3).jPlayer("play");
                    }
                },
                swfPath: "js",
                supplied: "mp3",
                preload: "none",
                wmode: "window",
                useStateClassSkin: true,
                autoBlur: false,
                keyEnabled: true,
                cssSelectorAncestor: '#jp_container_3',
                cssSelector: {
                    videoPlay: '.jp-video-play',
                    play: '.jp-play3'}
            });

   var stream4 = {
                title: "VIVA EL MARIACHI - MEXICO CITY",
                mp3: "http://streaming64.radionomy.com/viva-el-mariachi"
            },
            ready = false;

            $("#jquery_jplayer_4").jPlayer({
                ready: function (event) {
                    ready = true;
                    $(this).jPlayer("setMedia", stream4);
                },
                pause: function () {
                    $(this).jPlayer("clearMedia");
                },
                error: function (event) {
                    if (ready && event.jPlayer.error.type === $.jPlayer.error.URL_NOT_SET) {
                        // Setup the media stream again and play it.
                        $(this).jPlayer("setMedia", stream4).jPlayer("play");
                    }
                },
                swfPath: "js",
                supplied: "mp3",
                preload: "none",
                wmode: "window",
                useStateClassSkin: true,
                autoBlur: false,
                keyEnabled: true,
                cssSelectorAncestor: '#jp_container_4',
                cssSelector: {
                    videoPlay: '.jp-video-play',
                    play: '.jp-play4'}
            });

        });
//]]>
    </script>
    <div id="jquery_jplayer_2" class="jp-jplayer"></div>
    <div id="jquery_jplayer_3" class="jp-jplayer"></div>
        <div id="jquery_jplayer_4" class="jp-jplayer"></div>
    <div class="stage">
        <h2>Metal/Rock</h2>
        <div class="cbImage"><img src="img/daysofmetal.jpeg" alt="Alt" /></div>
        <div id="jp_container_3" class="cbImage jp-controls jp-controls-holder jp-gui jp-interface jp-playlist jp-type-playlist"><img class= "jp-play3" role="button" tabindex="0" src="img/njoy.jpg" alt="Alt" /></div>
        <div id="jp_container_2" class="cbImage active jp-controls jp-controls-holder jp-gui jp-interface jp-playlist jp-type-playlist"><img class= "jp-play2" role="button" tabindex="0"  src="img/zrock.jpg" alt="Alt" /></div>
        <div id="jp_container_4" class="cbImage jp-controls jp-controls-holder jp-gui jp-interface jp-playlist jp-type-playlist"><img  class= "jp-play4" role="button" tabindex="0" src="img/radiometal.jpg" alt="Alt" /></div>
        <div class="cbImage"><img src="img/suck.jpg" alt="Alt" /></div>

    </div>
    <div class="controls">
        <div class="cbcontrol" id="cbControlRight"><</div>
        <div class="cbcontrol" id="cbControlLeft">></div>
        <div class="clear"></div>
    </div>