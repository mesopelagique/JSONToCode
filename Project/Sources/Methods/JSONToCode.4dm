//%attributes = {"shared":true,"preemptive":"capable"}
C_TEXT:C284($1;$jsonString)  // string which contains JSON
C_TEXT:C284($0;$resultCode)  // return the 4d code
C_VARIANT:C1683($2)

$jsonString:=$1
C_BOOLEAN:C305($prettify)
$prettify:=(Count parameters:C259>1)  // *

  // XXX trim ? $jsonString

$resultCode:=""

  // Parse and throw if not parsable
C_VARIANT:C1683($jsonVar)
$jsonVar:=JSON Parse:C1218($jsonString)

Case of 
		
		  //________________________________________
	: (Value type:C1509($jsonVar)=Is object:K8:27)
		
		If ($prettify)
			$resultCode:=ObjectToCode ($jsonVar;0)
		Else 
			$resultCode:=ObjectToCode ($jsonVar)
		End if 
		  //________________________________________
	: (Value type:C1509($jsonVar)=Is collection:K8:32)
		
		$resultCode:=CollectionToCode ($jsonVar)
		
		  //________________________________________
	Else 
		
		  // error
		
		  //________________________________________
End case 

$0:=$resultCode