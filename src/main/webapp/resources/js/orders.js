$(document).ready(function() {
    var nc = false;
    var c = false;
    var popup_ok = $('#popup_ok');
    var table_all;
    var table_not_completed;
    var table_completed;
    var current_table;
    var files = ' files';
    var file = ' file';
    var error_message = ' not uploaded ☹';
    var info_message = ' uploaded.';
    var url = '/upload';
    var bar = $('#progress-bar');
    var message = $('span#message');
    var errors = $('#errors');
    var ok_img = $('#ok');
    var warn_img = $('#warn');
    var error_img = $('#error');
    var right_side = $('#right_side');
    var no_button = $('#no');
    var yes_button = $('#yes');
    var spin = $('#spin');
    var deleting_message = $('#deleting_message');
    var warn_message = $('#popup_message');
    var ok_message = $('#ok_message');
    var error_popup_message = $('#error_message');
    var buttons_div = $('#buttons_c');
    var order_number_span = $('#identifier');
    var file_count = 0;
    var error_count = 0;
    var current_order = 0;
    var temp_order_number = 0;

    var draw_info = function(success, init){
        spin.hide();
        deleting_message.hide();
        if(success){
            ok_img.show();
            ok_message.show();
            setTimeout(function(){
                popup_ok.popup('hide');
                current_table.ajax.reload(null,false);
            },1000)
        }else if(!success && !init){
            error_img.show();
            error_popup_message.show();
            setTimeout(function(){
                current_order = 0;
                popup_ok.popup('hide')
            },2000)
        }else{
            ok_img.hide();
            ok_message.hide();
            error_img.hide();
            error_popup_message.hide();
            warn_img.show();
            buttons_div.show();
            order_number_span.text(temp_order_number);
            warn_message.show();
        }
    };
    yes_button.click(function(){
        warn_message.hide();
        warn_img.hide();
        buttons_div.hide();
        deleting_message.show();
        spin.show();
        setTimeout(deleteOrder(temp_order_number),800);
    });
    no_button.click(function(){
        temp_order_number = 0;
    });
    $("#all").click(function(){
        current_table = table_all;
        table_all.ajax.reload();
    });
    $("#not_comtleted").click(function(){
        if(nc) {
            table_not_completed.ajax.reload();
            current_table = table_not_completed;
        }
        else {
            $.when(not_completed_init()).then(function(){
                setTimeout(function(){
                    current_table = table_not_completed;
                },500);
                setAction('#not_completed_table');
            });
            nc = true;
        }
    });
    $('#completed').click(function(){
        if(c) {
            table_completed.ajax.reload();
            current_table = table_completed;
        }
        else{
            $.when(completed_init()).then(function(){
                setTimeout(function(){
                    current_table = table_completed;
                },500);
                setAction('#completed_table');
            });
            c = true;
        }
    });
    $('.tabs').tabslet({
     animation:    true
     });
    var not_completed_init = function(){
        setTimeout(function(){
            table_not_completed = $('#not_completed_table').DataTable({
                serverSide: true,
                ajax: '/orders/not-completed',
                language: {
                    'processing': "<img src='/resources/images/templates/pagination/ajax-loader.gif'>"
                },
                "processing": true,
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
            language: {
                'processing': "<img src='/resources/images/templates/pagination/ajax-loader.gif'>"
            },
            "processing": true,
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
        setTimeout(function(){
            table_completed = $('#completed_table').DataTable({
                serverSide: true,
                ajax: '/orders/completed',
                language: {
                    'processing': "<img src='/resources/images/templates/pagination/ajax-loader.gif'>"
                },
                "processing": true,
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
            temp_order_number = parent.find("td:nth-child(1)").text();
            $.when(draw_info(false, true)).then(popup_ok.popup('show'));
        });
    };
    var deleteOrder = function(number){
        if(current_order == number) {
            draw_info(false, false);
            return;
        }
        current_order = number;
        var url = '/orders/remove/'+number;
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: "POST",
            url: url,
            success: function(result){
                draw_info(true, false);
                current_order = 0;
            },
            error: function(result){
                draw_info(false, false);
            }
        })
    };
    $.when(all_init()).then(function(){
        current_table = table_all;
        setAction('#table')
    });
    popup_ok.popup({
        closeelement: '.confirm_popup_close',
        blur : false,
        transition: 'all 0.3s'
    });
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        sequentialUploads: true,
        fail: function (e, data) {
            error_handler();
        },
        done: function (e, data) {
            file_count+=1;
            if(file_count > 1) message.text(file_count + files + info_message);
            else message.text(file_count + (file_count != 1 ? files : file) + info_message);
            $.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo('#files');
            });
        },
        dropZone: $('.upload'),
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            if(error_count < 1)  errors.text("");
            if(progress == 100) {
                message.fadeIn();
                setTimeout(function(){
                    bar.css('width', 0);
                    error_count = 0;
                    file_count = 0;
                    bar.text("");
                    current_table.ajax.reload(null,false);
                },2200);
            }
            bar.css({'width':progress + '%'});
            bar.text(progress + '%')
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
    var error_handler = function(){
        error_count+=1;
        if(error_count < 2){
            errors.text(' ' +error_count + file + error_message);
            errors.fadeIn();
        }else errors.text(' ' + error_count + files + error_message);
    }
});