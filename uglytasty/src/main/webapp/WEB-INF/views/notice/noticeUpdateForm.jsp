<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>

<link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        *, *:after, *:before {
            box-sizing: inherit;
        }
        select, input:focus{
            outline: none;
        }
        .inquiry-wrap h2{
            font-size: 35px;
            color: #000;
            font-weight: 600;
            padding: 20px 0;
            text-align: center;
        }
        .inquiry-wrap .select-bx{
            border: 1px solid #ddd;
            padding: 10px 30px 10px 15px;
            -webkit-appearance:none; /* for chrome */
            -moz-appearance:none; /*for firefox*/
            appearance:none;
           
            background-size: 24px;
            width: 100px;
            height: 20px;
        }
        .inquiry-table table{
            width: 100%;
            table-layout: fixed;
        }
        .inquiry-table table th, .inquiry-table table td{
            padding: 12px;
            font-size: 16px;
            border-bottom: 1px solid #ddd;
        }
        .inquiry-table table th{
            color: #666;
            font-weight: 600;
            font-size: 14px;
            text-align: left;
        }
        .inquiry-table .input , .inquiry-table .textarea{
            border: 1px solid #ddd;
            background: #fff;
            padding: 10px 12px;
            font-size: 14px;
            color: #333;
            width: 98%;
        }
        .inquiry-table .input:focus , .inquiry-table .textarea:focus{
            outline: none;
        }
        .inquiry-table .input::placeholder , .inquiry-table .textarea::placeholder{
            color: #999;
            font-size: 14px;
        }
        .inquiry-table .textarea{
            resize: none;
        }
        .textarea-wrap{
            width: 100%;
            position: relative;
        }
        .textarea-counter{
            position: absolute;
            bottom: 12px;
            right: 5px;
            font-size: 13px;
            color: #999;
            text-align: right;
            background: #fff;
            z-index: 1;
        }
       .ckbox[type="checkbox"]{
            display: none;
        }
        .ckbox[type="checkbox"] + label{
            display: inline-block;
            width: 20px;
            height: 20px;
            border:1px solid #707070;
            position: relative;
        }
        .ckbox[type="checkbox"]:checked + label::after{
            content:'✔';
            font-size: 14px;
            width: 20px;
            height: 20px;
            text-align: center;
            position: absolute;
            left: 0;
            top:0;
        }
        .filebox{
            display: flex;
            column-gap: 5px;
        }
        .filebox .upload-name {
            display: inline-block;
            width: 300px;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #ddd;
            color: #999;
        }
        .filebox label {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            font-size: 24px;
            line-height: 1;
            color: #fff;
            background-color: #999;
            cursor: pointer;
            margin-left: 10px;
        }
        .filebox input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }
        .btn-wrap{
            display: flex;
            justify-content: center;
            column-gap: 10px;
            margin-top: 30px;
        }
        .btn-wrap .btn{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 150px;
            height: 40px;
            font-size: 14px;
            color: #000;
            border: 1px solid #000;
        }
        .btn-wrap .btn-cancel{
            background: #fff;
        }
        .btn-wrap .btn-submit{
            background: #fbf728;
        }
    </style>
</head>
<body style="background-color: #f5f5f5;">
<jsp:include page="../common/header.jsp"/> 
    <div class="inquiry-wrap" style="max-width: 960px; margin: 0 auto; padding: 50px 0;">
    
        <h2>공지사항 수정</h2>
        <form action="update.no">
            <div class="inquiry-table">
                <table>
                    <colgroup>
                        <col style="width: 12%;" />
                        <col />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>제목 *</th>
                            <td>
                                <input type="text" name="title" id="title" placeholder="제목을 입력해주세요." class="input" value="${n.noticeTitle }">
                            </td>
                        </tr>
                       
                        <tr>
                            <th>내용 *</th>
                            <td>
                                <div class="textarea-wrap">
                                    <textarea name="content" id="content" cols="30" rows="10" class="textarea" style="white-space: pre-wrap;">${n.noticeContent }</textarea>
                                    <span id="counter" class="textarea-counter">0/2,000</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>고정글 설정 *</th>
                            <td>
                                <input type="checkbox" name="upfix2" id="upfix2" class="ckbox" ${n.upfix == 'Y' ? 'checked' : ''}>
                                <label for="upfix2"></label>
                                <input type="hidden" name="upfix" id="upfix" value="${n.upfix }">
                                <input type="hidden" name="noticeNo" id="noticeNo" value="${n.noticeNo }">
                               
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
                <div class="btn-wrap">
                
                    <button type="button" class="btn btn-cancel">취소</button>
                    <button type="submit" class="btn btn-submit">수정하기</button>
                </div>
            </div>
        </form>
        
 
    </div>
           <jsp:include page="../common/footer.jsp"/> 
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 파일첨부
        $("#file").on('change',function(){
            var fileName = $("#file").val();
            $(".upload-name").val(fileName);
        });

        // textarea 글자수 체크
        $('.textarea').keyup(function (e){
            var content = $(this).val();
            $('#counter').html("("+content.length+"/2,000)");    //글자수 실시간 카운팅

            if (content.length > 2000){
                alert("최대 2000자까지 입력 가능합니다.");
                $(this).val(content.substring(0, 2000));
                $('#counter').html("(2000/2,000)");
            }
            
           
        });
    </script>
    <script>
    $(document).ready(function() {
       
        $("#upfix2").change(function() {
           
            if ($(this).is(":checked")) {
                $("#upfix").val("Y"); 
            } else {
                $("#upfix").val("N");
            }
        });
    });
	</script>
    
    
</body>
</html>