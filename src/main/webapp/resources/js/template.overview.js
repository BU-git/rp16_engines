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
        var ex = $('#example');
        ex.find('tbody').on('click','.del', function(){
            var parent = $(this).parent().parent();
            delete_name = parent.find('td:nth-child(2)').text();
            $.when(deleteTemplate(delete_name)).then(function(){
                setTimeout(function(){
                    table.ajax.reload();
                }, 600);
            });
        });
        ex.find('tbody').on('click','.edit', function(){
            var parent = $(this).parent().parent();
            post2blank('/templates/new', parent.find('td:nth-child(2)').text())
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
                "defaultContent": "<button class='edit'></button><button class='del'></button>"
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
    function post2blank(url, name)
    {   var myform = '<form id="temporary_form" hidden action="' +url+ '" method="POST">' +
        '<input type="text" name="name" value="'+name+'"></form>';
        $(myform).appendTo('body').submit();
        $('#temporary_form').remove();
    }
    $.when(initTable()).then(setAction());
});