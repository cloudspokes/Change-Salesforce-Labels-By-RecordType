var j$ = jQuery.noConflict();
function replaceSF(foo,bar)
{

j$('.labelCol').children().each(function(){   
if(j$(this).text() == foo) 
{      
	j$(this).html(''+bar);    
}
else if(j$(this).text().trim().replace('\*','').replace('\n','') == foo)
{
	j$(this).html(j$(this).html().replace(foo,''+bar));
}
});  
j$('.labelCol').each(function(){   
if(j$(this).text() == foo )
{      
	j$(this).html(''+bar);   
}
}); 

}
j$(document).ready(function(){   
var result = "0:Error";
var text="hello";
var Windowlocation=window.location.href;
//alert('test');
sforce.connection.sessionId=getCookie('sid');
var StringResult = sforce.apex.execute("RecordTypeLabel","convertString",{Pageurl:Windowlocation});

var i=0;
for(i = 0; i < StringResult.length; i++) {
   var mySplitResult = StringResult[i].split(":");
   replaceSF(mySplitResult[0],mySplitResult[1]);
}
});