'use strict';
var App = angular.module('myCustomer',['infinite-scroll'
                                    ,'angularSpinner','mgcrea.ngStrap','toaster',
                                	'ngAnimate']);
App.filter('getById', function() {
	  return function(input, id) {
	    var i=0, len=input.length;
	    for (; i<len; i++) {
	      if (+input[i].id == +id) {
	        return input[i];
	      }
	    }
	    return null;
	  }
});