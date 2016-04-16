function getFileSizeandName(input)
{
    for(var i =0; i<input.files.length; i++)
    {
        if(i==0)
            $('#filecount').text("1file");
        else
        {
            var no = parseInt(i) + 1;
            $('#filecount').text(no+"files");
        }
    }
}

function CloseAndRefresh()
{
    opener.location.reload(true);
    self.close();
}