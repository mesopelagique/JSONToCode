//%attributes = {"preemptive":"capable"}
C_COLLECTION:C1488($1;$jsonCollection)
C_TEXT:C284($0;$resultCode)  // return the 4d code
$jsonCollection:=$1

C_LONGINT:C283($i)
$resultCode:="New collection("


$i:=0

For ($i;0;$jsonCollection.length-1;1)
	
	If ($i#0)
		
		$resultCode:=$resultCode+";"
		
	End if 
	
	$resultCode:=$resultCode+ValueToCode (New object:C1471(\
		"value";$jsonCollection[$i]))
	
End for 

$resultCode:=$resultCode+")"
If ($prettify)
	  //$resultCode:=$resultCode+"\n"
End if 

$0:=$resultCode