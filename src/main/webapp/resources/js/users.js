$(document).ready(function() {
    var table;
    var message = " Oops.. something wrong =/";
    var edit_popup = $('#edit_popup');
    var popup_ok = $('#popup_ok');
    var accept = $('#accept');
    var label_for_mail = $('#for_mail');
    var label_for_name = $('#for_name');
    var label_for_number = $('#for_number');
    var input_email = $('#email');
    var input_name = $('#name');
    var input_number = $('#number');
    var check1 = $('#check1');
    var check2 = $('#check2');
    var check3 = $('#check3');
    var warn1 = $('#warn1');
    var warn2 = $('#warn2');
    var warn3 = $('#warn3');
    var info = $('#info');
    var current_id = 0;
    var delete_id = 0;
    var name_td;
    var email_td;
    var number_td;
    var role_td;
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
    var delete_name;
    var user_name = $('#identifier');
    var current_user = 0;
    var temp_user = 0;

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
                current_user = 0;
                popup_ok.popup('hide')
            },2000)
        }else{
            ok_img.hide();
            ok_message.hide();
            error_img.hide();
            error_popup_message.hide();
            warn_img.show();
            buttons_div.show();
            user_name.text(delete_name);
            warn_message.show();
        }
    };
    yes_button.click(function(){
        warn_message.hide();
        warn_img.hide();
        buttons_div.hide();
        deleting_message.show();
        spin.show();
        setTimeout(deleteUser(delete_id),800);
    });
    no_button.click(function(){
        temp_user = 0;
    });

    edit_popup.popup({
        onclose: function(){
            setTimeout(function(){
                paint_info(input_email, label_for_mail, true,warn1,check1);
                paint_info(input_name, label_for_name, true,warn2,check2);
                paint_info(input_number, label_for_number, true,warn3,check3);
                label_for_mail.css('color','#9FAAB5');
            }, 500);
        },
        closeelement: '.edit_popup_close',
        openelement: '.edit',
        blur : false,
        transition: 'all 0.3s'
    });
    var check_input_not_empty = function(input){
        return input.val().length > 2;
    };
    var check_all_input_not_empty = function(){
        if(!(input_email.val().length > 5) && !isEmail(input_email.val())) return false;
        return input_name.val().length > 2;
    };
    var enable_submit = function(){
        if(check_all_input_not_empty() && isEmail(input_email.val())) {
            accept.prop('disabled',false);
            return false;
        }
        else{
            accept.prop('disabled',true);
            return true;
        }
    };
    popup_ok.popup({
        closeelement: '.confirm_popup_close',
        blur : false,
        transition: 'all 0.3s'
    });
    var update = function(){
        var role = "user";
        var user = {'Id':current_id,'Email':input_email.val(),'Name':input_name.val(),'Number':parseInt(input_number.val()),'Role':role};
        user = JSON.stringify(user);
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: "POST",
            url: '/users/update/',
            data: user,
            success: function(result){
                row_update();
                edit_popup.popup('hide');
            },
            error: function(result){
                errorHandler(result.status);
            }
        });
    };
    var row_update = function(){
        name_td.text(input_name.val());
        email_td.text(input_email.val());
        var number = input_number.val();
        number_td.text(input_number.val().length > 0 ? number : 0);
    };
    accept.click(function(){
        update();
    });
    var paint_info = function(input, label, red, warn, check){
        if(!red){
            input.css('color','#FF4545');
            label.css('color','#FF4545');
            warn.css('display', 'inline');
            check.css('display','none');
        }else{
            input.css('color','black');
            label.css('color','#9FAAB5');
            check.css('display','inline');
            warn.css('display', 'none');
        }
    };
    input_email.bind('input propertychange', function(){
        paint_info(input_email, label_for_mail, (check_input_not_empty(input_email))&&(isEmail(input_email.val())),warn1,check1);
        enable_submit();
    });
    input_name.bind('input propertychange', function(){
        paint_info(input_name, label_for_name, check_input_not_empty(input_name),warn2,check2);
        enable_submit();
    });
    input_number.bind('input propertychange', function(){
        var value = input_number.val();
        input_number.val(value.replace(/[^0-9]/g,''));
    });
    function isEmail() {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(input_email.val());
    }
    var setEditAction = function(){
        $('#example').find('tbody').on('click','.edit', function(){
            var parent = $(this).parent().parent();
            current_id = parseInt(parent.find("td:nth-child(1)").text());
            name_td = parent.find("td:nth-child(2)");
            email_td = parent.find("td:nth-child(3)");
            number_td = parent.find("td:nth-child(4)");
            role_td = parent.find("td:nth-child(5)");
            input_name.val(name_td.text());
            input_email.val(email_td.text());
            input_number.val(number_td.text());
        });
    };
    var setAction = function(){
        $('#example').find('tbody').on('click','.del', function(){
            var parent = $(this).parent().parent();
            delete_id = parseInt(parent.find("td:nth-child(1)").text());
            delete_name = parent.find("td:nth-child(2)").text();
            $.when(draw_info(false, true)).then(popup_ok.popup('show'));
        });
    };
    var deleteUser = function(id){
        if(id == current_user) {
            draw_info(false, false);
            return;
        }
        current_user = id;
        var url = '/users/remove/'+id;
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: "POST",
            url:url,
            success: function(result){
                draw_info(true, false);
                current_user = 0;
            },
            error: function(result){
                draw_info(false, false);
            }
        })
    };
    var initTable = function(){
        table = $('#example').DataTable({
            'ajax': {
                'url': '/users/all/',
                'type': 'POST'
            },
            language: {
                'processing': "<img src='/resources/images/templates/pagination/ajax-loader.gif'>"
            },
            "processing": true,
            'columns': [
                {'data': 'Id'},
                {'data': 'Name'},
                {'data': 'Email'},
                {'data': 'Number'},
                {'data': 'Role'},
                {'data': 'Action'}
            ],
            "columnDefs": [ {
                "targets": -1,
                "data": 'Action',
                "defaultContent": "<button class='edit'></button><button class='del'></button>"
            }, {
                    "searchable": false,
                    "orderable": false,
                    "targets": [5]
            }]
        });
    };
    var display_error_message = function(text){
        info.text(text);
        info.css('color', '#FF4545');
        info.css('text-align','center');
        setTimeout(function(){
            $.when(info.fadeOut('slow')).then(setTimeout(function(){
                info.css('color', '#838585');
                info.text("Click 'Accept' to save the changes for the current user.");
                info.css('text-align','justify');
            },500)).then(info.fadeIn('fast'));
        }, 3500);
    };
    var errorHandler = function(status){
        switch(status){
            case 400:{
                display_error_message('User with this email already exist..');
                paint_info(input_email, label_for_mail, false, warn1,check1);
                break;
            }
            default: display_error_message(status+" "+message);
        }
    };
    $.when(initTable()).then(setAction()).then(setEditAction());
});