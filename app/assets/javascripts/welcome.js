$(document).ready(function() {

  $('#top-nav').onePageNav({
    currentClass: 'active',
    changeHash: false
  });

  $('#services-header').one('inview', function() {
    $(this).addClass('animated fadeInUp');
  });

  animationHover('#web-technology-service', 'tada');
  animationHover('#operations-support-service', 'tada');
  animationHover('#consulting-service', 'tada');

  animationHover('.playbook', 'pulse');
  animationHover('.playbook', 'pulse');

  function animationHover(element, animation){
    element = $(element);
    element.hover(
      function() {
        element.addClass('animated ' + animation);
      },
      function(){
        //wait for animation to finish before removing classes
        window.setTimeout( function(){
          element.removeClass('animated ' + animation);
        }, 2000);
      }
    );
  };

  function animationClick(element, animation){
    element = $(element);
    element.click(
      function() {
        element.addClass('animated ' + animation);
        //wait for animation to finish before removing classes
        window.setTimeout( function(){
            element.removeClass('animated ' + animation);
        }, 2000);
      }
    );
  };

});



// $(document).ready(function() {
//   $('#top-nav').onePageNav({
//     currentClass: 'active',
//     changeHash: false,
//     scrollSpeed: 10000,
//     scrollThreshold: 0.5
//   });
// });
