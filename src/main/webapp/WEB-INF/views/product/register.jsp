<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>/product/register.jsp</title>
</head>
<%--<script>--%>
<%--    // 첨부파일 관련된 처리를 할 수 있도록 기본 동작을 막음--%>
<%--    $(document).ready(function (e){--%>

<%--        let formObj = $("form[role='form']");--%>
<%--        $("button[type='submit']").on("click", function (e){--%>
<%--            e.preventDefault();--%>
<%--            console.log("submit clicked");--%>
<%--            let str = "";--%>

<%--            $(".uploadResult ul li").each(function(i, obj){--%>

<%--                let jobj = $(obj);--%>

<%--                console.dir(jobj);--%>
<%--                console.log("-------------------------");--%>
<%--                console.log(jobj.data("filename"));--%>

<%--                str += "<input type='hidden' name='imageList["+i+"].imageId' value='"+jobj.data("imageId")+"'>";--%>
<%--                str += "<input type='hidden' name='imageList["+i+"].imageName' value='"+jobj.data("imageName")+"'>";--%>
<%--                str += "<input type='hidden' name='imageList["+i+"].imageUrl' value='"+jobj.data("imageUrl")+"'>";--%>
<%--                str += "<input type='hidden' name='imageList["+i+"].pId' value='"+ jobj.data("pId")+"'>";--%>

<%--            });--%>

<%--            console.log(str);--%>

<%--            formObj.append(str).submit();--%>
<%--        });--%>


<%--        let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");--%>
<%--        let maxSize = 5242880; //5MB--%>

<%--        function checkExtension(fileName, fileSize){--%>

<%--            if(fileSize >= maxSize){--%>
<%--                alert("파일 사이즈 초과");--%>
<%--                return false;--%>
<%--            }--%>

<%--            if(regex.test(fileName)){--%>
<%--                alert("해당 종류의 파일은 업로드할 수 없습니다.");--%>
<%--                return false;--%>
<%--            }--%>
<%--            return true;--%>
<%--        }--%>

<%--        let csrfHeaderName ="${_csrf.headerName}";--%>
<%--        let csrfTokenValue="${_csrf.token}";--%>

<%--// input type='file'의 내용이 변경되는 것을 감지하여 처리--%>
<%--        $("input[type='file']").change(function(e){--%>

<%--            let formData = new FormData();--%>

<%--            let inputFile = $("input[name='uploadFile']");--%>

<%--            let files = inputFile[0].files;--%>

<%--            for(let i = 0; i < files.length; i++){--%>

<%--                if(!checkExtension(files[i].name, files[i].size) ){--%>
<%--                    return false;--%>
<%--                }--%>
<%--                formData.append("uploadFile", files[i]);--%>
<%--            }--%>

<%--            $.ajax({--%>
<%--                url: '/uploadAjaxAction',--%>
<%--                processData: false,--%>
<%--                contentType: false,--%>
<%--                beforeSend: function(xhr) {--%>
<%--                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);--%>
<%--                },--%>
<%--                data:formData,--%>
<%--                type: 'POST',--%>
<%--                dataType:'json',--%>
<%--                success: function(result){--%>
<%--                    console.log(result);--%>
<%--                    showUploadResult(result); //업로드 결과 처리 함수--%>

<%--                }--%>
<%--            }); //$.ajax--%>
<%--       });--%>

<%--        // 업로드된 결과를 화면에서 섬네일을 만들어서 처리--%>
<%--        function showUploadResult(uploadResultArr){--%>

<%--            if(!uploadResultArr || uploadResultArr.length == 0){ return; }--%>

<%--            let uploadUL = $(".uploadResult ul");--%>

<%--            let str ="";--%>

<%--            $(uploadResultArr).each(function(i, obj) {--%>

<%--                if(obj.image){--%>
<%--                    let fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);--%>
<%--                    str += "<li data-path='"+obj.uploadPath+"'";--%>
<%--                    str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"--%>
<%--                    str +" ><div>";--%>
<%--                    str += "<span> "+ obj.fileName+"</span>";--%>
<%--                    str += "<button type='button' data-file=\'"+fileCallPath+"\' "--%>
<%--                    str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";--%>
<%--                    str += "<img src='/display?fileName="+fileCallPath+"'>";--%>
<%--                    str += "</div>";--%>
<%--                    str +"</li>";--%>
<%--                }else{--%>
<%--                    let fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);--%>
<%--                    let fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");--%>

<%--                    str += "<li "--%>
<%--                    str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";--%>
<%--                    str += "<span> "+ obj.fileName+"</span>";--%>
<%--                    str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "--%>
<%--                    str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";--%>
<%--                    str += "<img src='/resources/img/attach.png'></a>";--%>
<%--                    str += "</div>";--%>
<%--                    str +"</li>";--%>
<%--                }--%>

<%--            });--%>

<%--            uploadUL.append(str);--%>
<%--        }--%>
<%--// 'X'아이콘을 클릭하면 서버에서 삭제하도록--%>
<%--        $(".uploadResult").on("click", "button", function(e){--%>

<%--            console.log("delete file");--%>

<%--            let targetFile = $(this).data("file");--%>
<%--            let type = $(this).data("type");--%>

<%--            let targetLi = $(this).closest("li");--%>

<%--            $.ajax({--%>
<%--                url: '/deleteFile',--%>
<%--                data: {fileName: targetFile, type:type},--%>
<%--                beforeSend: function(xhr) {--%>
<%--                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);--%>
<%--                },--%>

<%--                dataType:'text',--%>
<%--                type: 'POST',--%>
<%--                success: function(result){--%>
<%--                    alert(result);--%>

<%--                    targetLi.remove();--%>
<%--                }--%>
<%--            }); //$.ajax--%>
<%--        });--%>
<%--    });--%>

<%--</script>--%>


<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div>
        <h1>상품 등록</h1>

     <%--    상품 등록--%>
        <form action="/product/register" method="post" enctype="multipart/form-data">

            <table>
                <tr>
                    <th>상품명</th>
                    <td><input type="text" name="name" placeholder="상품명을 입력해주세요"></td>
                </tr>
                <tr>
                    <th>상세정보</th>
                    <td><input type="text" name="content" placeholder="상세정보를 입력해주세요"></td>
                </tr>
                <tr>
                    <th>상품종류</th>
                    <td><input type="text" name="categoryId" placeholder="상품의 종류를 선택해주세요"></td>
                </tr>
                <tr>
                    <th>경매기간</th>
                    <td><input type="text" name="startedAt" placeholder="시작시간을 선택해주세요 "></td>
                    <td><input type="text" name="endedAt" placeholder="종료시간을 선택해주세요 "></td>
                </tr>
                <tr>
                    <th>시작 가격</th>
                    <td><input type="text" name="startedPrice" placeholder="시작가격을 입력해주세요"></td>
                </tr>
                <tr>
                    <th>입찰단위금액</th>
                    <td><input type="text" name="bidIncrement" placeholder="입찰 단위금액을 선택해주세요"></td>
                </tr>

                <tr>
                    <th>상품 이미지</th>
                    <td><input type="file" name="images"></td>
                    <td><input type="file" name="images"></td>
                    <td><input type="file" name="images"></td>
                </tr>

                <tr>
                    <td>
                        <button type="submit" id="register">상품등록</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

</body>
</html>
