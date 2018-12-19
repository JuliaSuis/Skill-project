<%--
  Created by IntelliJ IDEA.
  User: juliasemenova
  Date: 12.07.18
  Time: 02:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Node 4</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link rel="stylesheet" href="/alchemy/styles/vendor.css"/>
    <link rel="stylesheet" href="/alchemy/alchemy.min.css"/>

</head>
<body>
<div class="alchemy" id="alchemy"></div>

<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="/alchemy/scripts/vendor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.10/lodash.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src="/alchemy/alchemy.min.js"></script>

<script type="text/javascript">
    var config = {
        dataSource: '/nodefour.json',
        directedEdges: true,
        forceLocked: false,
//        graphHeight: function(){ return 400; },
//        graphWidth: function(){ return 400; },
//        linkDistance: function(){ return 40; },
        nodeTypes: {"node_type":[ "Main",
            "Base"]},
        nodeCaption: function(node){
            return node.caption + " " + node.date;},
        nodeStyle: {
            "all": {
                "borderColor": "#ffa500",
                "borderWidth": function(d, radius) {
                    return radius / 4
                },
                "color": function(d) {
                    return "rgba(163, 163, 163, 1)"
                },
                "radius": function(d) {
                    if(d.getProperties().root)
                        return 15; else return 10
                },
            }
        },
        edgeStyle: {
            "all": {
                "width": function(d) {
                    return (d.getProperties().load - 0.5) * 0.9
                }
            }
        }
    };

    alchemy = new Alchemy(config)
</script>
</body>
</html>
