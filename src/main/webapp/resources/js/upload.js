function getFileSizeandName(input) {
    var i = 0;
    for (; i < input.files.length; i++) {
        if (input.files[i].name.substring(input.files[i].name.lastIndexOf('.') + 1, input.files[i].name.length).toLowerCase() != 'xml') {
            console.log(input.files[i].name);
            alert('Only *.xml files!');
            var form = document.getElementById('uploadForm');
            form.reset();
        }

    }
}

function CloseAndRefresh()
{
    opener.location.reload(true);
    self.close();
}