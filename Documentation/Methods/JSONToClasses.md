# JSONToClasses

🚧

Generate classes files with JSON data parsing


## Usage

```4d
JSONToClasses ($jsonString)
```

### Web Service

You can use web service /classes/ to test

[JSONToClassesWebService](JSONToClassesWebService.md)

### Example with sub-object

For json string
```json
{
	"details": "scope",
	"currentRecord": "shortLabel",
	"child": {
		"name": "eric",
		"age": 20
	},
	"array": [
		5,
		6,
		"1"
	],
	"Details": "label",
	"Book Details": "tableNumber"
}
```

Two classes will be created, first `Root` one

```4d
Function fromObject
	C_OBJECT($0;$1)
	This.details:=$1.details
	This.currentRecord:=$1.currentRecord
	This.child:=cs.Child.new().fromObject($1.child)
	This.array:=$1.array
	This.Details:=$1.Details
	This["Book Details"]:=$1["Book Details"]
	$0:=This
```

Then the `Child` one
```4d
Function fromObject
	C_OBJECT($0;$1)
	This.name:=$1.name
	This.age:=$1.age
	$0:=This
```

You can then initialize a `Root` class from `File`, text or object
	
```4d
$instance:=cs.Root.fromFile($aJsonFile)
$instance:=cs.Root.fromText($aJsonString)
$instance:=cs.Root.fromObject($anObject) // or cs.Root.new().fromObject($anObject)
```
	
	

