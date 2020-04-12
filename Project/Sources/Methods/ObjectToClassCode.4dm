//%attributes = {}

C_OBJECT:C1216($class;$0)
C_TEXT:C284($className;$1)
C_OBJECT:C1216($jsonVar;$2)
C_COLLECTION:C1488($result;$3)

$className:=$1
$jsonVar:=$2
$result:=$3

C_TEXT:C284($ld;$defaultCode)
$ld:="\n"

  // TODO: if want parsing constructor
  //$defaultCode:="Class constructor"+$ld+"C_OBJECT($1)"+$ld
  //$defaultCode:=$defaultCode+"This.fromObject($1)"+$ld+$ld+

$defaultCode:="Function fromObject"+$ld+"C_OBJECT($0;$1)"+$ld

$class:=New object:C1471("name";$className;"code";$defaultCode)

C_TEXT:C284($key)
C_BOOLEAN:C305($hasSpace;$std)
C_VARIANT:C1683($value)
For each ($key;$jsonVar)
	
	$value:=$jsonVar[$key]
	$hasSpace:=Position:C15(" ";$key)>0
	$std:=False:C215
	
	Case of 
		: (Value type:C1509($value)=Is object:K8:27)
			$className:=$key  // maybe capitalizd
			$className[[1]]:=Uppercase:C13($className[[1]])
			
			If ($hasSpace)
				$class.code:=$class.code+"This[\""+$key+"\"]:=cs."+$className+".new().fromObject($1[\""+$key+"\"])"+$ld
			Else 
				$class.code:=$class.code+"This."+$key+":=cs."+$className+".new().fromObject($1."+$key+")"+$ld
			End if 
			
			ObjectToClassCode ($className;$value;$result)
			
		: (Value type:C1509($value)=Is collection:K8:32)
			
			If ($value.length=0)  // cannot assume anything normal behaviour
				$std:=True:C214
			Else 
				If (Value type:C1509($value[0])=Is object:K8:27)  // assume collection of object based on first
					
					$className:=$key  // maybe capitalizd
					$className[[1]]:=Uppercase:C13($className[[1]])
					If ($className[[Length:C16($className)]]="s")
						$className:=Substring:C12($className;1;Length:C16($className)-1)
					End if 
					
					If ($hasSpace)
						$class.code:=$class.code+"This[\""+$key+"\"]:=cs."+$className+".new($1[\""+$key+"\"])"+$ld
					Else 
						$class.code:=$class.code+"This."+$key+":=cs."+$className+".new($1."+$key+")"+$ld
					End if 
					
					ObjectToClassCode ($className;$value[0];$result)
					
				Else 
					$std:=True:C214
				End if 
				
			End if 
			
		Else 
			
			$std:=True:C214
			
	End case 
	
	If ($std)  // standard copy
		If ($hasSpace)
			$class.code:=$class.code+"This[\""+$key+"\"]:=$1[\""+$key+"\"]"+$ld
		Else 
			$class.code:=$class.code+"This."+$key+":=$1."+$key+$ld
		End if 
	End if 
	
End for each 

$class.code:=$class.code+"$0:=This"+$ld

$result.push($class)

$0:=$class