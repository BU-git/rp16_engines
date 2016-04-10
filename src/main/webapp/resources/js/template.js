$(function(){
    var field_to_be_inserted = "";
    var edit_opened = 0;
    var removed = [];
    var count = 1;
    var text_field = $('#text_field');
    var check_box = $('#check_box');
    var text_area = $('#text_area');
    var popup = $('#my_popup');
    var edit_popup = $('#edit_popup');
    edit_popup.popup({
        onopen: function(){
            $('.popup_area').val("");
        },
        closeelement: '.edit_popup_close',
        openelement: '.edit_popup_open',
        blur : false,
        transition: 'all 0.3s'
    });
    // Initialize the plugin
    popup.popup({
        onopen: function(){
            $('.popup_area').val("");
            $('#add_to_form').prop("disabled", true);
        },
        blur : false,
        transition: 'all 0.3s'
    });
    var hd = $('.hd');
    text_field.click(function(){
        hd.text("Add New Text Field");
        field_to_be_inserted = "text field";
        edit_delete_feature(777);
    });
    check_box.click(function(){
        hd.text("Add New CheckBox");
        field_to_be_inserted = "check box";
        edit_delete_feature(777);
    });
    text_area.click(function(){
        hd.text("Add New Text Area");
        field_to_be_inserted = "text area";
        edit_delete_feature(777);
    });
    // check for field description is not empty
    var popup_area = $('#popup_area');
    popup_area.bind('input propertychange',function(){
        var add_to_form =  $('#add_to_form');
        if(popup_area.val().length < 1) add_to_form.prop("disabled", true);
        else add_to_form.prop("disabled", false);
    });
    //check for template name is not empty
    var template_name = $('#template_name');
    var save_button = $('#save_button');
    var accept_button = $('#accept');
    var edit_area = $('#edit_area');
    var edit_button = $('#edit_button');
    template_name.bind('input propertychange', function(){
        check_template_is_not_empty();
        check_for_fields_alive();
    });
    var check_template_is_not_empty = function(){
        if(template_name.val().length < 1) save_button.prop("disabled", true);
        else save_button.prop("disabled", false);
    };
    edit_area.bind('input propertychange',function(){
        if(edit_area.val().length < 1)accept_button.prop("disabled", true);
        else accept_button.prop("disabled", false);
    });
    $('#add_to_form').click(function(){
        $('.prev').append('<tr class="row" id="row'+count+'" class="prev_element"><td>' +
            '<button class="delete" id="delete'+count+'"></button><button class="edit_popup_open" id="edit'+count+'"></button></td>' +
            '<td>'+getFieldType(field_to_be_inserted)+'<span hidden id="fieldType'+count+'">'+field_to_be_inserted+'</span></td></tr>');
        $('.prev_element').fadeIn();
        var selector = '#edit' +count;
        edit_on_click(count, selector);
        selector = '#delete' + count;
        delete_on_click(count, selector);
        count++;
        check_for_fields_alive();
    });
    accept_button.click(function(){
        var selector = '#fieldDescription' + edit_opened;
        $(selector).text(edit_area.val());
    });
    var delete_on_click = function(number, selector){
        $(selector).click(function(){
            selector = '#row' + number;
            removed.push(number);
            $(selector).remove();
            check_for_fields_alive();
        });
    };
    var check_for_fields_alive = function(){
        console.log("removed: " + removed.length + ', count: ' + (count-1));
        if(removed.length == (count - 1)) {
            save_button.prop("disabled", true);
            edit_button.prop("disabled", true);
        }
        else {
            check_template_is_not_empty();
            edit_button.prop("disabled", false);
        }
    };
    var edit_on_click = function(number, selector){
        $(selector).click(function(){
            hd.text("Edit Element");
            selector = '#fieldDescription' + number;
            edit_opened = number;
            edit_area.val($(selector).text());
        });
    };
    var getFieldType = function(type){
        var popup_area = $('#popup_area');
        switch (type){
            case "text field": return '<label id="fieldDescription'+count+'">'+popup_area.val().replace(/</g, "&lt;").replace(/>/g, "&gt;")+'</label><input placeholder="Text Field" readonly class="textField" type="text">';
            case "check box": return '<input checked class="checkBoxField" type="checkbox"><label id="fieldDescription'+count+'">'+popup_area.val().replace(/</g, "&lt;").replace(/>/g, "&gt;")+'</label>';
            case "text area": return '<label id="fieldDescription'+count+'">'+popup_area.val().replace(/</g, "&lt;").replace(/>/g, "&gt;")+'</label><textarea rows="3" cols="45" readonly class="textArea" placeholder="Text Area"></textarea>';
        }
    };
    var edit_delete_feature = function(fadeOut){
        var delete_buttons = $('.delete');
        var edit_popup_open_buttons = $('.edit_popup_open');
        if(fadeOut == 777){
            delete_buttons.fadeOut();
            edit_popup_open_buttons.fadeOut();
        }else{
            delete_buttons.fadeToggle();
            edit_popup_open_buttons.fadeToggle();
        }
    };
    save_button.click(function(){
        var fields = [];
        for(var i=1; i <= count; i++){
            var rm = false;
            for(var k=0; k < removed.length; k++){
                rm = (i== removed[k]);
            }
            if(!rm) {
                var fieldType = '#fieldType' + i;
                var fieldValue = '#fieldDescription' + i;
                fieldType = $(fieldType).text();
                fieldValue = $(fieldValue).text();
                if (fieldType != undefined && fieldType.length > 0 && fieldValue != undefined) {
                    var field = {'fieldType': fieldType, 'fieldValue': fieldValue};
                    fields.push(field);
                }
            }
        }
        fields = JSON.stringify({
            'fields' : fields,
            'templateName': template_name.val()
        });
        $.ajax({
            dataType: "html",
            contentType: 'application/json',
            mimeType: 'application/json',
            type: "POST",
            url:"/templates/save",
            data: fields
        });
    });
    edit_button.click(function(){
        edit_delete_feature(111);
    });
});