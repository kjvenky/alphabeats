
var faqapp = angular.module('faqApp', []);

faqapp.directive('faqtest',function(){
  return{
    link: function(scope, el, attr) {
      
      // angular.element(el[0].querySelector('.rightside > .fa')).addClass('fa-angle-up');
       
      el.on('hide.bs.collapse', function(ev){
        angular.element(el[0].querySelector('.glyphicon'))
          .removeClass('glyphicon-chevron-down')
          .addClass('glyphicon-chevron-right');
      });
      
      el.on('show.bs.collapse', function(ev){
        angular.element(el[0].querySelector('.glyphicon'))
          .removeClass('glyphicon-chevron-right')
          .addClass('glyphicon-chevron-down'); 
      });
    }
  }
});

