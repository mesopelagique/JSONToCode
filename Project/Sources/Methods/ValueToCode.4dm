//%attributes = {"preemptive":"capable"}
C_OBJECT:C1216($1;$param)
C_TEXT:C284($0;$resultCode)  // return the 4d code
$param:=$1

C_LONGINT:C283($jsonValueType)
$jsonValueType:=Value type:C1509($param.value)

Case of 
		
		  //________________________________________
	: ($jsonValueType=Is object:K8:27)
		
		If (Count parameters:C259>1)
			$resultCode:=$resultCode+ObjectToCode ($param.value;$2)
		Else 
			$resultCode:=$resultCode+ObjectToCode ($param.value)
		End if 
		
		  //________________________________________
	: ($jsonValueType=Is collection:K8:32)
		
		$resultCode:=$resultCode+CollectionToCode ($param.value)
		
		  //________________________________________
	: ($jsonValueType=Is text:K8:3)
		
		$resultCode:=$resultCode+"\""+String:C10($param.value)+"\""
		
		  //________________________________________
	: (($jsonValueType=Is real:K8:4)\
		 | ($jsonValueType=Is boolean:K8:9)\
		 | ($jsonValueType=Is longint:K8:6))
		
		$resultCode:=$resultCode+String:C10($param.value)
		
		  // : (($jsonValueType=Is date) | ($jsonValueType=Is time)))
		  // TODO with 4d convention?
		  //________________________________________
	: ($jsonValueType=Is null:K8:31)
		
		$resultCode:="Null"  // or +String($param.value)
		
		  //________________________________________
	Else 
		
		$resultCode:=$resultCode+String:C10($param.value)
		
		  //________________________________________
End case 

$0:=$resultCode