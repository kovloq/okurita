$(document).ready(function(){
    AOS.init({
        startEvent: 'load',
    });

    //Add page title
    $('title').prepend(pageTitle + ' - ');

    // add active state on menu for current page
    var url = window.location.pathname;
    var slug = url.substring(url.lastIndexOf('/')+1);
    var activeSlug = $('.navbar-nav li a[href="'+ slug +'"]');

    activeSlug.addClass('active');

    if (pageTitle == "Home") {
        $('.navbar-nav li a[href="index.php"]').addClass('active');
    }

    // Slide Hero
    if($('.hero-slide').length){
        $('.hero-slide').slick({
            autoplay: true,
            infinite: true,
            slidesToShow: 1,
            dots: true,
            adaptiveHeight: true,
            arrows: true,
            prevArrow:"<button type='button' class='slick-prev'><i class='fas fa-arrow-left'></i></button>",
            nextArrow:"<button type='button' class='slick-next'><i class='fas fa-arrow-right'></i></button>",
        });
    }

    // Auth Slide Hero
    if($('.auth-slide').length){
        $('.auth-slide').slick({
            autoplay: true,
            infinite: true,
            slidesToShow: 1,
            dots: true,
            adaptiveHeight: true,
            arrows: false,
        });
    }

    // Slide News Home
    if($('.news-slide').length){
        $('.news-slide').slick({
            autoplay: true,
            infinite: true,
            slidesToShow: 1,
            dots: false,
            adaptiveHeight: true,
            arrows: true,
            prevArrow: $('.news-nav').find('.prev'),
            nextArrow: $('.news-nav').find('.next'),
        });
    };

    // Rating
    if($('.rating').length){
        $('.rating').rating();
    };

    // Scrollbar
    if($('.perfect-scrollbar').length) {
        $('.perfect-scrollbar').each(function () {
            const ps = new PerfectScrollbar($(this)[0]);
        });
    };

    // Qty
    if($('.product-qty').length) {
        $(".product-qty").on("click", '.btn-qty', function () {
            var $button = $(this);
            var oldValue = $button.parent().find("input").val();

            if ($button.text() == "+") {
                var newVal = parseFloat(oldValue) + 1;
            } else {
                // Don't allow decrementing below zero
                if (oldValue > 0) {
                    var newVal = parseFloat(oldValue) - 1;
                } else {
                    newVal = 0;
                }
            }

            $button.parent().find("input").val(newVal);
        });
    }

    //Detail Product
    CloudZoom.quickStart();
    // Initialize the slider.
    $(function() {
        $('.slider-thumbnail').Thumbelina({
            orientation:'vertical',         // Use vertical mode (default horizontal).
            $bwdBut:$('.slider-thumbnail .left'),     // Selector to top button.
            $fwdBut:$('.slider-thumbnail .right')   // Selector to bottom button.
        });
    });
});
