
//<![CDATA[
$(document).ready(function(){

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
