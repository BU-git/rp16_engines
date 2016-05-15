$(document).ready(function() {
    var table;
    var delete_name;
    var popup_ok = $('#popup_ok');
    var popup_error = $('#popup_error');
    popup_error.popup({
        opentransitionend: function(){
            setTimeout(function(){
                popup_error.popup('hide');
            }, 2500);
        },
        blur : false,
        transition: 'all 0.3s'
    });
    popup_ok.popup({
        opentransitionend: function(){
            setTimeout(function() {
                popup_ok.popup('hide');
            }, 950);
        },
        blur : false,
        transition: 'all 0.3s'
    });
    var setAction = function(){
        $('#example').find('tbody').on('click','.del', function(){
            var parent = $(this).parent().parent();
            delete_name = parent.find('td:nth-child(2)').text();
            $.when(deleteTemplate(delete_name)).then(function(){
                setTimeout(function(){
                    table.ajax.reload();
                }, 600);
            });
        });
    };
    var initTable = function(){
        table = $('#example').DataTable({
            'ajax': {
                'url': '/templates',
                'type': 'POST'
            },
            'columns': [
                {'data':'#'},
                {'data': 'Name'},
                {'data': 'Action'}
            ],
            "columnDefs": [ {
                "targets": -1,
                "data": 'Action',
                "defaultContent": "<button class='del'></button>"
            }, {
            "searchable": false,
            "orderable": false,
            "targets": [2]
        }]
        });
    };
    var deleteTemplate = function(name){
        var url = '/templates/remove/'+name;
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: 'POST',
            url:url,
            success: function(result){
                popup_ok.popup('show')
            },
            error: function(result){
                popup_error.popup('show')
            }
        })
    };
    $.when(initTable()).then(setAction());
});