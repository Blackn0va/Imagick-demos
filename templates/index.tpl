<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>{$pageTitle}</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/imagick.css" rel="stylesheet">
    <link href="/css/colpick.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/css/syntaxhighlighter/shCoreDefault.css">
    <link type="text/css" rel="stylesheet" href="/css/syntaxhighlighter/shThemePHPStormLight.css">
</head>

{inject name='nav' value='ImagickDemo\Navigation\Nav'}

<body>
<header class="navbar navbar-static-top bs-docs-nav" id="top" role="banner">
    <div class="container visible-md visible-lg">
        <nav class="navbar-default " role="navigation">
            <ul class="nav navbar-nav menuBackground">
                {inject name='navBar' value='ImagickDemo\NavigationBar'}
                {$navBar->render() | nofilter}
            </ul>
        </nav>

        <nav class="navbar-default pull-right" role="navigation">
            <ul class="nav navbar-nav menuBackground">
                {$navBar->renderRight() | nofilter}
            </ul>
        </nav>   
    </div>

    <div class="container visible-xs visible-sm">
        {$navBar->renderSelect() | nofilter}
        {$nav->renderSelect() | nofilter}
    </div>
</header>


{inject name='control' value='ImagickDemo\Control'}
{inject name='example' value='ImagickDemo\Example'}
{inject name='docHelper' value='ImagickDemo\DocHelper'}


{$remaining = 12 - $example->getColumnRightOffset();}



<div class='container'>

    <div class="row hidden-xs hidden-md hidden-lg">

        {block name='title'}
        
        <div class="col-xs-6">
            <h3 class='noMarginTop'>
                {$example->renderTitle() | nofilter}
            </h3>
        </div>
        <div class="col-xs-6 " style='text-align: right'>
            {$nav->renderPreviousLink() | nofilter}
            {$nav->renderNextLink() | nofilter}
        </div>
        {/block}
    </div> 
    
    
    
    <div class="row">
        
        <div class="col-md-2 visible-md visible-lg navPanel" >
            {$nav->renderNav()}
        </div>

        <div class="col-md-10 columnAdjust">
            <div class='row'>
                {block name='mediumTitle'}
                <div class='col-md-12 visible-md visible-lg contentPanel'>
                    <div class="row hidden-sm hidden-xs">
                        <div class="col-sm-6">
                            <h3 class='titleMargin'>
                                {$example->renderTitle() | nofilter}
                            </h3>
                        </div>

                        <div class="col-sm-6" style='text-align: right'>
                            <span class="titleMargin" style="display: block; padding-top: 3px">
                                {$nav->renderPreviousLink() | nofilter}
                                <span style="width: 40px; display: inline-block">&nbsp;</span>
                                {$nav->renderNextLink() | nofilter}
                            </span>
                        </div>
                    </div>

                    {$docDescription = $docHelper->showDescription()}

                    {if ($docDescription)}
                        {$docDescription | nofilter}
                        <br/>
                    {/if}

                    {$description = $example->renderDescription()} 
                    {if ($description)}
                        {$description | nofilter}
                        <br/>
                    {/if}

                </div>
                {/block}
            </div>
            
            {$remaining = 12 - $example->getColumnRightOffset()}

            <div class="row">
                <div class="col-md-{$remaining} " style="padding-top: 2px;">
                    
                    {block name='mainContent'}
                    <div class="row">
                        <div class="col-md-7 col-xs-12 contentPanel">
                            {$example->render() | nofilter}
                        </div>
                        <div class="col-sm-5 formHolder">
                            {$control->renderForm() | nofilter}
                        </div>
                    </div>
                    {/block}
                </div>
            </div>
            
            
            {$docHelper->showDescriptionPanel(true) | nofilter} 
            
            {$example->renderDescriptionPanel(true) | nofilter}

            {$docHelper->showParametersPanel() | nofilter}

            {$docHelper->showExamples() | nofilter}
            
            {inject name='banner' value='ImagickDemo\Banners\Banner'}

            <div class="row">
                <div class="col-md-12">
                    {$banner->render() | nofilter}
                </div>
            </div>
        </div>

        <div class="row visible-xs visible-sm">
            <div class="col-md-12">
                {$navBar->renderIssueLink() | nofilter}
            </div>
        </div>
    </div>

    <div>
        <?php
        echo "<br/><br/><br/><span style='font-size: 8px; display: block;'>Peak memory ". number_format(memory_get_peak_usage());
            //." - <a href='/info'>Status</a> <a href='/queueinfo'>QueueInfo</a> </span>"
        ?> 
    </div>
</div>

</body>

<script src="/js/jquery-1.11.0.min.js"></script>
<script src="/js/jquery-ui-1.10.0.custom.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/colpick.js"></script>
<script src="/js/jquery.fastLiveFilter.js"></script>
<script type="text/javascript" src="/js/syntaxhighlighter/xregexp.js"></script>
<script type="text/javascript" src="/js/syntaxhighlighter/shCore.js"></script>
<script type="text/javascript" src="/js/syntaxhighlighter/shBrushPhp.js"></script>
<script type="text/javascript" src="/js/syntaxhighlighter/shBrushJScript.js"></script>

<script src="/js/AsyncImage.js"></script>


<script type="text/javascript">
    
    //http://colpick.com/plugin - I love you color picker

    function addColorSelector(selector, targetElement) {
        var params = {
            colorScheme:'dark',
            layout:'rgbhex',
            color:'ff8800',
            submit: false,
            onChange:function(hsb, hex, rgb, el) {
                $(el).children().css('background-color', '#' + hex);
                $(targetElement).val("rgb("+ rgb.r + ", " + rgb.g + ", " + rgb.b + ")")
            },
        };

        var startColor = $(selector).data('color');

        if (startColor !== undefined) {
            params.color = startColor;
        }

        $(selector).colpick(params);
    }

    //These are currently hardcoded - todo add JS page injection.
    addColorSelector("#backgroundColorSelector", "#backgroundColor");
    addColorSelector("#colorSelector", "#color");
    addColorSelector("#strokeColorSelector", "#strokeColor");
    addColorSelector("#targetColorSelector", "#targetColor");
    addColorSelector("#fillColorSelector", "#fillColor");
    addColorSelector("#fillModifiedColorSelector", "#fillModifiedColor");
    addColorSelector("#textUnderColorSelector", "#textUnderColor");
    addColorSelector("#gradientStartColorSelector", "#gradientStartColor");
    addColorSelector("#gradientEndColorSelector", "#gradientEndColor");
    addColorSelector("#thresholdColorSelector", "#thresholdColor"); 

    {literal}
    var params = {
        links: {
            raw: 'Raw text',
            github: 'View on github'
        },
    };

    SyntaxHighlighter.all(params);


    $(function() {
        var callback = function(total) {
            if (total == 0) {
                $('#searchResultNone').css('display', 'inline-block');
            }
            else {
                $('#searchResultNone').css('display', 'none');
            }
        };

        var options = {
            //    timeout: 200,
            callback: callback
        };

        $('#searchInput').fastLiveFilter(
                '#searchList',
                options
        );
    });



        function toggleImage(imageSelector, mouseSelector, originalURL, originalText, modifiedURL, modifiedText) {

        var newImageURL;
        var newText;

        if ( typeof toggleImage.originalImage == 'undefined' ) {
            // First call, perform the initialization
            toggleImage.originalImage = false;
        }

        if (toggleImage.originalImage) {
            newImageURL = modifiedURL;
            newText = modifiedText;
            toggleImage.originalImage = false;
        }
        else {
            newImageURL = originalURL;
            newText = originalText;
            toggleImage.originalImage = true;
        }

        $(imageSelector).attr('src', newImageURL);
        $(mouseSelector).text(newText);
    }

    initAsyncImage('.asyncImage');


    
    //$(window).bind("pageshow", function() {
    // use this to reset form for back button cleanup
    //    alert("pageshow?");
    //});


    {/literal}
</script>






</html>
