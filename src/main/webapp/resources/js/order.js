$(document).ready(function() {
    var nc = false;
    var c = false;
    var popup_ok = $('#popup_ok');
    var popup_error = $('#popup_error');
    var table_all;
    var table_not_completed;
    var table_completed;
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
            }, 900);
        },
        blur : false,
        transition: 'all 0.3s'
    });
    $("#all").click(function(){
        table_all.ajax.reload();
    });
    $("#not_comtleted").click(function(){
        if(nc) table_not_completed.ajax.reload();
        else {
            $.when(not_completed_init()).then(setAction('#not_completed_table'));
            nc = true;
        }
    });
    $('#completed').click(function(){
        if(c) table_completed.ajax.reload();
        else{
            $.when(completed_init()).then(then(setAction('#completed_table')));
            c = true;
        }
    });
    $('.tabs').tabslet({
     animation:    true
     });
    var not_completed_init = function(){
        table_not_completed = $('#not_completed_table').DataTable({
            serverSide: true,
            ajax: '/orders/not-completed',
            'columns': [
                {'data':'Order number'},
                {'data': 'Service date'},
                {'data': 'Status'},
                {'data': 'Installation'},
                {'data': 'Task'},
                {'data': 'Address'},
                {'data': 'Action'}
            ],
            "columnDefs": [ {
                "searchable": false,
                "orderable": false,
                "targets": [2,3,4,5,6]
            },{
                "targets": -1,
                "data": 'Action',
                "defaultContent": "<button class='info_action'></button><button class='pdf_action'></button><button class='del'></button>"
            } ],
            "order": [[1, 'asc' ]]
        });
    };
    var all_init = function(){
        table_all = $('#table').DataTable({
            serverSide: true,
            ajax: '/orders/all',
            'columns': [
                {'data':'Order number'},
                {'data': 'Service date'},
                {'data': 'Status'},
                {'data': 'Installation'},
                {'data': 'Task'},
                {'data': 'Address'},
                {'data': 'Action'}
            ],
            "columnDefs": [ {
                "searchable": false,
                "orderable": false,
                "targets": [2,3,4,5,6]
            },{
                "targets": -1,
                "data": 'Action',
                "defaultContent": "<button class='info_action'></button><button class='pdf_action'></button><button class='del'></button>"
            } ],
            "order": [[1, 'asc' ]]
        });
    };
    var completed_init = function(){
        table_completed = $('#completed_table').DataTable({
            serverSide: true,
            ajax: '/orders/completed',
            'columns': [
                {'data':'Order number'},
                {'data': 'Service date'},
                {'data': 'Status'},
                {'data': 'Installation'},
                {'data': 'Task'},
                {'data': 'Address'},
                {'data': 'Action'}
            ],
            "columnDefs": [ {
                "searchable": false,
                "orderable": false,
                "targets": [2,3,4,5,6]
            },{
                "targets": -1,
                "data": 'Action',
                "defaultContent": "<button class='info_action'></button><button class='pdf_action'></button><button class='del'></button>"
            } ],
            "order": [[1, 'asc' ]]
        });
    };
    var setAction = function(selector){
        var reload;
        switch (selector){
            case "#table": {
                reload = table_all;
                break;
            }
            case "#not_completed_table":{
                reload = table_not_completed;
                break;
            }
            default: reload = table_completed;
        }
        var table = $(selector);
        table.find('tbody').on('click','.info_action', function(){
            var parent = $(this).parent().parent();
            window.location.href='/orders/' + parent.find("td:nth-child(1)").text();
        });
        table.find('tbody').on('click','.pdf_action', function(){
            var parent = $(this).parent().parent();
            window.location.href='/orders/download/' + parent.find("td:nth-child(1)").text();
        });
        table.find('tbody').on('click','.del', function(){
            var parent = $(this).parent().parent();
            $.when(deleteOrder(parent.find("td:nth-child(1)").text())).then(function(){
                setTimeout(function(){
                    reload.ajax.reload();
                }, 600);
            });
        });
    };
    var deleteOrder = function(number){
        var url = '/orders/remove/'+number;
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: "POST",
            url: url,
            success: function(result){
                popup_ok.popup('show')
            },
            error: function(result){
                popup_error.popup('show')
            }
        })
    };
    $.when(all_init()).then(setAction('#table'));
});