var navigation = responsiveNav(".nav-collapse", {
    animate: true,                    // Boolean: Use CSS3 transitions, true or false
    transition: 284,                  // Integer: Speed of the transition, in milliseconds
    label: "Menu",                    // String: Label for the navigation toggle
    insert: "before",                  // String: Insert the toggle before or after the navigation
    customToggle: "",                 // Selector: Specify the ID of a custom toggle
    closeOnNavClick: false,           // Boolean: Close the navigation when one of the links are clicked
    openPos: "relative",              // String: Position of the opened nav, relative or static
    navClass: "nav-collapse",         // String: Default CSS class. If changed, you need to edit the CSS too!
    navActiveClass: "js-nav-active",  // String: Class that is added to <html> element when nav is active
    jsClass: "js",                    // String: 'JS enabled' class which is added to <html> element
    init: function(){},               // Function: Init callback
    open: function(){},               // Function: Open callback
    close: function(){}               // Function: Close callback
});


// Go to top
$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('.right-side-fixed .rsf-link.rsf-top').css('display', 'block');
    } else {
        $('.right-side-fixed .rsf-link.rsf-top').css('display', 'none');
    }
});

$(document).on('click', '.right-side-fixed .rsf-top', function() {
    $('html, body').animate({
        scrollTop: 0
    }, 'slow');
    return false;
});

$(function(){
    $('.m-tel,.m-qq').click(function(){
            //$('.slideUp').css({'height':'-moz-calc(100% - 4rem)','height':'-webkit-calc(100% - 4rem)','height':'calc(100% - 4rem)'});
            $('.m-back').css('display','block');
            //$('.m-back').css('display','black');
            $('.slideUp').animate({'top':'0'});
    });
    $('.m-back').click(function(){
            //$('.slideUp').css('height','0');
        //$('.slideUp').css('transform','translateY(1100px)');
        $('.slideUp').animate({'top':'1200px'});
        $('.m-back').css('display','none');
        //$('.m-back').css('display','none');
    });
});