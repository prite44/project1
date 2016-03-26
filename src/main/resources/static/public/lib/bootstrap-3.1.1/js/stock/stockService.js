'use strict';
App.factory('StockService', [
		'$http',
		'$q',
		function($http, $q) {

			return {
				//fetchAllData
				fetchAllProducts : function() {
					return $http.get('/stock/findAll').then(function(response) {
						return response.data;
					}, function(errResponse) {
						console.error('Error while fetching users');
						return $q.reject(errResponse);
					});
				},
				//updateData
				updateProduct : function(product) {
					return $http.post('/stock/update/' + product.id, product)
							.then(function(response) {
								
								return response.data;
							}, function(errResponse) {
								
								return $q.reject(errResponse);
							});
				},
				//deleteData
				remove : function(product) {
					return $http.post('/stock/delete' + product.id)
							.then(function(response) {
								
								return response.data;
							}, function(errResponse) {
								
								return $q.reject(errResponse);
							});
				},
				//createData
				create : function(product){
					return $http.post('/stock/create',product)
					.then(function(response) {
						return response.data;
					}, function(errResponse) {
						return $q.reject(errResponse);
					});					
				}
			};

		} ]);
