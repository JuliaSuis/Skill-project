<html>
<head>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"> </script>

    <link title="timeline-styles" rel="stylesheet" href="https://cdn.knightlab.com/libs/timeline3/latest/css/timeline.css">

    <!-- 2 -->
    <script src="https://cdn.knightlab.com/libs/timeline3/latest/js/timeline.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

    <title>Timeline page</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
</head>
<body>

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
        <form class="form-inline my-2 my-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="signin">Sign In</a>
            </li>
        </form>
    </div>
</nav>

<main role="main">

    <style>
        h3.tl-headline-date {
            color: #1c1c1c !important;
        }
        /*h2.tl-headline {*/
            /*color: #1c1c1c;*/
        /*}*/
    </style>

    <!-- Main jumbotron for a primary marketing message or call to action -->
        <br><br><br><br>
        <div id='timeline-embed' style="width: 100%; height: 600px"></div>
    <!-- 3 -->
    <script type="text/javascript">
        var additionalOptions = {
            default_bg_color: {r:255, g:255, b:255},
            timenav_height: 250,
            initial_zoom: 5,
            hash_bohkmark: true,
            start_at_slide: 0
        }

        timeline = new TL.Timeline('timeline-embed',
            'https://docs.google.com/spreadsheets/d/1cWqQBZCkX9GpzFtxCWHoqFXCHg-ylTVUWlnrdYMzKUI/pubhtml', additionalOptions);
    </script>

    <script type="text/javascript">
        $.getJSON('/people.json', function(data) {
            //do stuff with your data here
            var timeline_json = data; // replace make_the_json() with the JSON object you created
            // two arguments: the id of the Timeline container (no '#')
            // and the JSON object or an instance of TL.TimelineConfig created from
            // a suitable JSON object
            window.timeline = new TL.Timeline('timeline-embed', timeline_json, additionalOptions);
        });
    </script>

</main>
<br><br><br>
<footer class="container">
    <p>&copy; SKILL 2018</p>
</footer>

</body>
</html>