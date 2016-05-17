$(document).ready(function() {
    var nc = false;
    var c = false;
    var popup_ok = $('#popup_ok');
    var popup_error = $('#popup_error');
    var table_all;
    var table_not_completed;
    var table_completed;
    var current_table;
    var files = ' files';
    var file = ' file';
    var error_message = ' not uploaded =/';
    var info_message = ' uploaded.';
    var url = '/upload';
    var file_count = 0;
    var bar = $('#progress-bar');
    var message = $('span#message');
    var errors = $('#errors');
    var error_count = 0;
    var current_order = 0;
    $("#all").click(function(){
        table_all.ajax.reload();
    });
    $("#not_comtleted").click(function(){
        if(nc) table_not_completed.ajax.reload();
        else {
            $.when(not_completed_init()).then(setAction('#not_completed_table'));
            nc = true;
        }
        current_table = table_not_completed;
    });
    $('#completed').click(function(){
        if(c) table_completed.ajax.reload();
        else{
            $.when(completed_init()).then((setAction('#completed_table')));
            c = true;
        }
        current_table = table_completed;
    });
    $('.tabs').tabslet({
     animation:    true
     });
    var not_completed_init = function(){
        setTimeout(function(){
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
        }, 100);
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
        current_table = table_all;
    };
    var completed_init = function(){
        setTimeout(function(){
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
        },500);
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
        if(current_order==number) return;
        current_order = number;
        var url = '/orders/remove/'+number;
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: "POST",
            url: url,
            success: function(result){
                popup_ok.popup('show');
                current_order = 0;
            },
            error: function(result){
                popup_error.popup('show')
            }
        })
    };
    $.when(all_init()).then(setAction('#table'));
    'use strict';
    popup_error.popup({
        opentransitionend: function(){
            setTimeout(function(){
                popup_error.popup('hide');
                current_table.ajax.reload();
            }, 2500);
        },
        blur : false,
        transition: 'all 0.3s'
    });
    popup_ok.popup({
        opentransitionend: function(){
            $.when(current_table.ajax.reload()).then(setTimeout(function(){popup_ok.popup('hide')},1200));
        },
        blur : false,
        transition: 'all 0.3s'
    });
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        fail: function (e, data) {
            error_handler();
        },
        done: function (e, data) {
            file_count++;
            $.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo('#files');
            });
        },
        dropZone: $('.upload'),
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            setTimeout(function(){
                if(error_count < 1){
                    errors.text("");
                }
                if(progress == 100) {
                    if(error_count >= 1 || file_count > 1) message.text(file_count + files + info_message);
                    else message.text(1 + file + info_message);
                    message.fadeIn();
                    error_count = 0;
                    file_count = 0;
                    setTimeout(function(){
                        setTimeout(function(){
                            $.when(function(){
                                message.fadeOut();
                                errors.fadeOut();
                            })/*.then(setTimeout(function(){
                               /!* message.text("");
                                errors.text("");*!/
                            },500))*/;
                        }, 5500);
                        bar.css('width', 0);
                        bar.text("");
                        table_all.ajax.reload();
                        current_table.ajax.reload();
                    },2000);
                }
                bar.css({'width':progress + '%'});
                bar.text(progress + '%')
            },500);
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
    var error_handler = function(){
        if(error_count < 2){
            errors.text(' 1' + file + error_message);
            errors.fadeIn();
        }else errors.text(' ' + error_count + files + error_message);
        error_count++;
    }
});