"use strict";

var postChange = function(jsonString) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", window.location, true);
    xhr.setRequestHeader("Content-type", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState == XMLHttpRequest.DONE && xhr.status === 200) {
            var responseText = xhr.responseText;

            document.getElementById("4dcode").innerText = responseText;
            document.querySelectorAll('pre code').forEach((block) => {
                hljs.highlightBlock(block);
            }); 
        }
    }
    xhr.send(jsonString);
};

window.onload = function() {
    // create the editor
    var container = document.getElementById("jsoneditor");
    var options = {
        mode: 'code', 
        modes: ['code', 'tree'],
        onError: function (err) {
            alert(err.toString());
        },
        onModeChange: function (newMode, oldMode) {
            console.log('Mode switched from', oldMode, 'to', newMode);
        },
        onChangeText: function (jsonString) {
            postChange(jsonString); 
        }
    }
    var editor = new JSONEditor(container, options);

    // set json
    var initialJson = {
        "Array": [1, 2, 3],
        "Boolean": true,
        "Null": null,
        "Number": 123,
        "Object": {"a": "b", "c": "d"},
        "String": "Hello World"
    }
    editor.set(initialJson);
    hljs.initHighlightingOnLoad();

    // get json
    var updatedJson = editor.get();


    hljs.initHighlightingOnLoad();
    // First conversion
    postChange(JSON.stringify(updatedJson));
};
