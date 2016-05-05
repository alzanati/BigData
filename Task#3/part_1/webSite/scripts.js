function clickMe() {
    
    "use strict";
    var x, y, z;
    y = 5;
    z = 5;
    y = y * z;
    x = document.getElementById("num").value;
    if (!x.isEmptyObject) {
        x = x * y;
    }
    document.getElementById("text").innerHTML = "you entered :  " + x;
}

function mult(x, y) {
    "use strict";
    return x * y;
}

function getElment() {
    "use strict";
    
    var z;
    z = document.getElementById("selection").value;
    document.getElementById("selection").style.width = "100px";
    document.getElementById("selection").style.height = "34px";
    document.getElementById("selection").style.overflow = "hidden";
    document.getElementById("selection").style.background = "url(new_arrow.png) no-repeat right #ddd";
    document.getElementById("selection").style.border = "2px solid #ccc";
    document.getElementById("selection").style.fontSize = "20px";
    
    document.getElementById("text_test").innerHTML = "You choose :  " + z;
}

