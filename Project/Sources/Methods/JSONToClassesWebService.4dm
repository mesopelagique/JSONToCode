//%attributes = {}
C_BOOLEAN:C305($0)
C_TEXT:C284($1;$name)
$name:=$1
C_TEXT:C284($2;$method)
$method:=$2

C_TEXT:C284($output)

Case of 
	: (Position:C15("GET";$method)=1)
		  // Just send the template
		$output:=Folder:C1567(fk resources folder:K87:11).file("classes.html").getText()
		WEB SEND TEXT:C677($output)
		$0:=True:C214
		
	: (Position:C15("POST";$method)=1)
		  // Convert posted JSON from body
		$output:=""
		WEB GET HTTP BODY:C814($output)
		
		$output:=JSON Stringify:C1217(JSONToClassesCode ($output;True:C214))
		$vTcookie:="Content-type: application/json"
		WEB SET HTTP HEADER:C660($vTcookie)
		WEB SEND TEXT:C677($output)
		$0:=True:C214
		
	Else 
		
		WEB SEND TEXT:C677("Unknown method")
		$0:=False:C215
		
End case 

