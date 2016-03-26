'use strict';
var App = angular.module('myOrder',['infinite-scroll'
                                    ,'angularSpinner','mgcrea.ngStrap','toaster',
                                	'ngAnimate']);
App.config(function ($datepickerProvider) {
	angular.extend($datepickerProvider.defaults, {
		dateFormat: 'd/M/yyyy',
		autoclose: true
	});
});
App.filter('findobj', function() {
	  return function(input, name,level) {
	    /*var i=0, len=input.length;
	    for (; i<len; i++) {
	      if (+input[i].name == +name) {
	        return input[i];
	      }
	    }*/
		  alert(input);
		  alert(name);
	    return null;
	  }
});

$scope.usingservice = $filter('findobj')($scope.items, [1, 3])