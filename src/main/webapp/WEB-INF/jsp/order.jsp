<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../jsp/fragments/header.jsp"%>
<style>
.modal-body {
	overflow-x: auto;
}

.action-checkbox {
	padding-left: 25%;
	margin-top: 50px;
	margin-bottom: 30px;
	line-height: 10px;
	display: inline;
}

.check-box-panel {
	width: 150px;
	float: left;
	display: inline;
	margin-top: 30px;
	margin-left: 30px;
	border-style: dotted;
	padding-top: 10px;
	padding-bottom: 10px;
}

table.table-fixedheader {
	width: 100%;
}
/*
Set table elements to block mode.  (Normally they are inline).
This allows a responsive table, such as one where columns can be stacked
if the display is narrow.
*/
table.table-fixedheader, table.table-fixedheader>thead, table.table-fixedheader>tbody,
	table.table-fixedheader>thead>tr, table.table-fixedheader>tbody>tr,
	table.table-fixedheader>thead>tr>th, table.table-fixedheader>tbody>td {
	display: block;
}

table.table-fixedheader>thead>tr:after, table.table-fixedheader>tbody>tr:after
	{
	content: ' ';
	display: block;
	visibility: hidden;
	clear: both;
}
/*
When scrolling the table, actually it is only the tbody portion of the
table that scrolls (not the entire table: we want the thead to remain
fixed).  We must specify an explicit height for the tbody.  We include
100px as a default, but it can be overridden elsewhere.

Also, we force the scrollbar to always be displayed so that the usable
width for the table contents doesn't change (such as becoming narrower
when a scrollbar is visible and wider when it is not).
*/
table.table-fixedheader>tbody {
	overflow: scroll;
	height: 100px;
}
/*
We really don't want to scroll the thead contents, but we want to force
a scrollbar to be displayed anyway so that the usable width of the thead
will exactly match the tbody.
*/
table.table-fixedheader>thead {
	overflow-y: scroll;
}
/*
For browsers that support it (webkit), we set the background color of
the unneeded scrollbar in the thead to make it invisible.  (Setting
visiblity: hidden defeats the purpose, as this alters the usable width
of the thead.)
*/
table.table-fixedheader>thead::-webkit-scrollbar {
	background-color: inherit;
}

table.table-fixedheader>thead>tr>th:after, table.table-fixedheader>tbody>tr>td:after
	{
	content: ' ';
	display: table-cell;
	visibility: hidden;
	clear: both;
}

/*
We want to set <th> and <td> elements to float left.
We also must explicitly set the width for each column (both for the <th>
and the <td>).  We set to 20% here a default placeholder, but it can be
overridden elsewhere.
*/
table.table-fixedheader>thead tr th, table.table-fixedheader>tbody tr td
	{
	float: left;
	word-wrap: break-word;
}
</style>

<script src="/public/lib/bootstrap-3.1.1/js/order/myOrder.js"></script>
<script src="/public/lib/bootstrap-3.1.1/js/order/Order.js"></script>
<script src="/public/lib/bootstrap-3.1.1/js/order/OrderService.js"></script>





<div class="container main-content" ng-app="myOrder">


	<toaster-container></toaster-container>
	<div class="row">
		<div ng-controller="orderhead">
			<div class="col-md-12">
				<form class="form-inline well well-sm">
					<b>จัด - ซื้อ</b>

				</form>

			</div>

			<div class="col-md-4">
				<table class="table table-bordered" infinite-scroll="loadMore()"
					infinite-scroll-distance="1">
					<div class="panel panel-default">
						<div class="panel-heading">
							<center>
								<b>รายละเอียดใบเสร็จ</b>
							</center>
							<button class="btn btn-info pull-right" data-toggle="modal"
								data-target="#CustomerModal">ค้นหาลูกค้า</button>




							<div class="clearfix"></div>

						</div>
						<div class="panel-body">
							<p>
								เลขที่ใบเสร็จ : <input class="form-control input-sm"
									id="inputsm" type="text"
									ng-model="reportorder.orderid | date:'ddyymmhhss'" readonly>
							</p>
							<p>
								วันที่ออกใบเสร็จ : <input class="form-control input-sm"
									id="inputsm" type="text"
									ng-model="reportorder.orderdate" bs-datepicker>
							</p>
							<p>
								ชื่อร้านลูกค้า : <input class="form-control input-sm"
									id="inputsm" type="text" ng-model="ordercustomer.shopname">
							</p>
							<p>
								ที่อยู่ :
								<textarea name="address" ng-model="ordercustomer.shopaddress"
									id="address" class="form-control" rows="3"></textarea>
							</p>
							<p>
								ระดับ : <select name="level" class="form-control"
									ng-model="ordercustomer.level" ng-change="chkprice(ordercustomer.level)">
									<option ng-selected="ordercustomer.level == option.id"
										ng-repeat="option in optionlevel" ng-value="option.id">{{option.name}}</option>
								</select>
							</p>
						</div>
				</table>
			</div>
			<!-- ModalCustomer -->
			<div class="modal fade" id="CustomerModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<center>
								<h3 class="modal-title">ข้อมูลลูกค้า</h3>
							</center>
							<div class="form-group">
								<input type="text" class="form-control" id="name"
									ng-model="search" placeholder="ค้นหาชื่อ ร้าน,ค้นหา จังหวัด" />
							</div>

						</div>
						<div class="modal-body">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>ชื่อลูกค้า</th>
										<th>จังหวัด</th>
										<th>ระดับ</th>
									</tr>
								</thead>
								<tbody>
									<tr
										ng-repeat="customer in filteredCustomer = (contacts.customers | filter:sensitiveSearch)"
										ng-click="selectCustomer(customer)">
										<td>{{customer.shopname}}</td>
										<td>{{customer.province}}</td>
										<td>{{customer.level}}</td>
									</tr>
								</tbody>
							</table>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">ยกเลิก</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!--  -->





			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<center>
							<b>รายการสินค้า</b>
						</center>
						<button class="btn btn-info pull-right" data-toggle="modal"
							ng-disabled="checklevel(ordercustomer.level)" data-target="#ProductModal" >เลือกสินค้า</button>
						<div class="clearfix"></div>

					</div>
					<div class="panel-body">
						<table class="table  table-bordered table-striped">
							<tr>

								<th width="30">รายการ</th>
								<th style="width: 138px;"><center>ชื่อ</center></th>
								<th><center>จำนวน</center></th>
								<th><center>ราคาต่อชิ้น</center></th>
								<th><center style="width: 100px;">รวม</center></th>
								<th></th>
							</tr>
							<tr ng:repeat="orders in orderproduct">
								<td>{{$index+1}}</td>
								<td>{{orders.name}}</td>
								<td><input type="number" ng-model="orders.quality"
									ng-required class="input-mini"></td>
								<td><input type="number" ng:model="orders.price"
									ng:required class="input-mini"></td>
								<td><center>{{orders.quality * orders.price}}</center></td>
								<td><a href ng:click="removeItem($index)"><span class="glyphicon glyphicon glyphicon-trash"></span></a></td></tr>
						</table>
						<tabl e class="table">
						<tr>

								<th width="30"></th>
								<th style="width: 138px;"><center></center></th>
								<th><center></center></th>
								<th><center></center></th>
								<th><center>ราคาทั้งหมด  {{total()}} บาท</center></th>
								<th></th>
							</tr>
						</table>
					</div>

				</div>
			</div>

			<!-- ModalCustomer -->
			<div class="modal fade" id="ProductModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<center>
								<h3 class="modal-title">รายการสินค้า</h3>
							</center>
							<div class="form-group">
								<input type="text" class="form-control" id="name"
									ng-model="search" placeholder="สินค้า" />
							</div>

						</div>
						<div class="modal-body">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>เลือก</th>
										<th>ชื่อสินค้า</th>
										<th>จำนวนที่เหลือ</th>
									</tr>
								</thead>
								<tbody>
									<tr
										ng-repeat="product in filteredProdust = (contacts.products | filter:sensitiveSearchProduct)">
										<td><input id="{{product.name}}" type="checkbox"
											value="{{product.name}}" ng-checked="checkbox(product)"
											ng-click="toggleSelection(product)" /></td>
										<td>{{product.name}}</td>
										<td>{{product.quality}}</td>
									</tr>
								</tbody>
							</table>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">ยกเลิก</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!--  -->
		</div>
	</div>

	<%@include file="../jsp/fragments/footer.jsp"%>