//%attributes = {}
C_OBJECT:C1216($obj)
$obj:=New object:C1471(\
"details";"scope";\
"currentRecord";"shortLabel";\
"child";New object:C1471("name";"eric";"age";20);\
"array";New collection:C1472(5;6;"1");\
"arrayOfObjects";New collection:C1472(New object:C1471("name";"harry";"age";19);New object:C1471("name";"potter";"age";21));\
"Details";"label";\
"Book Details";"tableNumber")

JSONToClasses (JSON Stringify:C1217($obj))

  // XXX did classes has been reloaded? so launch two times, after 4d in bg

If (cs:C1710["JSONBuilder"]#Null:C1517)
	
	cs:C1710["JSONBuilder"].new()  // init builder
	
	C_OBJECT:C1216($tempFile)
	$tempFile:=Folder:C1567(Temporary folder:C486;fk platform path:K87:2).file(Generate UUID:C1066+".json")
	$tempFile.setText(JSON Stringify:C1217($obj))
	
	C_OBJECT:C1216($instance)
	
	$instance:=cs:C1710["Root"].fromFile($tempFile)
	$tempFile.delete()
	ASSERT:C1129(OB Class:C1730($instance).name="Root")
	ASSERT:C1129(String:C10($instance.details)=$obj.details)
	If (Asserted:C1132($instance.child#Null:C1517;"child not parsed"))
		ASSERT:C1129(OB Class:C1730($instance.child).name="Child")
		ASSERT:C1129(String:C10($instance.child.name)="eric")
	End if 
	
	$instance:=cs:C1710["Root"].fromText(JSON Stringify:C1217($obj))
	ASSERT:C1129(OB Class:C1730($instance).name="Root")
	ASSERT:C1129(String:C10($instance.details)=$obj.details)
	If (Asserted:C1132($instance.child#Null:C1517;"child not parsed"))
		ASSERT:C1129(OB Class:C1730($instance.child).name="Child")
		ASSERT:C1129(String:C10($instance.child.name)="eric")
	End if 
	
	$instance:=cs:C1710["Root"].fromObject($obj)
	ASSERT:C1129(OB Class:C1730($instance).name="Root")
	ASSERT:C1129(String:C10($instance.details)=$obj.details)
	If (Asserted:C1132($instance.child#Null:C1517;"child not parsed"))
		ASSERT:C1129(OB Class:C1730($instance.child).name="Child")
		ASSERT:C1129(String:C10($instance.child.name)="eric")
	End if 
	
End if 
