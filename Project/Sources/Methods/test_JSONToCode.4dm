//%attributes = {}
ASSERT:C1129(JSONToCode ("{}")="New object()";JSONToCode ("{}"))

ASSERT:C1129(JSONToCode ("{\"text\":\"a text\"}")="New object(\"text\";\"a text\")";JSONToCode ("{\"text\":\"a text\"}"))
ASSERT:C1129(JSONToCode ("{\"text\":\"a text\",   \"int\": 5}")="New object(\"text\";\"a text\";\"int\";5)";JSONToCode ("{\"text\":\"a text\",   \"int\": 5}"))

ASSERT:C1129(JSONToCode ("[]")="New collection()";JSONToCode ("[]"))
ASSERT:C1129(JSONToCode ("[[],[[]]]")="New collection(New collection();New collection(New collection()))";JSONToCode ("[[],[[]]]"))
ASSERT:C1129(JSONToCode ("[{}]")="New collection(New object())";JSONToCode ("[{}]"))

ASSERT:C1129(JSONToCode ("[1,2,3]")="New collection(1;2;3)";JSONToCode ("[1,2,3]"))

C_TEXT:C284($jsonString;$code;$expectedCode)

  // {"actions":[{"name":"details","scope":"currentRecord","shortLabel":"Details","label":"Book Details","tableNumber":1,"icon":"action_details"},{"name":"rate","scope":"currentRecord","shortLabel":"Rate","label":"Rate and Review","tableNumber":1,"icon":"action_rate","parameters":[{"type":"string","name":"comment","maxLength":200,"defaultField":"Author"},{"type":"integer","name":"rate","label":"Your rating","default":5,"min":1,"max":5},{"type":"bool","name":"testb","default":true}]},{"name":"finished","scope":"currentRecord","shortLabel":"Finished","label":"Mark as Finished","tableNumber":1,"icon":"action_finished"},{"name":"share","scope":"currentRecord","shortLabel":"Send","label":"Share this Book","tableNumber":1,"icon":"action_share"},{"name":"delete","scope":"currentRecord","shortLabel":"Delete","label":"Delete from Library","icon":"action_delete","tableNumber":1},{"name":"favorite","scope":"currentRecord","shortLabel":"Add to Fav","label":"Add to Favorite","icon":"action_favorite","tableNumber":1}]}
$jsonString:="{\"actions\":[{\"name\":\"details\",\"scope\":\"currentRecord\",\"shortLabel\":\"Details\",\"label\":\"Book Details\",\"tableNumber\":1,\"icon\":\"action_details\"},"+\
"{\"name\":\"rate\",\"scope\":\"currentRecord\",\"shortLabel\":\"Rate\",\"label\":\"Rate and Review\",\"tableNumber\":1,\"icon\":\"action_rate\",\"parameters\":[{\"type\":\"string\",\"name\":\"comment\",\"maxLength\":200,\"defaultField\":\"Author\"},"+\
"{\"type\":\"integer\",\"name\":\"rate\",\"label\":\"Your rating\",\"default\":5,\"min\":1,\"max\":5},{\"type\":\"bool\",\"name\":\"testb\",\"default\":true}]},"+\
"{\"name\":\"finished\",\"scope\":\"currentRecord\",\"shortLabel\":\"Finished\",\"label\":\"Mark as Finished\",\"tableNumber\":1,\"icon\":\"action_finished\"},"+"{\"name\":\"share\",\"scope\":\"currentRecord\",\"shortLabel\":\"Send\",\"label\":\"Share this Book\",\"tableNumber\":1,\"icon\":\"action_share\"},"+\
"{\"name\":\"delete\",\"scope\":\"currentRecord\",\"shortLabel\":\"Delete\",\"label\":\"Delete from Library\",\"icon\":\"action_delete\",\"tableNumber\":1},"+\
"{\"name\":\"favorite\",\"scope\":\"currentRecord\",\"shortLabel\":\"Add to Fav\",\"label\":\"Add to Favorite\",\"icon\":\"action_favorite\",\"tableNumber\":1}]}"
$code:=JSONToCode ($jsonString)
$expectedCode:="New object(\"actions\";New collection("+\
"New object(\"name\";\"details\";\"scope\";\"currentRecord\";\"shortLabel\";\"Details\";\"label\";\"Book Details\";\"tableNumber\";1;\"icon\";\"action_details\");"+\
"New object(\"name\";\"rate\";\"scope\";\"currentRecord\";\"shortLabel\";\"Rate\";\"label\";\"Rate and Review\";\"tableNumber\";1;\"icon\";\"action_rate\";\"parameters\";New collection("+\
"New object(\"type\";\"string\";\"name\";\"comment\";\"maxLength\";200;\"defaultField\";\"Author\");"+\
"New object(\"type\";\"integer\";\"name\";\"rate\";\"label\";\"Your rating\";\"default\";5;\"min\";1;\"max\";5);"+\
"New object(\"type\";\"bool\";\"name\";\"testb\";\"default\";True)));"+\
"New object(\"name\";\"finished\";\"scope\";\"currentRecord\";\"shortLabel\";\"Finished\";\"label\";\"Mark as Finished\";\"tableNumber\";1;\"icon\";\"action_finished\");"+\
"New object(\"name\";\"share\";\"scope\";\"currentRecord\";\"shortLabel\";\"Send\";\"label\";\"Share this Book\";\"tableNumber\";1;\"icon\";\"action_share\");"+\
"New object(\"name\";\"delete\";\"scope\";\"currentRecord\";\"shortLabel\";\"Delete\";\"label\";\"Delete from Library\";\"icon\";\"action_delete\";\"tableNumber\";1);"+\
"New object(\"name\";\"favorite\";\"scope\";\"currentRecord\";\"shortLabel\";\"Add to Fav\";\"label\";\"Add to Favorite\";\"icon\";\"action_favorite\";\"tableNumber\";1)))"
ASSERT:C1129($code=$expectedCode;$code)

C_OBJECT:C1216($obj)
$obj:=New object:C1471(\
"actions";New collection:C1472(New object:C1471("name";\
"details";"scope";\
"currentRecord";"shortLabel";\
"Details";"label";\
"Book Details";"tableNumber";\
1;"icon";\
"action_details");New object:C1471("name";"rate";"scope";"currentRecord";"shortLabel";"Rate";"label";"Rate and Review";"tableNumber";1;"icon";"action_rate";"parameters";New collection:C1472(New object:C1471("type";"string";"name";"comment";"maxLength";200;"defaultField";"Author");\
New object:C1471("type";"integer";"name";"rate";"label";"Your rating";"default";5;"min";1;"max";5);\
New object:C1471("type";"bool";"name";"testb";"default";True:C214)));\
New object:C1471("name";"finished";"scope";"currentRecord";"shortLabel";"Finished";"label";"Mark as Finished";"tableNumber";1;"icon";"action_finished");\
New object:C1471("name";"share";"scope";"currentRecord";"shortLabel";"Send";"label";"Share this Book";"tableNumber";1;"icon";"action_share");\
New object:C1471("name";"delete";"scope";"currentRecord";"shortLabel";"Delete";"label";"Delete from Library";"icon";"action_delete";"tableNumber";1);\
New object:C1471("name";"favorite";"scope";"currentRecord";"shortLabel";"Add to Fav";"label";"Add to Favorite";"icon";"action_favorite";"tableNumber";1)))
ASSERT:C1129(JSON Stringify:C1217($obj)=$jsonString;"previous test not validated on complex json")


ASSERT:C1129(Formula from string:C1601($code)#Null:C1517)