//= require jquery
//= require jquery_ujs

//= require rails-ujs
//= require activestorage

//= require_tree .
/*global $*/

$(document).on('turbolinks:load', function(){
  $('.slick').slick({
    // 自動再生
    autoplay:true,
    // ドットの表示
    dots:true
  });
});
