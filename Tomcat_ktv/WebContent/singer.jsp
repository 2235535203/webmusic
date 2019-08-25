<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8" %>	
<!DOCTYPE html>
<html lang="en">
<head>
  
<title>singer introduction </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<link href="css/albumstyle.css" rel="stylesheet" type="text/css" media="all" />

<script src="js/jquery-1.11.1.min.js"></script>

</head>
<body>
<div class="audio-main w3ls">
	<div class="audio-record-list">
	<div class="profile">
			 <div class="profile-top wthree">
				 <div class="pic-sec">
					 <div class="pic">
						 <img src="images/t3.jpg" alt=""/><!--singer photo -->
					 </div>
					 <div class="pic_info">
						 <h2>singer_name</h2><!--singer name -->
						 <h3><a href="#">gender </a></h3>
					 </div>
					 <div class="clear"></div>
				 </div>
				 <div class="media">
					 <div class="tweet">
						 <h4>2,501</h4>
						 <h5>Tweets</h5>
					 </div>
			
					 
					 <div class="clear"></div>
				 </div>
			 </div>
		 </div>
		<<div id="jquery_jplayer_1" class="jp-jplayer"></div>
			<div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
				<div class="jp-type-playlist">
					<!--<div class="jp-gui jp-interface">
						<div class="jp-controls">	
							<button class="jp-play" role="button" tabindex="0">play</button>
						</div>
						<div class="jp-progress">
							<div class="jp-seek-bar">
								<div class="jp-play-bar"></div>
							</div>
						</div>
						<div class="jp-volume-controls">
							<button class="jp-mute" role="button" tabindex="0">mute</button>
							<button class="jp-volume-max" role="button" tabindex="0">max volume</button>
							<div class="jp-volume-bar">
								<div class="jp-volume-bar-value"></div>
							</div>
						</div>-->
						<div class="jp-time-holder">
							<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
							<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
						</div>
						
					</div>
					<div class="jp-playlist">
						<ul>
							<li>&nbsp;</li>
						</ul>
					</div>
					<div class="jp-no-solution">
						<span>Update Required</span>
						To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
					</div>
				</div>
			</div>
	</div>
</div>

<link href="css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="js/jplayer.playlist.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	new jPlayerPlaylist({
		jPlayer: "#jquery_jplayer_1",
		cssSelectorAncestor: "#jp_container_1"
	}, [
		
		{
			title:"¸èÇúÒ»",
			mp3:"http://zhejiang.mycodes.net/MP3/7631.mp3",
			oga:"http://zhejiang.mycodes.net/MP3/7631.mp3"
		},
		{
			title:"¸èÇú¶þ",
			mp3:"http://zhejiang.mycodes.net/MP3/7463.mp3",
			oga:"http://zhejiang.mycodes.net/MP3/7463.mp3"
		},
		{
			title:"¸èÇúÈý",
			mp3:"http://zhejiang.mycodes.net/MP3/7399.mp3",
			oga:"http://zhejiang.mycodes.net/MP3/7399.mp3"
		}
	], {
		swfPath: "../../dist/jplayer",
		supplied: "oga, mp3",
		wmode: "window",
		useStateClassSkin: true,
		autoBlur: false,
		smoothPlayBar: true,
		keyEnabled: true
	});
});
</script>
</body>
</html>