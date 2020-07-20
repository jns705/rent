<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<style>
#car-type6, #car-type1, #car-type2, #car-type3, #car-type4, #car-type5 {
	display: none;
}
</style>		
            <article>
                <div class="header-group">
                    <h3>차량 선택 <p>예약완료된 차량은 선택이 불가합니다.</p></h3>
                </div>
                <div class="article-content">
                    <div class="rent-car-select" id="alert-cartype">
                        <div class="tab-menu v2">
                            <ul>
                                <li class="c0 col-7 selected" ><a onclick="selectMenu(0);">전체</a></li>
                                <c:forEach items="${carKind}" var="carKind" varStatus="status">
                                <li class="c${status.index+1} col-7"><a onclick="selectMenu(${status.index+1});">${carKind}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!-- tab-content//end -->
                        <div id="car-type0" class="tab-content bg-line1" >
                            <!-- 선택할 수 없는 차량일 경우 a에 cl-thin class 추가 / 현재 선택 중인 차량에는 cl-point1 wg-bold class 추가 부탁 드립니다. -->
                            <ul class="carList openPop">
                            	<c:forEach items="${list.a0}" var="list">
								<li>
									<a href="javascript:void(0);" class="<c:if test="${list.situation != '예약가능'}">cl-thin class</c:if>"
										data-orgn="BE0123" 
										data-cartype="0000000" 
										data-car="6"
										data-carcd="232009">										
										${list.car_name}
									</a>
								</li>
								</c:forEach>
                            </ul>
                        </div>
                        <!-- tab-content//end -->
                        <div id="car-type1" class="tab-content bg-line1">
                            <ul class="carList">
                           	<c:forEach items="${list.a1}" var="list">
								<li>
									<a href="javascript:void(0);" class="<c:if test="${list.situation != '예약가능'}">cl-thin class</c:if>"
										data-orgn="BE0123" 
										data-cartype="0000000" 
										data-car="6"
										data-carcd="232009">										
										${list.car_name}
									</a>
								</li>
							</c:forEach>
                            </ul>
                        </div>
                        <!-- tab-content//end -->
                        <div id="car-type2" class="tab-content bg-line1">
                        	<ul class="carList">
                           	<c:forEach items="${list.a2}" var="list">
								<li>
									<a href="javascript:void(0);" class="<c:if test="${list.situation != '예약가능'}">cl-thin class</c:if>"
										data-orgn="BE0123" 
										data-cartype="0000000" 
										data-car="6"
										data-carcd="232009">										
										${list.car_name}
									</a>
								</li>
							</c:forEach>
                            </ul>
                        </div>
                        <!-- tab-content//end -->
                        <div id="car-type3" class="tab-content bg-line1">
                        	<ul class="carList">
                           	<c:forEach items="${list.a3}" var="list">
								<li>
									<a href="javascript:void(0);" class="<c:if test="${list.situation != '예약가능'}">cl-thin class</c:if>"
										data-orgn="BE0123" 
										data-cartype="0000000" 
										data-car="6"
										data-carcd="232009">										
										${list.car_name}
									</a>
								</li>
							</c:forEach>
                            </ul>
                        </div>
                        <!-- tab-content//end -->
                        <div id="car-type4" class="tab-content bg-line1">
                        	<ul class="carList">
                           	<c:forEach items="${list.a4}" var="list">
								<li>
									<a href="javascript:void(0);" class="<c:if test="${list.situation != '예약가능'}">cl-thin class</c:if>"
										data-orgn="BE0123" 
										data-cartype="0000000" 
										data-car="6"
										data-carcd="232009">										
										${list.car_name}
									</a>
								</li>
							</c:forEach>
                            </ul>
                        </div>
                        <!-- tab-content//end -->
                        <div id="car-type5" class="tab-content bg-line1">
                        	<ul class="carList">
                           	<c:forEach items="${list.a5}" var="list">
								<li>
									<a href="javascript:void(0);" class="<c:if test="${list.situation != '예약가능'}">cl-thin class</c:if>"
										data-orgn="BE0123" 
										data-cartype="0000000" 
										data-car="6"
										data-carcd="232009">										
										${list.car_name}
									</a>
								</li>
							</c:forEach>
                            </ul>
                        </div>
                        <!-- tab-content//end -->
                        <div id="car-type6" class="tab-content bg-line1">
                        	<ul class="carList">
                           	<c:forEach items="${list.a6}" var="list">
								<li>
									<a href="javascript:void(0);" class="<c:if test="${list.situation != '예약가능'}">cl-thin class</c:if>"
										data-orgn="BE0123" 
										data-cartype="0000000" 
										data-car="6"
										data-carcd="232009">										
										${list.car_name}
									</a>
								</li>
							</c:forEach>
                            </ul>
                        </div>
                        <!-- tab-content//end -->
                    </div>
					
					
					<div class="event_all">
						
						<div class="event_pop">
						    <div class="event_pop_box">
						    </div>
						</div>                    
                    </div>   
                </div>
                
            </article>
            
 <script type="text/javascript">

    function selectMenu(data){
		for(i=0; i < 7; i++){
			$('#car-type'+i).css("display","none");
			$('.c'+i).removeClass("selected");
		}
		$('#car-type'+data).css("display","block");
		$('.c'+data).addClass("selected");
    }
</script>
</layoutTag:layout>