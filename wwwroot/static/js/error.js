/* setup our error handler */
onerror = handleErr;

function handleErr(message,url,line) {
	var lastNode = document;
	
	/* get last script node to try and isolate erroring script */
	while(lastNode.childNodes.length > 0) {
		lastNode = lastNode.childNodes[lastNode.childNodes.length - 1];
	}
	var lastScriptSrc = lastNode.tagName == "SCRIPT" ? lastNode.src : undefined;

	errorDetails = {
		'url':location.href, 
		'line':line, 
		'type':message.split(':',1)[0],
		'message':message.split(message.split(':',1)[0]+': ')[1],
		'script':lastScriptSrc
		}
	console.log(errorDetails);
	
	$.ajax({
		url: '/error/',
		data: errorDetails,
		dataType: "json",
		type:"POST"
	});
	return true;
}

