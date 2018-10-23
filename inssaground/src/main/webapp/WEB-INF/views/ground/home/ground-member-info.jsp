<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="row boardArea">
		<div class="col-sm-10 offset-1">
			<table class="table simpleTable" style="table-layout:fixed;">
				<thead>
					<tr class="center">
						<th colspan="2">MEMBER INFO</th>						
					</tr>
					<tr class="center">
						<th style="width:100px;">아이디</th>
						<th>${memberVO.id}</th>
					</tr>
					<tr class="center">
						<th>일정 등록 수</th>
						<th>${schedule}</th>
					</tr>
					<tr class="center">
						<th>출석 수</th>
						<th>${attendance}</th>
					</tr>
					<tr class="center">
						<th>일정 참여 수</th>
						<th>${participation}</th>
					</tr>
					<tr class="center">
						<th>게시글 수</th>
						<th>${post}</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>