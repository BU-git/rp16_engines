$(function(){
    var popup_ok = $('#popup_ok');
    var popup_error = $('#popup_error');
    var submit = $('#register');
    var label_for_name = $('#for_name');
    var label_for_mail = $('#for_mail');
    var label_for_password = $('#for_password');
    var input_email = $('#email');
    var input_name = $('#name');
    var input_password = $('#password');
    var check1 = $('#check1');
    var check2 = $('#check2');
    var check3 = $('#check3');
    var warn1 = $('#warn1');
    var warn2 = $('#warn2');
    var warn3 = $('#warn3');
    var message = "Oops.. something wrong =/";
    var errorMessage = $('#right_side_error').find('p');

    var check_input_not_empty = function(input){
        return input.val().length > 2;
    };
    var check_all_input_not_empty = function(){
        if(!(input_email.val().length > 5) && !isEmail(input_email.val())) return false;
        if(!(input_name.val().length > 2)) return false;
        return input_password.val().length > 2;
    };
    var enable_submit = function(){
        if(check_all_input_not_empty() && isEmail(input_email.val())) {
            submit.prop('disabled',false);
            return false;
        }
        else{
            submit.prop('disabled',true);
            return true;
        }
    };
    var paint_info = function(input, label, red, warn, check){
        if(!red){
            input.css('color','#FF4545');
            label.css('color','#FF4545');
            warn.css('display', 'inline');
            check.css('display','none');

        }else{
            input.css('color','black');
            label.css('color','#45BF5B');
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
    input_password.bind('input propertychange', function(){
        paint_info(input_password, label_for_password, check_input_not_empty(input_password),warn3,check3);
        enable_submit();
    });
    function isEmail() {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(input_email.val());
    }
    /*var generateHash = function(message){
        var hash = CryptoJS.SHA3(message);
        console.log(hash.toString());
    };*/
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
                    window.location.replace("/dashboard");
                }, 2500);
        },
        blur : false,
        transition: 'all 0.3s'
    });
    submit.click(function(){
        var user = {'email':input_email.val(),'name':input_name.val(),'password':input_password.val()};
        user = JSON.stringify(user);
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: "POST",
            url:"/register/user",
            data: user,
            success: function(result){
                popup_ok.popup('show')
            },
            error: function(result){
                console.log(result.status);
                errorHandler(result.status);
            }
        });
        /*generateHash(input_password.val());*/
    });
    var errorHandler = function(status){
        switch(status){
            case 400:{
                errorMessage.text('User with this email already exist..');
                break;
            }
            default: errorMessage.text(status+" "+message);
        }
        popup_error.popup('show');
    };
});