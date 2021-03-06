var entries = 'entries';
var generateDataTables_en = function(){
    return {
        processing: "<img src='/resources/images/templates/pagination/ajax-loader.gif'>",
        search:         "Search:",
        lengthMenu:     "Show _MENU_ "+entries,
        info:           "Showing _START_ to _END_ of _TOTAL_ " + entries,
        infoEmpty:      "Showing 0 to 0 of 0 " + entries,
        infoFiltered:   "(filtered from _MAX_ total "+ entries +")",
        infoPostFix:    "",
        zeroRecords:    "No matching records found",
        emptyTable:     "No data available in table",
        paginate: {
            first:      "First",
            previous:   "Previous",
            next:       "Next",
            last:       "Last"
        }
    };
};
var files_en = ' files';
var file_en = ' file';
var upload_error_msg_en = '  not uploaded ☹';
var upload_info_msg_en = ' uploaded.';
var user_duplicate_email_msg_en = 'User with this email already exist..';
var error_msg_global_en = ' Oops.. something wrong =/';
var user_info_msg_en = "Click 'Accept' to save the changes for the current user.";
var add_new_en = 'Add New';
var edit_element_en = 'Edit Element';

var generateDataTables_nl = function(){
    return {
        processing: "<img src='/resources/images/templates/pagination/ajax-loader.gif'>",
        search: "Zoeken:",
        lengthMenu:     "Toon _MENU_ "+entries,
        info:           "Toont _START_ tot _END_ van _TOTAL_ " + entries,
        infoEmpty:      "Toont 0 tot 0 van 0 " + entries,
        infoFiltered:   "(Gefilterd van _MAX_ totaal "+ entries +")",
        infoPostFix: "",
        zeroRecords: "Geen overeenkomende records gevonden",
        emptyTable: "Geen data beschikbaar in tabel",
        paginate: {
            first: "Eerste",
            previous: "Vorige",
            next: "Volgende",
            last: "Laatste"
        }
    };
};
var files_nl = ' bestanden';
var file_nl = ' bestand';
var upload_error_msg_nl = '  niet geupload ☹';
var upload_info_msg_nl = ' geupload.';
var user_duplicate_email_msg_nl = 'Gebruiker met deze e-mail bestaat al..';
var error_msg_global_nl = ' Oeps, er is iets mis gegaan ☹';
var user_info_msg_nl = "Klik 'Accepteren'  om wijzigingen aan gebruiker op te slaan.";
var add_new_nl = 'Nieuwe Toevoegen';
var edit_element_nl = 'Element bewerken';

var getLocale = function(locale, custom_entries){
    if(custom_entries != undefined && custom_entries.length > 0) entries = custom_entries;
    switch (locale){
        case 'en': return generateDataTables_en();
        case 'nl': return generateDataTables_nl();
        default : return generateDataTables_nl();
    }
};