# JSONToCode
Main method of component. It convert JSON into 4D code.

## Usage

```4d
$codeAsString:=JSONToCode($jsonString)
```

For JSON String

```json
{"array": [1, 2, 3], "bool": true}
```
the result will be

````
New object("array";New collection(1;2;3);"bool";True)
```

### Used by

- [MacroJSONToCode](MacroJSONToCode.md)
- [PBJSONToCode](PBJSONToCode.md)
- [JSONToCodeWebService](JSONToCodeWebService.md)