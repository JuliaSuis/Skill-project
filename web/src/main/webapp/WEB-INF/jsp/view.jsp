<html>
<head>
    <title>Math achievements</title>

    <style type="text/css">
        html, body {
            font: 10pt arial;
        }

        #graph {
            width: 600px;
            height: 400px;
            border: 1px solid lightgray;
        }
    </style>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">


    <script type="text/javascript" src="vis.js"></script>
    <link type="text/css" rel="stylesheet" href="vis-network.min.css"/>
    <script src="webjars/jquery/3.2.0/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var nodes = null;
            var edges = null;
            var network = null;

            $.get("/data", function (gotData) {
                nodes = gotData;
                console.log("Got data: " + nodes);
                nodes.forEach(function (elem)
                {
                    elem.label = elem.text+" - "+elem.time;
                });
                $.get("/edges", function (gotEdges) {
                    edges = gotEdges;
                    console.log("Got edges: " + edges);

                    edges.forEach(function (elem) {
                        elem.from = elem.source;
                        elem.to = elem.destination;
                        elem.label = undefined;
                    });

                    var container = $("#graph");
                    container.css({"width": $(window).width() + "px"});
                    container.css({"height": $(window).height() + "px"});

                    var data = {
                        nodes: nodes,
                        edges: edges
                    };

                    var options = {
                        configure: {
                            enabled: true,
                            filter: 'nodes,edges',
                            container: document.getElementById('graph'),
                            showButton: true
                        },
                        nodes: {
                            borderWidthSelected: 5,
                            color: {
                                background: "rgba(187,192,252,1)"
                            },
                            physics: false,
                            scaling: {
                                min: 11
                            },
                            size: 30,

                            "shadow": {
                                "enabled": true,
                                "size": 3
                            },
                            "shape": "circle",
                        },
                        edges: {
                            arrows: {
                                to: {enabled: false}
                            },
                            color: {
                                color:'#5294b6',
                                highlight:'#181456',
                                hover: '#848484'
                            },
                            scaling: {
                               customScalingFunction: function (min,max,total,value) {
                                   return value/(1.0*max);
                               }
                            },
                            smooth: {
                                enabled: true,
                                type: 'diagonalCross'
                            },
                            physics: false
                        },
                        layout: {
                            hierarchical: {
                                enabled: true,
                                levelSeparation: 100,
                                nodeSpacing: 150,
                                treeSpacing: 150
                            }
                        }
                    };

                    network = new vis.Network(document.getElementById('graph'), data, options);
                });
            });
        });
    </script>

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
                <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Views</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="view">Time 2D</a>
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

<div id="graph"></div>
</body>

</html>