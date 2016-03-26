'use strict';
App.service('ContactService', [ 'CustomerService','toaster', function(CustomerService,toaster) {
	var self = {
		'addProduct' : function(product) {
			this.products.push(product);
		},
		'page' : 1,
		'hasMore' : true,
		'isLoading' : false,
		'selectProduct' : null,
		'customers' : [],
		'optionlevel':[{'id':1,'name':'ระดับ 1'},
		               {'id':2,'name':'ระดับ 2'},
		               {'id':3,'name':'ระดับ 3'}],
		'loadAllproducts' : function() {
			self.hasMore = false;
			self.isLoading = true;
			CustomerService.fetchAllProducts().then(function(data) {
				self.hasMore = true;
				self.isLoading = false;
				console.log("Susscess find all data");
				self.customers = data;
			}, function(errResponse) {
				console.error('ระบบเกิดข้อผิดพลาด');
			});

		},
		'updateContact' : function(product) {
			CustomerService.updateProduct(product).then(function(data) {
				toaster.pop('success', 'แก้ไขสินค้า : '+product.shopname+'  เรียบร้อย');
				console.log("Update data");
				self.loadAllproducts();
			}, function(errResponse) {
				console.error('ระบบเกิดข้อผิดพลาด');
			});

		},
		'DeleteContact' : function(product){
			CustomerService.remove(product).then(function(data) {
				toaster.pop('success', 'ลบสินค้า : '+product.shopname+' เรียบร้อย');
				self.loadAllproducts();
			},function(errResponse){
				console.error('ระบบเกิดข้อผิดพลาด');	
			});
		},
		'CreateContact':function(customer){
			CustomerService.create(customer).then(function(data){
				self.loadAllproducts();
				toaster.pop('success', 'เพิ่มสินค้า : '+customer.shopname+' เรียบร้อย');
			},function(errResponse){
				console.error('ระบบเกิดข้อผิดพลาด');
			})
		}
	};
	self.loadAllproducts();
	return self;

} ]);
App.controller('CustomerController', [ '$scope','$modal','ContactService',
		function($scope,$modal,ContactService) {
            $scope.customer ={};
			$scope.customers = ContactService.customers;
			$scope.search = "";
			$scope.order = "quality";
			$scope.optionlevel=ContactService.optionlevel;
			// service;
			$scope.contacts = ContactService;
				
			// search
			$scope.sensitiveSearch = function(customer) {
				if ($scope.search) {
					return customer.shopname.indexOf($scope.search) == 0 ||
					customer.province.indexOf($scope.search) == 0;
				}
				return true;
			};
				
			
			$scope.loadMore = function() {
				console.log("Load more!!");
			};
			$scope.submit = function(){
				var chk =true;
		     angular.forEach($scope.contacts.customers,function(value,index){
		                if(value.name==$scope.customer.shopname){
		                	chk=false;
		                }
		             
		     })
		     if(chk){
				$scope.contacts.CreateContact($scope.customer);
				$scope.customer=null;
				$('#myModal').modal('hide');
		     }
		     else{
		    	 alert("มีชื่อสินค้านี้ในระบบแล้ว");
		     }
			};
			//modal bootstrap
				
		} ]);
App.controller('CustomerDetail', function($scope, ContactService) {
	$scope.contacts = ContactService;
	$scope.optionlevel=$scope.contacts.optionlevel;
	$scope.update = function(product) {
		$scope.contacts.updateContact(product);
	};
	$scope.remove = function(product) {
		$scope.contacts.selectProduct=null;
		$scope.contacts.DeleteContact(product);
	};
	$scope.checkupdate = function(id){
		if(id==undefined){
		return true;
		}
		else{
			return false;
		}
	};
});
