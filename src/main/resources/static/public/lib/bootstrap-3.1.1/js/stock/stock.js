'use strict';
App.service('ContactService', [ 'StockService','toaster', function(StockService,toaster) {
	var self = {
		'addProduct' : function(product) {
			this.products.push(product);
		},
		'page' : 1,
		'hasMore' : true,
		'isLoading' : false,
		'selectProduct' : null,
		'products' : [],
		'loadAllproducts' : function() {
			self.hasMore = false;
			self.isLoading = true;
			StockService.fetchAllProducts().then(function(data) {
				self.hasMore = true;
				self.isLoading = false;
				console.log("Susscess find all data");
				self.products = data;
			}, function(errResponse) {
				console.error('ระบบเกิดข้อผิดพลาด');
			});

		},
		'updateContact' : function(product) {
			StockService.updateProduct(product).then(function(data) {
				toaster.pop('success', 'แก้ไขสินค้า : '+product.name+'  เรียบร้อย');
				console.log("Update data");
				self.loadAllproducts();
			}, function(errResponse) {
				console.error('ระบบเกิดข้อผิดพลาด');
			});

		},
		'DeleteContact' : function(product){
			StockService.remove(product).then(function(data) {
				toaster.pop('success', 'ลบสินค้า : '+product.name+' เรียบร้อย');
				self.loadAllproducts();
			},function(errResponse){
				console.error('ระบบเกิดข้อผิดพลาด');	
			});
		},
		'CreateContact':function(product){
			StockService.create(product).then(function(data){
				self.loadAllproducts();
				toaster.pop('success', 'เพิ่มสินค้า : '+product.name+' เรียบร้อย');
			},function(errResponse){
				console.error('ระบบเกิดข้อผิดพลาด');
			})
		}
	};
	self.loadAllproducts();
	return self;

} ]);
App.controller('StockController', [ '$scope','$modal','ContactService',
		function($scope,$modal,ContactService) {
            $scope.product ={'name':'','quality':'','price1':'','price2':'','price3':''}
			$scope.products = ContactService.products;
			$scope.search = "";
			$scope.order = "quality";
			// service;
			$scope.contacts = ContactService;
				
			// search
			$scope.sensitiveSearch = function(product) {
				if ($scope.search) {
					return product.name.indexOf($scope.search) == 0;
				}
				return true;
			};
				
			
			$scope.loadMore = function() {
				console.log("Load more!!");
			};
			$scope.submit = function(){
				var chk =true;
		     angular.forEach($scope.contacts.products,function(value,index){
		                if(value.name==$scope.product.name){
		                	chk=false;
		                }
		             
		     })
		     if(chk){
				$scope.contacts.CreateContact($scope.product);
				$scope.product=null;
		     }
		     else{
		    	 alert("มีชื่อสินค้านี้ในระบบแล้ว");
		     }
			};
			//modal bootstrap
				
		} ]);
App.controller('StockDetail', function($scope, ContactService) {
	$scope.contacts = ContactService;
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
