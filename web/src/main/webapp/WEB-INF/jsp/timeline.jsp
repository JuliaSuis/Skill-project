<html>
<head>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"> </script>

    <link title="timeline-styles" rel="stylesheet" href="https://cdn.knightlab.com/libs/timeline3/latest/css/timeline.css">

    <!-- 2 -->
    <script src="https://cdn.knightlab.com/libs/timeline3/latest/js/timeline.js"></script>

    <div id='timeline-embed' style="width: 100%; height: 600px"></div>

    <!-- 3 -->
    <script type="text/javascript">
        var additionalOptions = {
            default_bg_color: {r:255, g:255, b:255},
            timenav_height: 250
        }
        // The TL.Timeline constructor takes at least two arguments:
        // the id of the Timeline container (no '#'), and
        // the URL to your JSON data file or Google spreadsheet.
        // the id must refer to an element "above" this code,
        // and the element must have CSS styling to give it width and height
        // optionally, a third argument with configuration options can be passed.
        // See below for more about options.
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
</head>

<body>

</body>
</html>