<%--
  Created by IntelliJ IDEA.
  User: juliasemenova
  Date: 11.07.18
  Time: 07:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>

    <!--link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script-- src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script-->

    <script src="//unpkg.com/3d-force-graph@1.5/dist/3d-force-graph.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/qwest/4.4.5/qwest.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/PapaParse/4.1.4/papaparse.min.js"></script>

    <script src="//unpkg.com/3d-force-graph@1.5/dist/3d-force-graph.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/qwest/4.4.5/qwest.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/PapaParse/4.1.4/papaparse.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous">
    </script>

    <style>
        .btn-success
        {
            width: 100% !important;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href='http://www.skill.uni-passau.de'>SKILL</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="main">Home<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="http://www.skill.uni-passau.de">About project</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Views</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="timeline">Time Line</a>
                    <a class="dropdown-item" href="view2">Connection 3D</a>
                    <a class="dropdown-item" href="view.jsp">Mathemtician</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="signin">Sign In</a>
            </li>
        </form>
    </div>
</nav>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-10">
            <div id="3d-graph"></div>
        </div>

        <div class="col-md-2">
            </form>
            <label for="times">Times</label>
            <select multiple class="form-control" id="times" size=5 style='height: 100%;'>
                <c:if test="${not empty times}">
                    <c:forEach var="t" items="${times}">
                        <option>${t}</option>
                    </c:forEach>
                </c:if>
            </select>
            <br>
            <button type="button" class="btn btn-success" id="buttonTimes">Filter</button>
            </form>
        </div>

    </div>
</div>


<script>
    $(document).ready(function(){

        var url = "links.json";

        function nodeCallback(node)
        {
            console.log(node);
        }

            function getGraphDataSets() {

                const loadMiserables = function(Graph) {
                    Graph
                        .cooldownTicks(200)
                        .nameField('label')
                        .autoColorBy('group')
                        .forceEngine('ngraph')
                        .idField('id')
                        .valField('value')
                        .jsonUrl(url);
                        //.onNodeClick(alert("Node Inside function"));
                }
                //

                return [loadMiserables];
            }
//
        const Graph = ForceGraph3D()
            (document.getElementById("3d-graph"));
//                .onNodeClick(redirect());

//        function getGraphDataSets() {
//            const Graph = ForceGraph3D()
//            (document.getElementById('3d-graph'))
//                .cooldownTicks(200)
//                .nameField('label')
//                .autoColorBy('group')
//                .forceEngine('ngraph')
//                .idField('id')
//                .valField('value')
//                .jsonUrl(url)
//                .onNodeClick(redirect);
//
//            return [Graph]
//        }

//        function redirect(node){
//            //alert("Node outside fn");
//            window.open(href="nodepage", '_blank');
//            //console.log("Hey, I'm working here!");
//        }

//            let curDataSetIdx;
        const dataSets = getGraphDataSets();
//
//            let toggleData;
//            (toggleData = function() {
//                curDataSetIdx = curDataSetIdx === undefined ? 0 : (curDataSetIdx+1)%dataSets.length;
//                const dataSet = dataSets[curDataSetIdx];
//
//                Graph.resetProps(); // Wipe current state
//                dataSet(Graph); // Load data set


        //document.getElementById('graph-data-description').innerHTML = dataSet.description ? `Viewing ${dataSet.description}` : '';
        //        })(); // IIFE init

        $("#buttonNodes").click(function()
        {
            var sList = "";
            $("input[type='checkbox'][name='nodes']").each(function ()
            {
                var sThisVal = (this.checked ? $(this).val() : "0");
                sList += (sList=="" ? sThisVal : "," + sThisVal);
            });
            console.log(sList);

            url="links.json?nodes="+sList;

            const dataSet = dataSets[0];

            Graph.resetProps(); // Wipe current state
            dataSet(Graph); // Load data set
        });

        $("#buttonTimes").click(function()
        {
            var sList = $("#times").val();

            url="links.json?time="+sList;

            const dataSet = dataSets[0];

            Graph.resetProps(); // Wipe current state
            dataSet(Graph); // Load data set
            console.log(url);
        });

    });

</script>
</body>