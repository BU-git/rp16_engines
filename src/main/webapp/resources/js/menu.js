$(window).load(function() {
    $('#content').wrap('<div id="content-wrapper">');
    $('#menu-toggle')
        .click(function(){
            $('body').toggleClass('menu-on');
        })
        .add('#right-menu, #left-menu')
        .on('touchstart', function(e){e.stopPropagation();})
        .on('touchend', function(e){e.stopPropagation();});
});