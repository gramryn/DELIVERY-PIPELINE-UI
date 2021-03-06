<%--
  Created by IntelliJ IDEA.
  User: hrjin
  Date: 2017-06-02
  Time: 오후 5:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br>
Service Instance 대시보드 :: SERVICE INSTANCE DASHBOARD
<br>
<button type="button" id="btnSearch"> [ 조회 ] </button>
<button type="button" id="btnReset"> [ 목록 초기화 ] </button>
<br>
<h1>RESULT</h1>
<div id="resultArea" style="width: 90%; height: auto; min-height: 100px; padding: 10px; border: dotted #ff8c00 4px;">
</div>

<script type="text/javascript">

    // GET LIST
    var getList = function() {
        procCallAjax("/serviceInstance/serviceInstanceList.do", {}, callbackGetList);
    };


    // CALLBACK
    var callbackGetList = function(data) {
        if (RESULT_STATUS_FAIL === data.resultStatus) return false;

        var listLength = data.length;
        var htmlString = [];

        // STYLE 1
        for (var i = 0; i < listLength; i++) {
            htmlString.push("SERVICE INSTANCE :: STYLE 1 :: " + data[i].id
                    + " || " + "<a href='javascript:void(0);' onclick='moveDetailPage(\"" + data[i].id +  "\");'> DETAIL </a> "
                    + "<br><br>");
        }

        htmlString.push("<br><br>");

        $('#resultArea').html(htmlString);
    };


    // MOVE DETAIL PAGE
    var moveDetailPage = function(id) {
        procMovePage('<c:url value="/serviceInstance/detail/"/>' + id);
    };


    // BIND
    $("#btnSearch").on("click", function() {
        getList();
    });


    // BIND
    $("#btnReset").on("click", function() {
        $('#resultArea').html("");
    });


    // ON LOAD
    $(document.body).ready(function () {
        //
    });

</script>
