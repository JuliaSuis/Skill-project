<%--
  Created by IntelliJ IDEA.
  User: juliasemenova
  Date: 01.11.17
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <script src="//unpkg.com/3d-force-graph@1.5/dist/3d-force-graph.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/qwest/4.4.5/qwest.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/PapaParse/4.1.4/papaparse.min.js"></script>

    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous">
    </script>

    <title>Edit page</title>
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

<script type="text/javascript">
    $(document).ready(function () {
        var nodes = null;
        var txt = "";
        var i = 1;

        $.get("/data", function (gotData) {
            nodes = gotData;
            console.log("Got data: " + nodes);
            nodes.forEach(function (elem)
            {
                /*elem.label = elem.text+" - "+elem.time;*/
                txt += "<tr><td>" + i +
                    "</td><td>" + elem.text +
                    "</td><td>" + elem.name +
                    "</td><td>" + elem.time +
                    "</td><th scope=\"col\"></td>" +
                    "<td><button type=\"button\" class=\"btn btn-danger btn-sm\">Delete</button></th></tr>";
                i = i + 1;
            });
            if(txt != ""){
                $("#table").append(txt).removeClass("hidden");
            }

        });
    });
</script>


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <table id="table" class="table table-hover table-bordered">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Author</th>
                        <th scope="col">Name</th>
                        <th scope="col">Time</th>
                        <th scope="col">Link</th>
                        <th scope="col"></th>
                    </tr>
                </table>
                <button type="button" class="btn btn-primary">Add new theorem</button>
            </div>
            <div class="col-md-1"></div>
        </div>
        <div class="row"></div>
    </div>
</body>
</html>
