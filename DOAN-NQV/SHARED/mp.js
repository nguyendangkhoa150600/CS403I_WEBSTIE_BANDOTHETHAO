$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 90) {
            $('.menutop').addClass('doimenu');
            $('.menutopp').addClass('doimenu');
            $('.menu1').addClass('doimauchu');
            $('.menu2').addClass('doimauchu');
            $('.nuttop').addClass('hientop');
        }
        else {
            $('.menutop').removeClass('doimenu');
            $('.menutopp').removeClass('doimenu');
            $('.nuttop').removeClass('hientop');
            $('.menu1').removeClass('doimauchu');
            $('.menu2').removeClass('doimauchu');
        };




    });


    $('.top').click(function () {
        $('html,body').animate({ scrollTop: 0 }, 2000);
    });

   

    $('.home').click(function (e) {
        $('html,body').animate({ scrollTop: 0 }, 2000);

    });


    $('.pll').click(function (e) {
        $('.bll').addClass('hien');

    });


    $('.dbll').click(function (e) {
        $('.bll').removeClass('hien');

    });








    $('.menutop ul li:nth-child(2) a').click(function (e) {
        e.preventDefault();
        $('html,body').animate({ scrollTop: 540 }, 2000);

    });
    $('.menutop ul li:nth-child(3) a').click(function (e) {
        e.preventDefault();
        $('html,body').animate({ scrollTop: 1560 }, 2000);

    });
    $('.menutop ul li:nth-child(4) a').click(function (e) {
        e.preventDefault();
        $('html,body').animate({ scrollTop: 2640 }, 2000);

    });
    $('.menutop ul li:nth-child(5) a').click(function (e) {
        e.preventDefault();
        $('html,body').animate({ scrollTop: 3700 }, 2000);

    });




    $('.menutopp ul li:nth-child(1) a').click(function (e) {
        e.preventDefault();
        $('html,body').animate({ scrollTop: $('.lienhe').offset().top }, 2000);

    });
    $('.menutopp ul li:nth-child(2) a').click(function (e) {
        e.preventDefault();
        $('html,body').animate({ scrollTop: $('.lienhe').offset().top }, 2000);

    });


    
    









    $(window).scroll(function () {
        if ($(this).scrollTop() > 505) {
            $('.1').addClass('doimauchumenu');

        }
        else {
            $('.1').removeClass('doimauchumenu');

        };
        if ($(this).scrollTop() > 1515) {
            $('.1').removeClass('doimauchumenu');
        }

        if ($(this).scrollTop() > 1518) {
            $('.2').addClass('doimauchumenu');

        }
        else {
            $('.2').removeClass('doimauchumenu');

        };
        if ($(this).scrollTop() > 2495) {
            $('.2').removeClass('doimauchumenu');
        }

        if ($(this).scrollTop() > 2498) {
            $('.3').addClass('doimauchumenu');

        }
        else {
            $('.3').removeClass('doimauchumenu');

        };
        if ($(this).scrollTop() > 3502) {
            $('.3').removeClass('doimauchumenu');
        }


        if ($(this).scrollTop() > 3505) {
            $('.4').addClass('doimauchumenu');

        }
        else {
            $('.4').removeClass('doimauchumenu');

        };
        if ($(this).scrollTop() > 4006) {
            $('.4').removeClass('doimauchumenu');
        }






    });





   








});

$(document).ready(function () {
    (function(){
      var flag = true;
      $("#cart").on("click", function() {
          if (flag) {
              $(".shopping-cart").fadeIn();
          } else {
              $(".shopping-cart").fadeOut();
          }
          flag = !flag;
      });

    })();
})


