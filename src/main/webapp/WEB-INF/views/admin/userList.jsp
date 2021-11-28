<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>userList.jsp</title>

    <link rel="stylesheet" href="/resources/css/userList.css">
</head>
<body>
    <header id="adminHeader">
        <jsp:include page="../common/adminHeader.jsp"></jsp:include>
    </header>

    <div id="userList_wrapper">
        <h2>회원 목록</h2>
        <div id="nickSearchBox">
            <input id="nickSearch" type="text" placeholder="닉네임을 입력하세요">
            <input id="nickSearchBtn" type="button" value="검색">
        </div>
        <div id="totalUsers">
            <p>전체회원 : ${pageMaker.totalAmount}명</p>
        </div>
        <table id="userList">
            <thead>
                <tr>
                    <th>이메일</th>
                    <th>닉네임</th>
                    <th>연락처</th>
                </tr>
            </thead>
            <tbody id="originList">
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.nickName}</td>
                        <td>${user.phone}</td>
                    </tr>
                </c:forEach>
            </tbody>
            <tbody id="UserSearchResult" hidden></tbody>
        </table>
        <!-- 현재화면 하단부에 페이징 처리기준에 맞게, 페이지번호목록 표시 -->
        <div id="pagination">
            <form action="#" id="paginationForm">
                <input type="hidden" name="currPage">
                <input type="hidden" name="amount">
                <input type="hidden" name="pagesPerPage">

                <ul>
                    <!-- 1. 이전 이동여부표시(prev) -->
                    <c:if test="${pageMaker.prev}">
                        <li class="prev"><a class='prev' href="userList?currPage=${pageMaker.startPage -1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">이전</a></li>
                    </c:if>
                    
                    <!-- 페이지번호목록 표시 -->
                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
                        <c:choose>
                            <c:when test="${pageMaker.cri.currPage == pageNum}">
                                <li class="active">${pageNum}</li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/admin/userList?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <!-- 2. 다음 이동여부표시(next) -->
                    <c:if test="${pageMaker.next}">
                        <li class="next"><a class='next' href="userList?currPage=${pageMaker.endPage +1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">다음</a></li>
                    </c:if>
                </ul>

            </form>
        </div>
    </div>

    <footer id="adminFooter">
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>


    <script>
        $(function(){

            $('#nickSearchBtn').click(function(){searchUsers();});
        });

        function searchUsers(){
            var data = $('#nickSearch').val();

            if(data != ""){
                $.ajax({
                    url: "/admin/searchUser",
                    type: "POST",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    success: function(users){
                        $('#originList').hide();
                        $('#UserSearchResult').empty();
                        
                        for(i=0; i<users.length; i++){
                            var result = "<tr>" 
                                                +"<td>"+ users[i].userId +"</td>"
                                                +"<td>"+ users[i].nickName +"</td>"
                                                +"<td>"+ users[i].phone +"</td>"
                                            +"</tr>";
                            $('#UserSearchResult').append(result);
                        }
                        $('#UserSearchResult').show();
                        $('#pagination').hide();
                    }
                });
            }else{
                $('#UserSearchResult').hide();
                $('#originList').show();
            }
        }
    </script>
</body>
</html>
