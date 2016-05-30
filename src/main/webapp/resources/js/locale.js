var dataTables_en = {
    processing: "<img src='/resources/images/templates/pagination/ajax-loader.gif'>",
    search:         "Search:",
    lengthMenu:     "Show _MENU_ orders",
    info:           "Showing _START_ to _END_ of _TOTAL_ orders",
    infoEmpty:      "Showing 0 to 0 of 0 entries",
    infoFiltered:   "(filtered from _MAX_ total orders)",
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
var files_en = ' files';
var file_en = ' file';
var upload_error_msg_en = '  not uploaded ☹';
var upload_info_msg_en = ' uploaded.';
var user_duplicate_email_msg_en = 'User with this email already exist..';
var error_msg_global_en = ' Oops.. something wrong =/';
var user_info_msg_en = "Click 'Accept' to save the changes for the current user.";

var dataTables_nl = {
    processing: "<img src='/resources/images/templates/pagination/ajax-loader.gif'>",
    search:         "NL_Search:",
    lengthMenu:     "NL_Show _MENU_ orders",
    info:           "NL_Showing _START_ to _END_ of _TOTAL_ orders",
    infoEmpty:      "NL_Showing 0 to 0 of 0 entries",
    infoFiltered:   "NL_(filtered from _MAX_ total orders)",
    infoPostFix:    "",
    zeroRecords:    "NL_No matching records found",
    emptyTable:     "NL_No data available in table",
    paginate: {
        first:      "NL_First",
        previous:   "NL_Previous",
        next:       "NL_Next",
        last:       "NL_Last"
    }
};
var files_nl = ' bestanden';
var file_nl = ' bestand';
var upload_error_msg_nl = '  niet geupload ☹';
var upload_info_msg_nl = ' geupload.';
var user_duplicate_email_msg_nl = 'User with this email already exist..';
var error_msg_global_nl = ' Oops.. iets verkeerd =/';
var user_info_msg_nl = "Klik 'Accepteren'  om wijzigingen aan gebruiker op te slaan.";

var getLocale = function(locale){
    switch (locale){
        case 'en': return dataTables_en;
        case 'nl': return dataTables_nl;
        default : return dataTables_en;
    }
};