<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>희망직무 선택 POP</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<style>
:root 
{
	/* 컬러 모음 */
	--main-color:#FFA500;
	--color-black: #111;
	--color-white: #fff;
	--color-gray: #787878;
	--input-gray: #e5e5ec;
	--button-gray: #f7f7f7;
	--border-color-gray: #dadada;
	--font-size32: 32px;
	--font-size24: 24px;
	--font-size16: 16px;
	--font-size14: 14px;
	--font-size12: 12px;
}



.popupJoin
{
    display: block;
    position: fixed;
    top:0;
    left: 0;
    width: 100vw;
    height: 100vh;
    overflow: hidden;
    background: rgba(0,0,0,0.5);
}

.popupJoin.B 
{
    display: none;
}

.popupJoin .popupJoinCon
{
    position: absolute;
    width: 500px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 24px;
    background: #fff;
    border-radius: 15px;
    padding-bottom: 28px;
}

.popupJoinCon h2
{
    font-size: var(--font-size24);
    text-align: center;
    margin: 3px;
    margin-bottom: 10px;
}
.popupJoin .tabCon button
{
    min-width: 120px;
	padding: 10px 20px;
    background-color: var(--color-white);
    border: solid 1px var(--input-gray);
    border-radius: 6px;   
    cursor: pointer;
    font-size: var(--font-size12);

}
.popupJoin .tabCon
{
    display: flex;
    justify-content: center;
    border-bottom: solid 1px var(--border-color-gray);
    margin: 20px 0;
    gap: 20px;
	padding-bottom: 20px;
}

.popupJoinCon
{
    display: block;
    max-width: 1200px;
}

.popupJoin .tabConTech 
{
    display: block;
    max-width: 1200px;
}

.popupJoin .tabConTech .po, .popupJoin .tabConTech .tech
{
    margin: 10px 10px 5px 0;
    border: 1px solid var(--input-gray);
    border-radius: 6px;
    padding: 12px 20px;
    width: initial;
    cursor: pointer;
    font-size: var(--font-size14);
}

.popupJoin .tabConTech .po.on, .popupJoin .tabConTech .tech.on 
{
    background-color: var(--color-black);
    color: var(--color-white);
}

.popupJoin .tabOk
{
    display: flex;
    justify-content: center;
    margin-top: 40px;
	gap: 0 10px;
}

.popupJoin .tabOk button, .popupJoin .tabOk input
{
    min-width: 120px;
	padding: 10px 20px;
    background-color: var(--color-white);
    border: solid 1px #e5e5ec;
    border-radius: 6px;
    color: var(--color-black);
    font-size: var(--font-size14);
    cursor: pointer;
}

.popupJoin .tabOk button:hover, 
.popupJoin .tabOk input:hover 
{
	background-color: var(--color-black);
	color: var(--color-white);
	border: solid 1px var(--color-black);	
}

.popupJoinCon .tabConTech.two, .tabConTech.three, .tabConTech.five, .tabConTech.six 
{
    display: none;
}

.popupJoin .tabCon button.active
{
    background-color: var(--color-black);
    color: var(--color-white);
}

.tabConTech button.tech.active
{
    background-color: var(--main-color);
    color: var(--color-white);
    border: 0;
}

.popupJoinConX
{
    display: flex;
    justify-content: center;
}

.popupJoinConX h2
{
    margin-left: auto;
}

.popupJoinConX i 
{
    margin-left: auto;
    font-size: 24px;
    cursor: pointer;
}

</style>
</head>
<body>            
    <div class="popupJoin A">
        <div class="popupJoinCon">  
            <div class="popupJoinConX">
                <h2>희망 직무</h2>
                <i class="fa-solid fa-xmark closebtn" onclick="window.close()"></i>
            </div>    
            <div class="tabCon">
                <button id="tabOne" class="tabCon active">개발</button>
                <button class="tabCon" id="tabTwo">디자인</button>
                <button class="tabCon" id="tabThree">기획</button>
            </div> <!--희망직무 탭 선택 -->
            <input type="hidden" id="cInput">
            <div class="tabConTech one">   
                <c:forEach var="dto" items="${job_name}">
                    <input type="button" class="po" name="user_position" value="${dto.job_name}">
                </c:forEach>             
            </div> <!-- tabConTech one 끝-->
            <div class="tabConTech two">
                <c:forEach var="dto" items="${job_name2}">
                    <input type="button" class="po" name="user_position" value="${dto.job_name}">
                </c:forEach> 
            </div> <!--tabConTech two 끝-->
            <div class="tabConTech three">
                <c:forEach var="dto" items="${job_name3}">
                    <input type="button" class="po" name="user_position" value="${dto.job_name}">
                </c:forEach> 
            </div> <!--tabConTech three 끝-->
            <div class="tabOk">
                <button class="poOk closebtn" type="button">저장</button>
                <!-- <input type="button" value="전달" onclick="setParentText()"> -->
                <button class="poOk closebtn" onclick="window.close()">확인</button>
            </div>
        </div> <!--회원가입_개인2 popupJoinCon 끝-->
    </div> <!--회원가입_개인2 popupJoin A 끝-->

</body>
</html>
<script>
/*
    2024-07-05 이재원 
    회원가입 2단계 팝업 설정
    수정(전달버튼 없애고 저장 버튼 누르면 바로 선택된 버튼값이 배열로 저장되어 부모창으로 전달되고 창 닫히도록): 2024-07-10 서연주
*/  
function setParentText() {
    // 부모 창의 input에 값을 설정
    opener.document.getElementById("jobInput").value = document.getElementById("cInput").value;
}

$(document).ready(function() {
    // var selectedValues = []; // 선택된 값을 저장할 배열
    var jobInfo = []; // 선택된 값을 저장할 배열
    var cInput = $('#cInput'); // 숨겨진 입력 필드
    var buttons = $('.tabConTech .po'); // 선택 가능한 버튼들

    // 버튼 클릭 시 'on' 클래스 토글 및 값 배열에 추가/제거
    buttons.on('click', function() {
        $(this).toggleClass('on');
        var value = $(this).val();
        if ($(this).hasClass('on')) {
            jobInfo.push(value); // 값 추가
        } else {
            jobInfo = jobInfo.filter(function(item) {
                return item !== value; // 값 제거
            });
        }
        console.log(jobInfo); // 선택된 값 출력
    });

    // 탭 클릭 시 모든 선택된 버튼 초기화
    $('.tabCon').click(function() {
        buttons.filter('.on').each(function() {
            $(this).removeClass('on');
            var value = $(this).val();
            jobInfo = jobInfo.filter(function(item) {
                return item !== value;
            });
        });
        console.log(jobInfo); // 초기화된 값 출력
    });

    // 저장 버튼 클릭 시 선택된 값을 부모 창에 전송
    $('button.poOk').on('click', function() {
        cInput.val(jobInfo.join(', ')); // 숨겨진 입력 필드에 값 설정
        setParentText(); // 부모 창에 값 설정
        window.close(); // 팝업 닫기
    });

    // 탭 전환 처리(하지수)
    $('#tabOne').click(function() {
        $('#tabOne').addClass('active');
        $('#tabTwo').removeClass('active');
        $('#tabThree').removeClass('active');
        $(".tabConTech.one").show();
        $(".tabConTech.two").hide();
        $(".tabConTech.three").hide();
    });

    $('#tabTwo').click(function() {
        $('#tabTwo').addClass('active');
        $('#tabOne').removeClass('active');
        $('#tabThree').removeClass('active');
        $(".tabConTech.one").hide();
        $(".tabConTech.two").show();
        $(".tabConTech.three").hide();
    });

    $('#tabThree').click(function() {
        $('#tabThree').addClass('active');
        $('#tabOne').removeClass('active');
        $('#tabTwo').removeClass('active');
        $(".tabConTech.one").hide();
        $(".tabConTech.two").hide();
        $(".tabConTech.three").show();
    });
});

</script>