<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>Chating</title>
    <style>

        *{
            margin:0;
            padding:0;
        }
        .chating{
            border: 1px solid #d6b6b6;
            position: relative;
            left: 38%;
            width: 24%;
            min-width: 25rem;
            height: 500px;
            overflow: auto;
        }
        .chating .mydiv{
            float: right;
            margin-left: 18rem;
        }
        .chating .me{
            background-color: #e2cccc;
            border: 1px solid #d6b6b6;
            border-radius: 10px;
            color: #0a0a0a;
            text-align: right;
            margin: 0.5rem;
            padding: 0.3rem;
            position: relative;
            width: auto;
        }

        .chating .othersdiv{
            float: left;
            margin-right: 18rem;
        }

        .chating .others{
            border: 1px solid #d6b6b6;
            border-radius: 10px;
            color: #0a0a0a;
            text-align: left;
            margin: 0.5rem;
            padding: 0.3rem;
            position: relative;
            width: auto;
        }

        #inputBox{
            position: relative;
            width: 24%;
            left: 38%;
            padding-bottom: 6rem;
        }

        #sendBtn{
            background-color: brown;
            position: relative;
            width: 5rem;
            height: 2rem;
            color: white;
            border-radius: 3%;
            border: none;
            margin-left: 1.75rem;
        }

        #sendBtn:hover{
            background-color: #868e96;
        }

        input{
            width: 330px;
            height: 25px;
        }

        #chatHead{
            position: relative;
            left: 38%;
            width: 24%;
            min-width: 25rem;
            overflow: auto;
            text-align: center;
            padding-bottom: 0.5rem;
        }

        #chatHead #imgBox{
            float: left;
            position: relative;
            left: 0;
            width: 39%;
            margin-top: 10%;
            border: solid 1px #c2b1b1;
        }

        img{
           max-width: 90%;
        }

        #chatHead #contentBox{
            float: right;
            position: relative;
            right: 0;
            width: 60%;
            margin-top: 15%;
        }

    </style>
</head>

<script type="text/javascript">
    var ws;

    $(document).ready(function (){
        wsOpen();
    });
    function wsOpen(){
        //웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
        ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
        wsEvt();
    }

    function wsEvt() {
        ws.onopen = function(data){
            //소켓이 열리면 동작
        }

        ws.onmessage = function(data) {
            //메시지를 받으면 동작
            var msg = data.data;
            if(msg != null && msg.trim() != ''){
                var d = JSON.parse(msg);
                if(d.type == "getId"){
                    var si = d.sessionId != null ? d.sessionId : "";
                    if(si != ''){
                        $("#sessionId").val(si);
                    }
                }else if(d.type == "message"){
                    if(d.sessionId == $("#sessionId").val()){
                        $("#chating").append("<div class='mydiv'><p class='me'>나 :" + d.msg + "</p></div>");
                    }else{
                        $("#chating").append("<div class='othersdiv'><p class='others'>" + d.userName + " :" + d.msg + "</p></div>");
                    }

                }else{
                    console.warn("unknown type!")
                }
            }
        }

        document.addEventListener("keypress", function(e){
            if(e.keyCode == 13){ //enter press
                send();
            }
        });
    }

    function send() {
        var option ={
            type: "message",
            roomNumber: $("#roomNumber").val(),
            sessionId : $("#sessionId").val(),
            userName : $("#userName").val(),
            msg : $("#chat").val()
        }
        ws.send(JSON.stringify(option))
        $('#chat').val("");
    }
</script>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </header>

    <div id="chatHead">
        <div id="imgBox">
            <c:forEach var="imgUrl" items="${product.imageUrls}" begin="0" end="1">
                <td><img src="${imgUrl}" alt=""></td>
            </c:forEach>
        </div>
        <table id="contentBox">
            <tr>
                <th>상품명</th>
                <td>${product.name}</td>
            </tr>
        </table>

    </div>

    <input type="hidden" id="sessionId" value="${sessionScope.__AUTH_ANTIQUE__.userId}">
    <input type="hidden" id="roomNumber" value="${product.pid}">
    <input type="hidden" id="userName" value="${userId}">

    <div id="chating" class="chating">
        <c:forEach items="${chatList}" var="chat">
            <c:choose>
                <c:when test="${chat.userId eq sessionScope.__AUTH_ANTIQUE__.userId}">
                    <div class="mydiv"><p class="me"> 나 : ${chat.msg}</p></div>
                </c:when>
                <c:otherwise>
                    <div class="othersdiv"><p class="others"> ${chat.userId} : ${chat.msg}</p></div>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
    <br>
    <div id="inputBox">
        <div id="yourMsg">
            <table class="inputTable">
                <tr>
                    <th><input id="chat" placeholder="보내실 메시지를 입력하세요."></th>
                    <th><button onclick="send()" id="sendBtn">보내기</button></th>
                </tr>
            </table>
        </div>
    </div>
    <footer id="footerBox">
        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    </footer>
</body>
</html>