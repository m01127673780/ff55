  
$(document).ready(function () {

  $('#bar').on("click",function () {
    var nav = $("nav");
    var mar = {};
    var marL = {};
    if($('body').css('direction') == 'rtl'){
      mar['marginRight'] = - nav.innerWidth();
      marL['marginRight'] = 0;
    }else{
      mar['marginLeft'] = - nav.innerWidth();
      marL['marginLeft'] = 0;
    }
      if(nav.hasClass('no')){
        nav.animate(marL,500).removeClass('no');

        $('.content').animate({
          width : '80%'
        },500);

        $('#nav-top').animate({
          width : '80%'
        },500);

        $(this).addClass('fa-chevron-left').removeClass('fa-chevron-right');
      }else{

        nav.animate(mar,500).addClass('no');

        $('.content').animate({
          width : '100%'
        },500);

        $('#nav-top').animate({
          width : '100%'
        },500);
        $(this).removeClass('fa-chevron-left').addClass("fa-chevron-right");
      }
  });
  $(".header-dropdown").on('click',function (e) {
    e.stopPropagation();
    $('#lang').fadeIn(300);
  });
  $('html , body').on('click',function () {
    $('#lang').fadeOut(300);
    $('#meunubar').fadeOut(300);
  });


  $("body *").hover(function () {
    $(this).children(".title").delay(500).fadeIn(200);
  },function () {
    $(this).children(".title").fadeOut(200);
  });

  $('.my-prof').click(function (e) {
    e.stopPropagation();
    $('#meunubar').fadeIn(300);
  });





  $(window).on('resize',function () {
    var nav = $("nav");
    if($('body').css('direction') == 'ltr'){
      marginHidden = 'margin-left';
    }else{
      marginHidden = 'margin-right';
    }
      if(!nav.hasClass('no')){
        nav.css('width' , '20%').removeClass('no');

        $('#nav-top').css('width' , '80%');
        $('.content').css('width' , '80%');

        $(this).addClass('fa-chevron-left').removeClass('fa-chevron-right');
      }else{
        nav.css(marginHidden, - nav.innerWidth());

        nav.css('width','20%');

        $('.content').css('width' , '100%');

        $('#nav-top').css('width' , '100%');
        $(this).removeClass('fa-chevron-left').addClass("fa-chevron-right");
      }

  });








  $('#bar-mobile').on('click',function(){
    var nav = $(this).parent('nav');
    var marginHidden = {};
    var marginOpen = {};
    if($('body').css('direction') == 'ltr'){
      marginHidden['margin-left'] = - nav.innerWidth();
      marginOpen['margin-left'] = 0;
    }else{
      marginHidden['margin-right'] = - nav.innerWidth();
      marginOpen['margin-right'] = 0;
    }
    if($(this).hasClass('hidden')){
      nav.animate(marginOpen).end().removeClass('hidden');
      $('#overlay').fadeIn(500);
    }else{
      nav.animate(marginHidden).end().addClass('hidden');
      $('#overlay').fadeOut(500);
    }
  });



  $(function () {
  var attr = $(".edite").find('a').attr('href');
  $('#chek-head').change(function add() {
    $('.chek-body').prop('checked',this.checked);
  });
  $('.chek-body').change(function add() {
    if($(this).prop('checked') == false){
      $('#chek-head').prop('checked',this.checked);
    }
    if($('.chek-body:checked').length == $('.chek-body').length ){
      $('#chek-head').prop('checked','checked');
    }
  });
function changeSelect() {

    if($('.chek-body:checked').length == '1' ){
      $(".edite").find('a').attr('href','?page=Edite&&ID=' + $('.chek-body:checked').parent().next().text());
      $(".edite").removeAttr('disabled');
    }else{
      $(".edite").attr('disabled','disabled');
      $(".edite").find('a').removeAttr('href');
    }


    if($('.chek-body:checked').length > 0 ){
      var id = '';
      for(i = 0; i < $('.chek-body:checked').length; i++ ){
        if(i == $('.chek-body:checked').length - 1 ){
          id += $('.chek-body:checked').parent().next().eq(i).text() ;
        }else{
          id += $('.chek-body:checked').parent().next().eq(i).text() + ',';
        }
      }
      console.log(id);
      $(".delete").find('a').attr('href','?page=Delete&&ID='+ id );
      $(".active").find('a').attr('href','?page=active&&ID='+ id );
      $(".action-all").removeAttr('disabled');
    }else{
      $(".action-all").attr('disabled','disabled');
      $(".action-all").find('a').removeAttr('href');
    }

  }
  $('.chek-body ,#chek-head ').change(changeSelect);
  $('.chek-body').each(changeSelect);
});

 

  $('.input_eff>input').focus(function () {
    $(this).siblings('.eff').animate({'width':'100%'},500);
    console.log('yes');
  });

  $('.input_eff>input').blur(function () {
    $(this).siblings('.eff').animate({'width':'0'},500);
  });
 
  $(".searchMember").blur(function () {
    var pad = {};
    if($('body').css('direction') == 'rtl' ){
      pad['padding-left'] = '14px';
      pad['padding-right'] = '28px';
    }else{
      pad['padding-right'] = '14px';
      pad['padding-left'] = '28px';
    }
    $(this).animate(pad,500).siblings('.icon-search').fadeIn(400);
  });
















/*global jQuery */
/*!
* FitText.js 1.2
*
* Copyright 2011, Dave Rupert http://daverupert.com
* Released under the WTFPL license
* http://sam.zoy.org/wtfpl/
*
* Date: Thu May 05 14:23:00 2011 -0600
*/

(function( $ ){

  $.fn.fitText = function( kompressor, options ) {

    // Setup options
    var compressor = kompressor || 1,
        settings = $.extend({
          'minFontSize' : Number.NEGATIVE_INFINITY,
          'maxFontSize' : Number.POSITIVE_INFINITY
        }, options);

    return this.each(function(){

      // Store the object
      var $this = $(this);

      // Resizer() resizes items based on the object width divided by the compressor * 10
      var resizer = function () {
        $this.css('font-size', Math.max(Math.min($this.width() / (compressor*10), parseFloat(settings.maxFontSize)), parseFloat(settings.minFontSize)));
      };

      // Call once to set.
      resizer();

      // Call on resize. Opera debounces their resize by default.
      $(window).on('resize.fittext orientationchange.fittext', resizer);

    });

  };

})( jQuery );







// blugens ===================================







});








$(window).on('resize',media);
$(document).ready(media);
// variaber
var nav = $('#bar-mobile').parent('nav');
function media() {
// media Mobile
if($(window).innerWidth() < 480){
  $('body').fitText(20,{ minFontSize: '10px', maxFontSize: '16px' });
  $('#bar-mobile').show();
  $('#nav-top').innerWidth('100%');
  $("#nav-top>#bar").hide();
  $('#overlay').click(closeMuenu).click();
}
// media tablet
if($(window).innerWidth() < 991 && $(window).innerWidth() > 481){
  $('body').fitText(8,{ minFontSize: '15px', maxFontSize: '16px' });
  $('#meunubar').fitText(20,{ minFontSize: '10px', maxFontSize: '16px' });
  $('#bar-mobile').show();
  $('#nav-top').innerWidth('100%');
  $("#nav-top>#bar").hide();
  $('#overlay').click(closeMuenu).click();


}
// media desktop
if( 1280 > $(window).innerWidth() && $(window).innerWidth() > 992){
  $('body,#meunubar').fitText(7,{ minFontSize: '15px', maxFontSize: '16px' });
  $('#overlay,#bar-mobile').hide();
  if($('body').css('direction') == 'ltr'){
    marginHidden = 'margin-left';
  }else{
    marginHidden = 'margin-right';
  }
  nav.css(marginHidden, 0);

}
// media huge
if($(window).innerWidth() > 1281  ){
  $('body,#meunubar').fitText(6,{ minFontSize: '15px', maxFontSize: '16px' });
  $('#overlay,#bar-mobile').hide();

  if($('body').css('direction') == 'ltr'){
    marginHidden = 'margin-left';
  }else{
    marginHidden = 'margin-right';
  }
  nav.css(marginHidden, 0);
}
}
 








