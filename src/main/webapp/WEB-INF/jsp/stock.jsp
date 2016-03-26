<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../jsp/fragments/header.jsp"%>
<style>
.spinner {
	position: relative;
	width: 50px;
	height: 50px;
	margin: 0 auto;
	padding: 40px 0;
}

.spinner p {
	margin-top: 20px;
}
.my-courses .my-courses-header {
  border-bottom: 1px solid rgba(0, 0, 0, 0.25);
  height: 80px;
}
.my-courses .my-courses-header .container,
.my-courses .my-courses-header .row,
.my-courses .my-courses-header *[class^="col-"] {
  height: 100%;
}
.my-courses .my-courses-header .my-courses-heading {
  top: 20px;
  white-space: nowrap;
}
.my-courses .my-courses-header .nav.nav-tabs {
  top: 22px;
  font-size: 18px;
}
.my-courses .my-courses-header .nav.nav-tabs > li {
  float: none;
  display: inline-block;
  vertical-align: top;
  padding: 0 15px;
}
.my-courses .my-courses-header .nav.nav-tabs > li > a {
  max-width: 95px;
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.my-courses .my-courses-header .input-group {
  top: 16px;
}
</style>

<script src="/public/lib/bootstrap-3.1.1/js/stock/MyStock.js"></script>
<script src="/public/lib/bootstrap-3.1.1/js/stock/stockService.js"></script>
<script src="/public/lib/bootstrap-3.1.1/js/stock/stock.js"></script>




<div class="container main-content" ng-app="myStock">


	<toaster-container></toaster-container>
	<div class="row">
		<div ng-controller="StockController">
			<div class="col-md-48">
			<form class="form-inline well well-sm">
			<span style="font-size:40px;">My stock</span>
			</form>
			</div>
			<div class="col-md-12">
				<form class="form-inline well well-sm">
					<span class="glyphicon glyphicon-search"></span> <b>ค้นหาตามชื่อ
						:</b>
					<div class="form-group">
						<input type="text" class="form-control" id="name"
							ng-model="search" placeholder="ค้นหาชื่อ ...." />
					</div>
					<span class="glyphicon glyphicon-sort-by-attributes"></span>

					<div class="form-group">
						<select class="form-control" ng-model="order">
							<option value="quality">จำนวน(น้อยไปมาก)</option>
							<option value="-quality">จำนวน(มากไปน้อย)</option>
						</select>
					</div>
					<button class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal">
						<span class="glyphicon glyphicon-plus"
							>เพิ่ม</span>
					</button>
				</form>

			</div>

			<div class="col-md-4">
				<table class="table table-bordered" infinite-scroll="loadMore()"
					infinite-scroll-distance="1">
					<tr class="panel-heading">
						<th>ลำดับ</th>
						<th >ชื่อ</th>
						<th>จำนวน</th>
					</tr>
					<tr
						ng-repeat="product in filteredProduct = (contacts.products | filter:sensitiveSearch|orderBy:order)"
						ng-style="{'background-color':product.name == contacts.selectProduct.name ?'lightgray':''}"
						ng-click="contacts.selectProduct=product">
						<td>{{$index+1}}</td>
						<td>{{product.name}}</td>
						<td>{{product.quality}}</td>
					</tr>
					<tr ng-show="filteredProduct.length == 0 && !contacts.isLoading">
						<td colspan="4">
							<div class="alert alert-info">
								<p>
								<center>ไม่พบข้อมูล {{search}}</center>
								</p>
							</div>
						</td>
					</tr>
					<div class="spinner" ng-show="contacts.isLoading">
						<span us-spinner="{radius:8, width:5, length: 3, lines:9}"></span>

						<p>ระบบกำลังทำงาน...</p>
					</div>
				</table>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					
					<div class="modal-content">
					<form ng-submit="submit()">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title">เพิ่มสินค้า</h3>
						</div>
						<div class="modal-body">
								
								<p><label>ชื่อ</label></p>
									<p><input type="text" class="form-control" name="name"
										ng-model="product.name" required /></p>
										<p><label>จำนวน</label></p>
									<p><input type="number" class="form-control" name="number"
										ng-model="product.quality" required /></p>
										<p><label>ราคาระดับ 1</label></p>
									<p><input type="number" class="form-control" name="number"
										ng-model="product.price1" required /></p>
										<p><label>ราคาระดับ 2</label></p>
									<p><input type="number" class="form-control" name="number"
										ng-model="product.price2" required /></p>
										<p><label>ราคาระดับ 3</label></p>
									<p><input type="number" class="form-control" name="number"
										ng-model="product.price3" required /></p>
							
								
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-save"></span> บันทึก</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">ยกเลิก</button>
						</div>
							</form>
					</div>
				

				</div>
			</div>
		</div>
		<div class="col-md-8" ng-controller="StockDetail">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>รายละเอียดข้อมูล</b>
					<button class="btn btn-primary btn-sm pull-right"
						ng-click="update(contacts.selectProduct)" ng-disabled="checkupdate(contacts.selectProduct.id)">
						<span class="glyphicon glyphicon-edit"></span> แก้ไข
					</button>
					&nbsp;&nbsp;
					<button class="btn btn-danger btn-sm pull-right"
						ng-click="remove(contacts.selectProduct)" ng-disabled="checkupdate(contacts.selectProduct.id)">
						<span class="glyphicon glyphicon-trash"></span> ลบ
					</button>



					<div class="clearfix"></div>

				</div>
				<div class="panel-body">
					<%@include file="../jsp/STOCK/stockdetail.jsp"%>
				</div>
			</div>
			<%@include file="../jsp/fragments/footer.jsp"%>