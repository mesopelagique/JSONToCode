//%attributes = {"shared":true}
C_TEXT:C284($text)
$text:=Get text from pasteboard:C524
$text:=JSONToCode ($text)
SET TEXT TO PASTEBOARD:C523($text)