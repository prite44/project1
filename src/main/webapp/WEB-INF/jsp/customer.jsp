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

.my-courses .my-courses-header .container, .my-courses .my-courses-header .row,
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

.my-courses .my-courses-header .nav.nav-tabs>li {
	float: none;
	display: inline-block;
	vertical-align: top;
	padding: 0 15px;
}

.my-courses .my-courses-header .nav.nav-tabs>li>a {
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

<script src="/public/lib/bootstrap-3.1.1/js/customer/MyCustomer.js"></script>
<script src="/public/lib/bootstrap-3.1.1/js/customer/CustomerService.js"></script>
<script src="/public/lib/bootstrap-3.1.1/js/customer/Customer.js"></script>




<div class="container main-content" ng-app="myCustomer">


	<toaster-container></toaster-container>
	<div class="row">
		<div ng-controller="CustomerController">
			<div class="col-md-48">
				<form class="form-inline well well-sm">
					<span style="font-size: 40px;">My Customer</span>
				</form>
			</div>
			<div class="col-md-12">
				<form class="form-inline well well-sm">
					<span class="glyphicon glyphicon-search"></span> <b>ค้นหา
						:</b>
					<div class="form-group">
						<input type="text" class="form-control" id="name"
							ng-model="search" placeholder="ค้นหาชื่อ ร้าน,ค้นหา จังหวัด" />
					</div>
					<button class="btn btn-primary pull-right" data-toggle="modal"
						data-target="#myModal">
						<span class="glyphicon glyphicon-plus">เพิ่ม</span>
					</button>
				</form>

			</div>

			<div class="col-md-4">
				<table class="table table-bordered" infinite-scroll="loadMore()"
					infinite-scroll-distance="1">
					<tr class="panel-heading">
						<th>ลำดับ</th>
						<th>ชื่อร้านลูกค้า</th>
						<th>จังหวัด</th>
						<th>ระดับ</th>
					</tr>
					<tr
						ng-repeat="customer in filteredCustomer = (contacts.customers | filter:sensitiveSearch)"
						ng-style="{'background-color':customer.shopname == contacts.selectProduct.shopname ?'lightgray':''}"
						ng-click="contacts.selectProduct=customer">
						<td>{{$index+1}}</td>
						<td>{{customer.shopname}}</td>
						<td>{{customer.province}}</td>
						<td>{{customer.level}}</td>
					</tr>
					<tr ng-show="filteredCustomer == 0 && !contacts.isLoading">
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
								<h3 class="modal-title">เพิ่มข้อมูลลูกค้า</h3>
							</div>
							<div class="modal-body">

								<p>
									<label>ชื่อร้านลูกค้า</label>
								</p>
								<p>
									<input type="text" class="form-control" name="name"
										ng-model="customer.shopname" required />
								</p>
								<p>
									<label>ชื่อ - นามสกุล</label>
								</p>
								<p>
									<input type="text" class="form-control" name="number"
										ng-model="customer.hostname" required />
								</p>
								<p>
									<label>จังหวัด</label>
								</p>
								<p>
									<input type="text" class="form-control" name="number"
										ng-model="customer.province" required />
								</p>
								<p>
									<label>ที่อยู่</label>
								</p>
								<p>
									<textarea name="address" ng-model="customer.address"
										id="address" class="form-control" rows="5"></textarea>
								</p>
								<p>
									<label>โทรศัพท์</label>
								</p>
								<p>
									<input type="text" class="form-control" name="number"
										ng-model="customer.tel" required />
								</p>
								<p>
									<label>ระดับ</label>
								</p>
								<p>
									<select name="level" class="form-control"
										ng-model="customer.level" ng-options="i.id as i.name for i in optionlevel">
									</select>
								</p>


							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-save"></span> บันทึก
								</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">ยกเลิก</button>
							</div>
						</form>
					</div>


				</div>
			</div>
		</div>
		<div class="col-md-8" ng-controller="CustomerDetail">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>รายละเอียดข้อมูล</b>
					<button class="btn btn-primary btn-sm pull-right"
						ng-click="update(contacts.selectProduct)"
						ng-disabled="checkupdate(contacts.selectProduct.id)">
						<span class="glyphicon glyphicon-edit"></span> แก้ไข
					</button>
					&nbsp;&nbsp;
					<button class="btn btn-danger btn-sm pull-right"
						ng-click="remove(contacts.selectProduct)"
						ng-disabled="checkupdate(contacts.selectProduct.id)">
						<span class="glyphicon glyphicon-trash"></span> ลบ
					</button>



					<div class="clearfix"></div>

				</div>
				<div class="panel-body">
					<%@include file="../jsp/CUSTOMER/customerdetail.jsp"%>
				</div>
			</div>
			<%@include file="../jsp/fragments/footer.jsp"%>