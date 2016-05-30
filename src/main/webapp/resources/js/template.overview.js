$(document).ready(function() {
    var locale = $.cookie("myAppLocaleCookie");
    var isEn = locale == 'en';
    var table;
    var popup_ok = $('#popup_ok');
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
    var template_name = $('#identifier');
    var current_delete_name;
    var temp_delete_name;

    var draw_info = function(success, init){
        spin.hide();
        deleting_message.hide();
        if(success){
            ok_img.show();
            ok_message.show();
            setTimeout(function(){
                popup_ok.popup('hide');
                table.ajax.reload(null,false);
            },1000)
        }else if(!success && !init){
            error_img.show();
            error_popup_message.show();
            setTimeout(function(){
                current_delete_name = '';
                popup_ok.popup('hide')
            },2000)
        }else{
            ok_img.hide();
            ok_message.hide();
            error_img.hide();
            error_popup_message.hide();
            warn_img.show();
            buttons_div.show();
            template_name.text(temp_delete_name);
            warn_message.show();
        }
    };
    yes_button.click(function(){
        warn_message.hide();
        warn_img.hide();
        buttons_div.hide();
        deleting_message.show();
        spin.show();
        setTimeout(deleteTemplate(temp_delete_name),800);
    });
    no_button.click(function(){
        temp_delete_name = '';
    });
    popup_ok.popup({
        closeelement: '.confirm_popup_close',
        blur : false,
        transition: 'all 0.3s'
    });
    var setAction = function(){
        var ex = $('#example');
        ex.find('tbody').on('click','.del', function(){
            var parent = $(this).parent().parent();
            temp_delete_name = parent.find('td:nth-child(2)').text();
            $.when(draw_info(false, true)).then(popup_ok.popup('show'));
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
            language: getLocale(locale),
            'processing': true,
            'columns': [
                {'data':'#'},
                {'data': 'Name'},
                {'data': 'Action'}
            ],
            'columnDefs': [ {
                'targets': -1,
                'data': 'Action',
                'defaultContent': "<button class='edit'></button><button class='del'></button>"
            }, {
            'searchable': false,
            'orderable': false,
            'targets': [2]
        }]
        });
    };
    var deleteTemplate = function(name){
        if(name == current_delete_name){
            draw_info(false, false);
            return;
        }
        current_delete_name = name;
        var url = '/templates/remove/'+name;
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: 'POST',
            url:url,
            success: function(result){
                draw_info(true, false);
                current_delete_name = "";
                temp_delete_name = "";
            },
            error: function(result){
                draw_info(false, false);
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