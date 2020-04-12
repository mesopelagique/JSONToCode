//%attributes = {"preemptive":"capable"}
C_OBJECT:C1216($1;$jsonObj)
C_TEXT:C284($0;$resultCode)  // return the 4d code
C_LONGINT:C283($2;$indent;$i)
$jsonObj:=$1

C_BOOLEAN:C305($prettify)
If (Count parameters:C259>1)
	$indent:=$2
	$prettify:=True:C214
Else 
	$indent:=0
	$prettify:=False:C215
End if 

$resultCode:="New object("
If ($prettify)
	$resultCode:=$resultCode+"\\ \n"
End if 
$indent:=$indent+2

C_BOOLEAN:C305($hasPrevious)
$hasPrevious:=False:C215

C_TEXT:C284($jsonKey)

For each ($jsonKey;$jsonObj)
	
	If ($hasPrevious)
		
		$resultCode:=$resultCode+";"
		If ($prettify)
			$resultCode:=$resultCode+"\\ \n"
		End if 
	End if 
	If ($prettify)
		For ($i;0;$indent;1)
			$resultCode:=$resultCode+" "
		End for 
	End if 
	$resultCode:=$resultCode+"\""+$jsonKey+"\";"+ValueToCode (New object:C1471(\
		"value";$jsonObj[$jsonKey]);$indent)
	
	
	$hasPrevious:=True:C214
	
End for each 

$resultCode:=$resultCode+")"
If ($prettify)
	  //$resultCode:=$resultCode+"\n"
End if 

$0:=$resultCode