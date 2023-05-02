<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="${conPath }/js/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script src="${conPath }/js/jquery.fn.gantt.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.js"></script>
    <script>
        $(function() {
            "use strict";

            var demoSource = [{
                name: "Sprint 0",
                desc: "Analysis",
                values: [{
                    from: 1320192000000,
                    to: 1322401600000,
                    label: "Requirement Gathering",
                    customClass: "ganttRed"
                }]
            },{
                desc: "Scoping",
                values: [{
                    from: 1322611200000,
                    to: 1323302400000,
                    label: "Scoping",
                    customClass: "ganttRed"
                }]
            },{
                name: "Sprint 1",
                desc: "Development",
                values: [{
                    from: 1323802400000,
                    to: 1325685200000,
                    label: "Development",
                    customClass: "ganttGreen"
                }]
            },{
                name: " ",
                desc: "Showcasing",
                values: [{
                    from: 1325685200000,
                    to: 1325695200000,
                    label: "Showcasing",
                    customClass: "ganttBlue"
                }]
            },{
                name: "Sprint 2",
                desc: "Development",
                values: [{
                    from: 1325695200000,
                    to: 1328785200000,
                    label: "Development",
                    customClass: "ganttGreen"
                }]
            },{
                desc: "Showcasing",
                values: [{
                    from: 1328785200000,
                    to: 1328905200000,
                    label: "Showcasing",
                    customClass: "ganttBlue"
                }]
            },{
                name: "Release Stage",
                desc: "Training",
                values: [{
                    from: 1330011200000,
                    to: 1336611200000,
                    label: "Training",
                    customClass: "ganttOrange"
                }]
            },{
                desc: "Deployment",
                values: [{
                    from: 1336611200000,
                    to: 1338711200000,
                    label: "Deployment",
                    customClass: "ganttOrange"
                }]
            },{
                desc: "Warranty Period",
                values: [{
                    from: 1336611200000,
                    to: 1349711200000,
                    label: "Warranty Period",
                    customClass: "ganttOrange"
                }]
            }];

            // shifts dates closer to Date.now()
            var offset = new Date().setHours(0, 0, 0, 0) -
                new Date(demoSource[0].values[0].from).setDate(35);
            for (var i = 0, len = demoSource.length, value; i < len; i++) {
                value = demoSource[i].values[0];
                value.from += offset;
                value.to += offset;
            }

            $(".gantt").gantt({
                source: demoSource,
                navigate: "scroll",
                scale: "weeks",
                maxScale: "months",
                minScale: "hours",
                itemsPerPage: 10,
                scrollToToday: false,
                useCookie: true,
                onItemClick: function(data) {
                    alert("Item clicked - show some details");
                },
                onAddClick: function(dt, rowId) {
                    alert("Empty space clicked - add an item!");
                },
                onRender: function() {
                    if (window.console && typeof console.log === "function") {
                        console.log("chart rendered");
                    }
                }
            });

            $(".gantt").popover({
                selector: ".bar",
                title: function _getItemText() {
                    return this.textContent;
                },
                container: '.gantt',
                content: "Here's some useful information.",
                trigger: "hover",
                placement: "auto right"
            });

            prettyPrint();

        });
    </script>
</head>
<body>
		<div class="gantt"></div>
    
</body>
</html>