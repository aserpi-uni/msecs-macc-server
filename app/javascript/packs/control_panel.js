import 'images/welcome_good_place.svg'

function welcome_img_margin() {
    const welcome_img = $("#welcome_img");
    welcome_img.css("margin-top", (document.documentElement.clientHeight - welcome_img.height())/3 + "px");
}

$(window).on("load", welcome_img_margin);
$(window).resize(welcome_img_margin);
