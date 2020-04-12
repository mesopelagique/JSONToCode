//%attributes = {"shared":true}

C_VARIANT:C1683($1)
C_OBJECT:C1216($2;$destinationFolder)

  // prepare destination folder
If (Count parameters:C259>2)
	$destinationFolder:=$2
	ASSERT:C1129(OB Instance of:C1731($destinationFolder;4D:C1709.Folder))
Else 
	$destinationFolder:=Folder:C1567(fk database folder:K87:14;*)
End if 

If (Not:C34($destinationFolder.name="Classes"))
	$destinationFolder:=$destinationFolder.folder("Project").folder("Sources").folder("Classes")
End if 

If (Not:C34($destinationFolder.exists))
	$destinationFolder.create()
End if 


  // parse input
C_COLLECTION:C1488($results)
Case of 
	: (Value type:C1509($1)=Is object:K8:27)
		
		If (OB Instance of:C1731($1;4D:C1709.file))
			
			$results:=JSONToClassesCode ($1.getText())
			
		Else 
			
			$results:=JSONToClassesCode (JSON Stringify:C1217($1))
			
		End if 
		
	: (Value type:C1509($1)=Is text:K8:3)
		
		$results:=JSONToClassesCode ($1)
		
	Else 
		
		$results:=New collection:C1472()
		
End case 

  // write to files
C_OBJECT:C1216($class;$classFile)
For each ($class;$results)
	$classFile:=$destinationFolder.file($class.name+".4dm")
	$classFile.setText($class.code)
End for each 
