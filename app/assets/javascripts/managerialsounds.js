// var aLink = document.getElementById('mySong');
// if (soundManager.canPlayLink(aLink)) {
//  soundManager.play('mySongSound', aLink.href);
// }

$(document).ready(function(){
  
 //  $.getJSON(url, function(tracks) {
 //  	$(tracks).each(function(track) {
 //    	console.log(track.title);
 //  	}
	// });
	
	var aLink = document.getElementById('mySong');
	$('.play').click(function(e){
		e.preventDefault();
		if (soundManager.canPlayLink(aLink)) {
	 		soundManager.play('mySongSound', aLink.href);
		}
	});
});