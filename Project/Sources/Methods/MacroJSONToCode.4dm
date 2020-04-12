//%attributes = {"shared":true}
C_TEXT:C284($text;$code)

GET MACRO PARAMETER:C997(Highlighted method text:K5:18;$text)

If (Length:C16($text)>0)
	
	$code:=JSONToCode ($text)
	SET MACRO PARAMETER:C998(Highlighted method text:K5:18;"/*"+$text+"*/\r"+$code)
	
Else 
	
	$text:=Get text from pasteboard:C524
	$code:=JSONToCode ($text)
	
	SET MACRO PARAMETER:C998(Highlighted method text:K5:18;$code)
	
End if 
