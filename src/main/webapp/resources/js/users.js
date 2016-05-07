$(document).ready(function() {
    var table;
    var edit_popup = $('#edit_popup');
    var accept = $('#accept');
    var label_for_name = $('#for_name');
    var label_for_mail = $('#for_mail');
    var label_for_number = $('#for_number');
    var input_email = $('#email');
    var input_name = $('#name');
    var input_number = $('#number');
    var input_role = $('#role');
    var check1 = $('#check1');
    var check2 = $('#check2');
    var check3 = $('#check3');
    var warn1 = $('#warn1');
    var warn2 = $('#warn2');
    var warn3 = $('#warn3');
    var current_id = 0;
    var name_td;
    var email_td;
    var number_td;
    var role_td;
    edit_popup.popup({
        onopen: function(){
            $('.popup_area').val("");
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
        if(!(input_name.val().length > 2)) return false;
        return input_number.val().length > 2;
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
    var update = function(){
        var role = "user";
        if(input_role.prop('checked')) role = "admin";
        var user = {'Id':current_id,'Email':input_email.val(),'Name':input_name.val(),'Number':parseInt(input_number.val()),'Role':role};
        user = JSON.stringify(user);
        console.log(user);
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
                console.log(result.status);
            }
        });
    };
    var row_update = function(){
        name_td.text(input_name.val());
        email_td.text(input_email.val());
        number_td.text(input_number.val());
        role_td.text(input_role.prop('checked') ? 'admin' :'user');
    };
    accept.click(function(){
        update();
    });
    var paint_info = function(input, label, red, warn, check){
        if(!red){
            /*input.css('color','#FF4545');
            label.css('color','#9FAAB5');*/
            warn.css('display', 'inline');
            check.css('display','none');

        }else{
            /*input.css('color','black');
            label.css('color','#9FAAB5');*/
            check.css('display','inline');
            warn.css('display', 'none');
        }
    };
    input_email.bind('input propertychange', function(){
        paint_info(input_email,label_for_mail, (check_input_not_empty(input_email))&&(isEmail(input_email.val())),warn1,check1);
        enable_submit();
    });
    input_name.bind('input propertychange', function(){
        paint_info(input_name, label_for_name, check_input_not_empty(input_name),warn2,check2);
        enable_submit();
    });
    input_number.bind('input propertychange', function(){
        paint_info(input_number, label_for_number, check_input_not_empty(input_number),warn3,check3);
        enable_submit();
    });
    function isEmail() {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(input_email.val());
    }
    var setEditAction = function(){
        setTimeout(function(){
            $('.edit').each(function(){
                $(this).click(function(e){
                    var parent = $(this).parent().parent();
                    current_id = parseInt(parent.find("td:nth-child(1)").text());
                    name_td = parent.find("td:nth-child(2)");
                    email_td = parent.find("td:nth-child(3)");
                    number_td = parent.find("td:nth-child(4)");
                    role_td = parent.find("td:nth-child(5)");
                    input_name.val(name_td.text());
                    input_email.val(email_td.text());
                    input_number.val(number_td.text());
                    if(role_td.text() == "admin"){
                        input_role.prop("checked", true);
                    }else input_role.prop("checked", false);
                })
            })
        },500)
    };
    var setAction = function(){
        setTimeout(
            function(){
                $('.del').each(function(){
                    $(this).click(function(e){
                        var parent = $(this).parent().parent();
                        current_id = parseInt(parent.find("td:nth-child(1)").text());
                        $.when(deleteTemplate(current_id)).then(function(){
                            setTimeout(function(){
                                table.ajax.reload();
                            }, 300);
                        }).then(setTimeout(setAction(), 300)).then(setTimeout(setEditAction(), 300))
                    })
                })
            }, 500);
    };
    var deleteTemplate = function(id){
        var url = '/users/remove/'+id;
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: "POST",
            url:url/*,
             success: table.ajax.reload()*/
        })
    };
    var initTable = function(){
        table = $('#example').DataTable({
            'ajax': '/users/get/all',
            'columns': [
                {'data':'Id'},
                {'data': 'Name'},
                {'data': 'Email'},
                {'data': 'Number'},
                {'data': 'Role'},
                {'data': 'Action'}
            ]
        });
    };
    $.when(initTable()).then(setAction()).then(setEditAction());
});