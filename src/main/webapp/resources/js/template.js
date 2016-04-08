jQuery(function(){
    var removed = [];

    var count = 1;
    var delete_click = function(){
        var c = count;
        var selector = "#delete"+c;
        $(selector).click(function(){
            if(removed.length + 1 < count){
                console.log("removed.length" + removed.length);
                selector = "#show" + c;
                $(selector).fadeOut("slow");
                removed.push(c);
            }
        });
    };
    var ssave = function(){

    };
    var save = function(id){
        var selector = 'button#save' + id;
        return $(selector);
    };
    var drawContent = function(){
        var selector = "#show" +count;
        $('#battlefield').append('<div style="display: none" id="show'+count+'"><table id="element'+count+'"><tr><td><label>Field Type<select id="fieldType'+count+'">' +
            '<option value="Text Field">Text Field</option><option value="CheckBox">CheckBox</option>' +
            '<option value="Text Area">Text Area</option></select></label></td><td><button class="delete" disabled="disabled" id="delete'+count+'">Delete</button></td>' +
            '<td><button class="accept" id="accept'+count+'">Accept</button></td><td class="preview" style="display: none" id="preview'+count+'" rowspan="2"></td></tr>' +
            '<tr><td colspan="3"><label>Field description<textarea id="field_description'+count+'" rows="5" cols="35" class="label_description"></textarea></label></td></tr>' +
            '<span id="sp' + count + '"hidden="hidden">enabled</span></table></div><div id="fantom'+count+'"><table class="middle"><tr>' +
            '<td><button class="add_new" disabled = "disabled" id="add_new'+count+'">+</button></td></tr></table>' +
            '<div class="save_form"><button disabled = "disabled" class="save" id="save'+count+'">Save</button></div></div> ');
        $(selector).fadeIn("slow");
        delete_click();
        console.log("count = " + count);
        selector = '#add_new' + count;
        if(count > 1){
            $(selector).click(function(){
                console.log(count);
                var selector = '#fantom'+count;
                $(selector).empty();
                count++;
                drawContent();
                enable_add_new(true);
                accept_click();
            });
        }

        selector = '#save' + count;
        $(selector).click(function(){
            var fields = [];
            var persons = [];
            var p1 = {"name":"jde"};
            persons.push(p1);
            for(var i = 1; i<= count; i++){
                var rm = false;
                for(var k = 0; k< removed.length; k++){
                    rm = (i== removed[k]);
                }
                if(!rm){
                    var fieldType = '#fieldType' +i;
                    fieldType = $(fieldType).val();
                    var fieldValue = "#field_description" +i;
                    fieldValue = $(fieldValue).val();
                    var field = {'fieldType': fieldType, 'fieldValue': fieldValue};
                    fields.push(field);
                }
            }
            fields = JSON.stringify({
                'fields' : fields

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
    };
    var accept_click = function(){
        var c = count;
        var button = "#accept" + c;
        $(button).click(function(){
            var field_description = "#field_description" + c;
            if($(field_description).val().length < 1) {
                alert("Field description cannot be empty!!!");
                return;
            }
            if(count == 1) $('#prev').fadeIn("slow");
            var  selector = "#sp"+c;
            var enabled = $(selector).text();
            enabled = enabled != "disabled";
            disableFormFields(c, enabled);
            if(!enabled) {
                $(selector).text("enabled");
                $(button).text("Accept");
            }
            else{
                $(button).text("Edit");
                $(selector).text("disabled");
            }
            /*var field_description_last = "#field_description" + count;*/
            enable_add_new(!enabled);
            selector = "#fieldType" + c;
            if(enabled) show_preview($(selector).val(), c);
        });
    };
    var add_new = function(id){
        var selector = 'button#add_new' + id;
        return ($(selector));
    };
    drawContent();
    accept_click();


    add_new(count).click(function(){
        var selector = '#fantom'+count;
        $(selector).empty();
        count++;
        drawContent();
        enable_add_new(true);
        accept_click();
    });


    var show_preview = function(type, number){
        var selectorPreview = "#preview" + number;
        var fieldDescription = "#field_description" + number;
        var preview_description= "#preview_description" + number;
        fieldDescription = $(fieldDescription);
        selectorPreview = $(selectorPreview);
        preview_description =  $(preview_description);
        switch (type){
            case "Text Field":{
                draw_preview('<input readonly class="text" type="text"/>',selectorPreview,preview_description,fieldDescription, number);
                break;
            }
            case "CheckBox":{
                draw_preview('<input readonly type="checkbox"/>', selectorPreview,preview_description,fieldDescription, number);
                break;
            }
            case "Text Area":{
                draw_preview('<textarea readonly rows="2" cols="25"></textarea>', selectorPreview,preview_description,fieldDescription, number);
                break;
            }
        }
    };
    var draw_preview = function (text, selectorPreview, preview_description, fieldDescription, number) {
        selectorPreview.empty();
        selectorPreview.append('<label><span id="preview_description'+number+'">'+fieldDescription.val()+'</span>'+text+'</<label>');
        selectorPreview.fadeIn("slow");
    };

    var enable_add_new = function(enable){
       /* console.log(count);*/
        save(count).prop("disabled", enable);
        add_new(count).prop("disabled", enable);
    };
    var disableFormFields = function(number, enabled){
        var selector = "#fieldType" + number;
        $(selector).prop("disabled", enabled);
        selector = "#delete" + number;
        $(selector).prop("disabled", !enabled);
        selector = "#field_description" + number;
        $(selector).prop("disabled", enabled);
    };



});