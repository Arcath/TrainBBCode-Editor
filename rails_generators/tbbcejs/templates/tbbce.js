$(document).ready(function(){
	//jQuery Objects
	tbbcebar=$('#tbbce_bar');
	tbbcearea=$('#topic_post_body');
	tbbceframe=$('#tbbce_frame');
	//Build the TBBCE bar
	tbbcebar.html("<a href=\"\" id=\"bold\">Bold</a>");
	tbbcebar.append(" | <a href=\"\" id=\"italic\">Italic</a>");
	tbbcebar.append(" | <a href=\"\" id=\"underline\">Underline</a>");
	tbbcebar.append(" | <a href=\"\" id=\"img\">Image</a>");
	//Handle the links
	$('#tbbce_bar a').live("click",function(){
		processtag(this.id,tbbcearea);
		alert(tbbcearea.value)
		tbbceframe.html(tbbcearea.value)
		return false
	});
	//Format the text area
	tbbcearea.attr("cols",70);
	tbbcearea.attr("rows",10);
	//Now lets hide that for the WYSIWYG bit
	//tbbcearea.css("display","none");
	//Draw the frame
	tbbceframe.css("width","509px");
	tbbceframe.css("height","200px");
	tbbceframe.css("border","2px solid #CCC");	
	tbbceframe.css("display","block");
	tbbcearea.bind("keyup", function(){
		//tbbceframe.html(this.value);
		$.getScript("/tbbce?string=" + this.value +"&tbbcef=" + tbbceframe.attr("id"));
	});
});

function processtag(tag,tbbcearea){
	//Tags array
	var tags = []
	tags["bold"]="[b]STRING[/b]";
	tags["underline"]="[u]STRING[/u]";
	tags["italic"]="[i]STRING[/i]";
	tags["img"]="[img]STRING[/img]";
	//Get the Selection
	selection=tbbcearea.getSelection();
	output=tags[tag].replace(/STRING/i, selection.text);
	//Send Output
	tbbcearea.replaceSelection(output,true);
};
