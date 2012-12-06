/*
$('#input').blur( function() {
	console.log('Handler for .blur() called.');
	console.log();
	window.location.href = window.location.href+'#?'+this.id+'='+this.value
	$('#translate').submit();
});
var audio = document.getElementsByTagName("audio")[0];
*/
angle = [0,-1,-2,-3,-2,-1,0,1,2,3,2,1];
var angleIndex = 0;
$('#input').keydown( function() {
	$.ajax({
		url: '/morse/'+JSON.stringify(this.value).replace(/\?/g, "%5C"),
		dataType: "json",
		async: true,           // <-- this is the key
		success: function (data) {
			$('.output').html(data.output.trim());
			//replace(/( ){3}/g,' &nbsp; ')
			//audio.play();
        },
		error: function () { }
    });
	rotateSubmarine();
});

function rotateSubmarine(){
	angleIndex = angleIndex+1;
	if(angleIndex > angle.length){
		angleIndex = 0;
	}
	$('#submarine').css('transform','rotate('+angle[angleIndex]+'deg)');
}