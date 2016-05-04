$(document).ready(function() {
    var table;
    var setAction = function(){
        setTimeout(
            function(){
                $('.del').each(function(){
                    $(this).click(function(e){
                        var name = $('#'+e.toElement.value).text();
                        $.when(deleteTemplate(name)).then(function(){
                            setTimeout(function(){
                                table.ajax.reload();
                            }, 300);
                        }).then(setTimeout(setAction(), 300))
                    })
                })
            }, 500);
    };
    var initTable = function(){
        table = $('#example').DataTable({
            'ajax': '/templates/all',
            'columns': [
                {'data':'#'},
                {'data': 'name'},
                {'data': 'action'}
            ]
        });
    };
    $.when(initTable()).then(setAction());
    var deleteTemplate = function(name){
        var url = '/templates/remove/'+name;
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: "POST",
            url:url/*,
            success: table.ajax.reload()*/
        })
    }
});