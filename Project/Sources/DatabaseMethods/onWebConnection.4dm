If (Position:C15("/classes/";$1)=1)
	JSONToClassesWebService ($1;$2)
Else 
	JSONToCodeWebService ($1;$2)
End if 