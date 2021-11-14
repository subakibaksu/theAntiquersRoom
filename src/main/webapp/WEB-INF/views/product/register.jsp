<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>/product/register.jsp</title>
</head>
<body>

    <form action="/product/register" method="post">
        <table>
            <tr>
                <td><input type="text" name="name" placeholder="상품명을 입력해주세요"></td>
            </tr>
            <tr>
                <td><input type="text" name="content" placeholder="상세정보를 입력해주세요"></td>
            </tr>
            <tr>
                <td><input type="text" name="categoryId" placeholder="상품의 종류를 선택해주세요"></td>
            </tr>
            <tr>
                <td><input type="text" name="staredAt" placeholder="시작시간을 선택해주세요 "></td>
            </tr>
            <tr>
                <td><input type="text" name="endedAt" placeholder="종료시간을 선택해주세요 "></td>
            </tr>
            <tr>
                <td><input type="text" name="stardtedPrice" placeholder="시작가격을 입력해주세요"></td>
            </tr>
            <tr>
                <td><input type="text" name="bidIncrement" placeholder="입찰 단위금액을 선택해주세요"></td>
            </tr>



            <tr>
                <td>
                    <button type="submit" id="register">상품등록</button>
                </td>
            </tr>
        </table>
    </form>

</body>
</html>
