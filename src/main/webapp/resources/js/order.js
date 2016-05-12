$(document).ready(function() {
    var nc = false;
    var c = false;
    var table_all;
    var table_not_completed;
    var table_completed;
    $("#all").click(function(){
        table_all.ajax.reload();
    });
    $("#not_comtleted").click(function(){
        if(nc) table_not_completed.ajax.reload();
        else {
            not_completed_init();
            nc = true;
        }
    });
    $('#completed').click(function(){
        if(c) table_completed.ajax.reload();
        else{
            completed_init();
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
                {'data': 'Address'}
            ],
            "columnDefs": [ {
                "searchable": false,
                "orderable": false,
                "targets": [2,3,4,5]
            } ],
            "order": [[1, 'asc' ]]
        });
    };
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
            "targets": [2,3,4,5]
        },{
            "targets": -1,
            "data": 'Action',
            "defaultContent": "<div class='info_action'></div><div class='pdf_action'></div>"
        } ],
        "order": [[1, 'asc' ]]
    });
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
                {'data': 'Address'}
            ],
            "columnDefs": [ {
                "searchable": false,
                "orderable": false,
                "targets": [2,3,4,5]
            } ],
            "order": [[1, 'asc' ]]
        });
    }
});