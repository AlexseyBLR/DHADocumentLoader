function checkBoxChecker() {
    var inputs = document.querySelectorAll('.checkbox:checked');
    for (var i = 0; inputs[i]; i++) {
        var tags = inputs[i].parentNode.parentNode;
        var td = tags.getElementsByTagName("td");
        for (var el = 0; td[el]; el++) {
            var element = td[el].getElementsByTagName("input");
            for (var val = 0; element[val]; val++) {
                element[val].value='';
            }
        }
    }
}