'use strict';
App.factory('CustomerService', [
		'$http',
		'$q',
		function($http, $q) {

			return {
				//fetchAllData
				fetchAllProducts : function() {
					return $http.get('/customer/findAll').then(function(response) {
						return response.data;
					}, function(errResponse) {
						console.error('Error while fetching users');
						return $q.reject(errResponse);
					});
				},
				//updateData
				updateProduct : function(product) {
					return $http.post('/customer/update/' + product.id, product)
							.then(function(response) {
								
								return response.data;
							}, function(errResponse) {
								
								return $q.reject(errResponse);
							});
				},
				//deleteData
				remove : function(product) {
					return $http.post('/customer/delete' + product.id)
							.then(function(response) {
								
								return response.data;
							}, function(errResponse) {
								
								return $q.reject(errResponse);
							});
				},
				//createData
				create : function(customer){
					return $http.post('/customer/create',customer)
					.then(function(response) {
						return response.data;
					}, function(errResponse) {
						return $q.reject(errResponse);
					});					
				}
			};

		} ]);
