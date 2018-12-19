<html>
<head>

    <meta charset="utf-8">
    <title>Node 1</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link rel="stylesheet" href="/alchemy/styles/vendor.css"/>
    <link rel="stylesheet" href="/alchemy/alchemy.min.css"/>
</head>
<body>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="/alchemy/scripts/vendor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.10/lodash.min.js"></script>

<script src="/alchemy/alchemy.min.js"></script>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href='http://www.skill.uni-passau.de'>SKILL</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="main">Home<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="http://www.skill.uni-passau.de">About project</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="timeline">Time Line<span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>

<div class="alchemy" id="alchemy" align="center"></div>

<script type="text/javascript">
    var config = {
        dataSource: '/nodefir.json',
        directedEdges: true,
        forceLocked: false,
        //nodeCaptionsOnByDefault: true,
        graphHeight: function(){ return 500; },
//        graphWidth: function(){ return 600; },
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

<br><br><br>
<footer class="container">
    <p>&copy; SKILL 2018</p>
</footer>

</body>
</html>

