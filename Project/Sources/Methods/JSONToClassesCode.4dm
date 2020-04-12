//%attributes = {}
C_COLLECTION:C1488($0;$result)
C_TEXT:C284($1;$jsonString)
$jsonString:=$1
$result:=New collection:C1472()

  // Parse and throw if not parsable
C_VARIANT:C1683($jsonVar)
$jsonVar:=JSON Parse:C1218($jsonString)

If (Value type:C1509($jsonVar)=Is collection:K8:32)
	$jsonVar:=$jsonVar[0]  // convert only the first for the moment
End if 

C_OBJECT:C1216($class)
If (Value type:C1509($jsonVar)=Is object:K8:27)  // convert only object
	
	$class:=ObjectToClassCode ("Root";$jsonVar;$result)
	
End if 

  // Here could merge class with same code ? (do not forget to replace use in other classes, maybe extends instead)

  // Create a builder class to init static methods
C_TEXT:C284($ld)
$ld:="\n"

C_OBJECT:C1216($classInit)
$classInit:=New object:C1471("name";"JSONBuilder";"code";"Class constructor"+$ld)
For each ($class;$result)
	
	$classInit.code:=$classInit.code+"Use (cs."+$class.name+")"+$ld
	$classInit.code:=$classInit.code+"cs."+$class.name+".fromObject:=Formula(cs."+$class.name+".new().fromObject($1))"+$ld
	$classInit.code:=$classInit.code+"cs."+$class.name+".fromFile:=Formula(cs."+$class.name+".new().fromObject(JSON Parse($1.getText())))"+$ld
	$classInit.code:=$classInit.code+"cs."+$class.name+".fromText:=Formula(cs."+$class.name+".new().fromObject(JSON Parse($1)))"+$ld
	$classInit.code:=$classInit.code+"End use"+$ld
	
End for each 

$result.push($classInit)

$0:=$result