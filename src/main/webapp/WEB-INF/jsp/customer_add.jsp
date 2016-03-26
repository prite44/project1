
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body {
	margin: 40px;
}

#accordion .glyphicon {
	margin-right: 10px;
}

.panel-collapse>.list-group .list-group-item:first-child {
	border-top-right-radius: 0;
	border-top-left-radius: 0;
}

.panel-collapse>.list-group .list-group-item {
	border-width: 1px 0;
}

.panel-collapse>.list-group {
	margin-bottom: 0;
}

.panel-collapse .list-group-item {
	border-radius: 0;
}

.panel-collapse .list-group .list-group {
	margin: 0;
	margin-top: 10px;
}

.panel-collapse .list-group-item li.list-group-item {
	margin: 0 -15px;
	border-top: 1px solid #ddd;
	border-bottom: 0;
	padding-left: 30px;
}

.panel-collapse .list-group-item li.list-group-item:last-child {
	padding-bottom: 0;
}

.panel-collapse div.list-group div.list-group {
	margin: 0;
}

.panel-collapse div.list-group .list-group a.list-group-item {
	border-top: 1px solid #ddd;
	border-bottom: 0;
	padding-left: 30px;
}
</style>
<%@include file="../jsp/fragments/header.jsp"%>
<script src="/public/lib/bootstrap-3.1.1/js/customer/Myproject.js"></script>
<script
	src="/public/lib/bootstrap-3.1.1/js/customer/customer_service.js"></script>
<script
	src="/public/lib/bootstrap-3.1.1/js/customer/customer_controller.js"></script>
<div class="container" ng-app="myProject"
	ng-controller="Customercontroller">
	<div class="row">
		<div class="col-sm-3 col-md-3">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne"><span class="glyphicon glyphicon-plus"></span>
								เมนู</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<ul class="list-group">
							<li class="list-group-item"><span
								class="glyphicon glyphicon-pencil text-primary"></span> Blogs
								<ul class="list-group">
									<li class="list-group-item"><span
										class="glyphicon glyphicon-minus text-primary"></span> <a
										href="/customer/index">ข้อมูลลูกค้า </a></li>
									<li class="list-group-item"><span
										class="glyphicon glyphicon-minus text-success"></span> <a
										href="/customer/add">เพิ่มข้อมูลค้า(ใหม่) </a></li>
									<li class="list-group-item"><span
										class="glyphicon glyphicon-share-alt text-info"></span> <a
										href="/module">ย้อนกลับ</a></li>
								</ul></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-9 col-md-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2 class="panel-title">
						<center>เพิ่มข้อมูลลูกค้า</center>
					</h2>
				</div>
				<div class="panel-body">
					<table class="table">
						<thead>
							<div class="form-group">
								<label for="InputName">ชื่อร้านลูกค้า</label>
								<div class="input-group">
									<input type="text" class="form-control"
										ng-model="customer.shopname" name="shopname" id="shopname"
										placeholder="ชื่อร้านค้า" required> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="InputEmail">ชื่อ - นามสกุล</label>
								<div class="input-group">
									<input type="text" class="form-control"
										ng-model="customer.hostname" id="hostname" name="hostname"
										placeholder="ชื่อ - นามสกุล" required> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="InputEmail">เบอร์โทรศัพท์ติดต่อ</label>
								<div class="input-group">
									<input type="text" size="50" class="form-control"
										ng-model="customer.tel" id="tel" name="tel"
										placeholder="เบอร์โทรศัพท์ติดต่อ"> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-asterisk"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="InputMessage">จังหวัด</label>
								<div class="input-group">
									<input type="text" size="50" class="form-control"
										ng-model="customer.province" id="province" name="province"
										placeholder="จังหวัด"> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-asterisk"></span></span>
								</div>
								<div class="form-group">
									<label for="InputMessage">ที่อยู่</label>
									<div class="input-group">
										<textarea name="address" ng-model="customer.address"
											id="address" class="form-control" rows="5"></textarea>
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span>
									</div>
									<div class="form-group">
										<label for="InputMessage">ระดับ</label>
										<div class="input-group">
											<select ng-options="c.level for c in level"
												ng-model="selectedlevel">
											</select>
										</div>

									</div>
									<div class="form-group">
										<label for="InputMessage"> </label>
										<div class="input-group">
											<button type="button" class="btn btn-info"
												ng-click="submit()">บันทึก</button>
											&nbsp;
											<button type="button" class="btn btn-warning">รีเซ็ต</button>
										</div>
									</div>


								</div>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../jsp/fragments/footer.jsp"%>
