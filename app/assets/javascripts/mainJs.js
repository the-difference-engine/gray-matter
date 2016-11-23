function addFields(element, tabContainer) {
    var number = document.getElementById(element).value;
    var container = document.getElementById(tabContainer);
    while (container.hasChildNodes()) {
        container.removeChild(container.lastChild);
    }
    for(i=0; i < number; i++){
        container.appendChild(document.createTextNode("link " + (i+1)));
        var input = document.createElement("input");
        input.id = "link";
        input.type = "text";
        input.name = "links[]";
        input.style = "width: 390px";
        container.appendChild(input);
        container.appendChild(document.createElement("br"));
    }
}

function removeFields(e) {
    var parent = document.getElementById("link-container");
    var link_input = document.getElementById(e);
    parent.removeChild(link_input);
}
