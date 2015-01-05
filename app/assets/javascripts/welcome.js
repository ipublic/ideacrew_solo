$(document).ready(function() {

  $('#top-nav').onePageNav({
    currentClass: 'active',
    changeHash: false
  });

  $('#about-header').one('inview', function() {
    $(this).addClass('animated fadeInUp');
  });
});

// $(document).ready(function() {
//   $('#top-nav').onePageNav({
//     currentClass: 'active',
//     changeHash: false,
//     scrollSpeed: 10000,
//     scrollThreshold: 0.5
//   });
// });
