<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>렌트의 기준 - 솔렌트카</title>
</head>

	<style>
		.carousel-control.left, .carousel-control.right{
			background-image: 		none;
			color: 					#417505;
			
		}	
		
		.carousel-indicators li{
			border-color:  			#417505;
		}
		
		.carousel-indicators li.active{
			background-color: 		#417505;
		}
		
		.item h4{
			font-size: 				19px;
			line-height: 			1.375em;
			font-weight: 			400;
			font-style: 			italic;
			margin: 				70px 0;
		}
		
		.item span{
			font-style: 			normal;
			
		}
		
		
		
		.icon{
			font-size:				20px;
			margin-bottom: 			20px;
			color: 					#417505;
		}
		
		.logo {
			font-size: 				200px;
			color: 					#417505;
		}
		
		.logo-small{
			color: 					#417505;
			font-size: 				50px;
		}
		
		.panel{
			border: 				2px solid #417505;
			border-radius: 			0;
			transition:				box-shadow 0.5s;
		}
		
		.panel:hover{
			box-shadow: 			5px 0px 40px rgba(0, 0, 0, .4); /* .2 투명도 */
		}
		
		
		.panel-heading{
			background-color: 		#417505 !important;
			padding: 				25px;
			border-bottom:			1px solid transparent;
			border-top-right-radius: 	0px;
			border-top-left-radius: 	0px;
			border-bottom-left-radius: 	0px;
			border-bottom-right-radius:	0px;
		}
		
		
	</style>
<body>
	<img src="http://localhost:8082/static/img/map.jpg" style="width:100%"><br><br><br><br>
	<div id="myCarousel" class="carousel slide text-center" data-reide="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	
	
	<!-- Wrapper for slides -->
	<div class="carousel-inner">
		<div class="item active">
			<h1>"장기렌트"</h1>
			<h4><span style="font-style:normal;">
			비즈니스를 위한 당신의 발이 되어주는
			현대인의 경제생활 필수품인 자동차!<br>
			당신은 어떻게 이용하고 있으신가요?!<br></span>
			</h4>
		</div>
		<div class="item">
			<h4>"This company is the best. I am so happy with the result!"<br>
			<span style="font-style:normal;">Hinggildong, Chunhyang, Hangdan</span>
			</h4>
		</div>
		<div class="item">
			<h4>"This company is the best. I am so happy with the result!"<br>
			<span style="font-style:normal;">Hinggildong, Chunhyang, Hangdan</span>
			</h4>
		</div>
	</div>
	
	<!-- Left and Right Controls -->
	<a class="left carousel-control" href = "#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href = "#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>	
</div>

	<!-- 이모티콘 -->
	<br><br><br><br>
	<div  id="icon"  class="container-fluid text-center">
		<div class="row">
			<div class="col-sm-offset-3 col-sm-2">
				<span class="glyphicon glyphicon-user logo-small"></span>
				<h4>보유 고객 수 : 30</h4>
			</div>
			<div class="col-sm-2">
				<span class="glyphicon glyphicon-usd logo-small"></span>
				<h4>10억 보유자산</h4>
			</div>
			<div class="col-sm-2">
				<span class="glyphicon glyphicon-tree-deciduous logo-small"></span>
				<h4>친환경차 다수 보유</h4>
			</div>
		</div>	
	</div><br><br><br><hr>
	
	
	<div id="pricing" class="container-fluid" >
	<div class="text-center">
		<h2>PRICING</h2>
		<h4>Choose a payment plan that works for you</h4>
	</div><br><br>
	<div class="row">
		<div class="col-sm-2 col-sm-offset-2">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h4>합리적인 가격</h4>
				</div>
				<div class="panel-body">
					<p><strong>20</strong>Lorem</p>
					<p><strong>15</strong>Ipsum</p>
					<p><strong>5</strong>Dolor</p>
					<p><strong>2</strong>Sit</p>
					<p><strong>Endless</strong>Amet</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2">
		<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h4>실시간 견적</h4>
				</div>
				<div class="panel-body">
					<p><strong>20</strong>Lorem</p>
					<p><strong>15</strong>Ipsum</p>
					<p><strong>5</strong>Dolor</p>
					<p><strong>2</strong>Sit</p>
					<p><strong>Endless</strong>Amet</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2">
		<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h4>차량예약(월렌트)</h4>
				</div>
				<div class="panel-body">
					<p><strong>20</strong>Lorem</p>
					<p><strong>15</strong>Ipsum</p>
					<p><strong>5</strong>Dolor</p>
					<p><strong>2</strong>Sit</p>
					<p><strong>Endless</strong>Amet</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2">
		<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h4>친환경차 장기렌트</h4>
				</div>
				<div class="panel-body">
					<p><strong>20</strong>Lorem</p>
					<p><strong>15</strong>Ipsum</p>
					<p><strong>5</strong>Dolor</p>
					<p><strong>2</strong>Sit</p>
					<p><strong>Endless</strong>Amet</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-2 col-sm-offset-2">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h4>소통공간</h4>
				</div>
				<div class="panel-body">
					<p>솔렌트카는 다양한 상품에</p>
					<p>대한 합리적인 기준을 제시하고</p>
					<p>가격 공개를 원칙으로 합니다.</p>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
		<div class="panel panel-default text-center">
				<div class="panel-body">
					<button class="btn btn-lg">실시간 견적</button><br><br>
					<p align="left"><strong>신차</strong></p>
					<p align="left">장기렌트보기</p>
					<p align="left">자동차리스보기</p>
					<hr>
					<p align="left"><strong>솔렌트카 보유차량</strong></p>
					<p align="left">월렌트보기</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2">
		<div class="panel panel-default text-center" >
				<div class="panel-heading">
					<h4>손비처리 기준</h4>
				</div>
				<div class="panel-body">
					<p><strong>20</strong>Lorem</p>
					<p><strong>15</strong>Ipsum</p>
					<p><strong>5</strong>Dolor</p>
					<p><strong>2</strong>Sit</p>
					<p><strong>Endless</strong>Amet</p>
				</div>
			</div>
		</div>
		<div class="col-sm-2">
		<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h4>장기렌트 효용지수</h4>
				</div>
				<div class="panel-body">
					<p><strong>20</strong>Lorem</p>
					<p><strong>15</strong>Ipsum</p>
					<p><strong>5</strong>Dolor</p>
					<p><strong>2</strong>Sit</p>
					<p><strong>Endless</strong>Amet</p>
				</div>
			</div>
		</div>
	</div>
	
</div>
	
	
</body>
</html>
</layoutTag:layout>