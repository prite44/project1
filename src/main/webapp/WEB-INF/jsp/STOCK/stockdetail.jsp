<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="form-group">
						<label class="col-sm-2 control-label">ชื่อ</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="name"
								ng-model="contacts.selectProduct.name" required />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">จำนวน</label>
						<div class="col-sm-10">
							<input type="number" name="email" class="form-control"
								ng-model="contacts.selectProduct.quality" required />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">ราคาระดับ 1</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" name="photo"
								ng-model="contacts.selectProduct.price1" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">ราคาระดับ 2</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" name="photo"
								ng-model="contacts.selectProduct.price2" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">ราคาระดับ 3</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" name="photo"
								ng-model="contacts.selectProduct.price3" />
					</div>
					<div class="form-group">
					<p>
						<label class="col-sm-6 control-label pull-left">แก้ไขล่าสุด  : {{contacts.selectProduct.edit_date | date:'dd/MM/yyyy'}}</label>
						</p>
					</div>
					
					
					
					</div>