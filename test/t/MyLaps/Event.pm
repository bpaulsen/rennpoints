package TestsFor::RennPoints::MyLaps::Event;
use Test::Class::Moose;
use RennPoints::MyLaps::Event;

    # methods that begin with test_ are test methods.
sub test_parse_races {
    my $test = shift;

    isa_ok my $event = RennPoints::MyLaps::Event->new( content => getContent(), id => 0 ), 'RennPoints::MyLaps::Event';
    is @{$event->races}, 32, "Testing number of races that were parsed";
}

sub test_url {
    my $test = shift;

    isa_ok my $event = RennPoints::MyLaps::Event->new( content => getContent(), id => 0 ), 'RennPoints::MyLaps::Event';
    ok $event->url, 'test that URL is not null';
}


sub getContent {
my $content =<<'EOF';

<!DOCTYPE html>
<html>
<head prefix="og:http://ogp.me/ns#">
    <meta charset="utf-8" />
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    

<meta name="apple-itunes-app" content="app-id=988412583" app-argument="" />
<meta name="google-play-app" content="app-id=com.mylaps.speedhive">
<title>Peachstate 225 - 2017 Road Atlanta, PCA Club Racing, United States - Official Event Results, MYLAPS Speedhive</title>
<meta property="og:title" content="Peachstate 225 - 2017 Road Atlanta, PCA Club Racing, United States - Official Event Results, MYLAPS Speedhive" />
<meta name="description" content="Explore official results of Peachstate 225 - 2017 Road Atlanta, Car event 31 March 2017">
<meta name="og:description" content="Explore official results of Peachstate 225 - 2017 Road Atlanta, Car event 31 March 2017">
<meta property="og:image" content="https://speedhive.mylaps.com/Images/images/share.jpg" />
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@mylaps">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
<link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
<link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
<link rel="manifest" href="/manifest.json">
<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#f7941e">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="msapplication-TileColor" content="#f7941e">
<meta name="msapplication-TileImage" content="/mstile-144x144.png">
<meta name="msapplication-config" content="/browserconfig.xml">
<meta name="theme-color" content="#ffffff">
https\://speedhive.mylaps.com/api/organizationevents\?id\=5427    
    <link href="https://speedhive.azureedge.net/Content/css?1.0.0.30876" rel="stylesheet"/>
<script>(function() {
                var loadFallback,
                    len = document.styleSheets.length;
                for (var i = 0; i < len; i++) {
                    var sheet = document.styleSheets[i];
                    if (sheet.href.indexOf('https://speedhive.azureedge.net/Content/css?1.0.0.30876') !== -1) {
                        var meta = document.createElement('meta');
                        meta.className = 'sr-only';
                        document.head.appendChild(meta);
                        var value = window.getComputedStyle(meta).getPropertyValue('width');
                        document.head.removeChild(meta);
                        if (value !== '1px') {
                            if(document.readyState === 'complete') {
                                var head  = document.getElementsByTagName('head')[0];
                                var link  = document.createElement('link');
                                link.rel  = 'stylesheet';
                                link.type = 'text/css';
                                link.href = '/Content/css?1.0.0.30876';
                                head.appendChild(link);
                                return true;
                            } else {
                                document.write('<link href="/Content/css?1.0.0.30876" rel="stylesheet" type="text/css" />');
                            }
                        }
                    }
                }
                return true;
            }())||document.write('<script src="/Content/css"><\/script>');</script>

    
    <link href="https://speedhive.azureedge.net/Content/event?1.0.0.30876" rel="stylesheet"/>
<script>(function() {
                var loadFallback,
                    len = document.styleSheets.length;
                for (var i = 0; i < len; i++) {
                    var sheet = document.styleSheets[i];
                    if (sheet.href.indexOf('https://speedhive.azureedge.net/Content/event?1.0.0.30876') !== -1) {
                        var meta = document.createElement('meta');
                        meta.className = 'event-search event-search-term';
                        document.head.appendChild(meta);
                        var value = window.getComputedStyle(meta).getPropertyValue('height');
                        document.head.removeChild(meta);
                        if (value !== '50px') {
                            if(document.readyState === 'complete') {
                                var head  = document.getElementsByTagName('head')[0];
                                var link  = document.createElement('link');
                                link.rel  = 'stylesheet';
                                link.type = 'text/css';
                                link.href = '/Content/event?1.0.0.30876';
                                head.appendChild(link);
                                return true;
                            } else {
                                document.write('<link href="/Content/event?1.0.0.30876" rel="stylesheet" type="text/css" />');
                            }
                        }
                    }
                }
                return true;
            }())||document.write('<script src="/Content/event"><\/script>');</script>


    <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet'>
</head>
<body class="page-events page-events-details">
        <!-- Google Tag Manager -->
    <noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-N3RH8Z"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    '//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-N3RH8Z');</script>
    <!-- End Google Tag Manager -->

    <div class="page-container">
        
<div class="header">
    <div class="top-menu">
        <div class="top-search clearfix">
            <form id="searchform" action="/Events/Search" method="POST">
                <div class="searchbar">
                    <span class="ico ico-magnify-off"></span>
                    <input class="event-search-on-page-not-found" type="text" placeholder="Search for event results" value="" name="searchterm">
                    <button type="submit" value="SEARCH" id="submit-search">SEARCH</button>
                </div>
            </form>
        </div><!-- top-search -->
        <ul class="nav nav-tabs">
            <li role="presentation">
                <a href="/app">DOWNLOAD APP</a>
            </li>
            <li role="presentation">
                <a href="https://speedhiveshop.mylaps.com" target="_blank">SHOP</a>
            </li>
            <li role="presentation">
                <a href="/x2link">X2 LINK</a>
            </li>
            <li role="presentation">
                <a href="https://www.mylaps.com">MYLAPS.COM</a>
            </li>
            <li role="presentation" class="dropdown dropdown-language">
                <button class="btn btn-menu dropdown-toggle" type="button" id="languageDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="ico ico-arrow-down-white"></span>
                    <span class="selectedLanguage">ENG</span>
                </button>
                <ul id="language-change" class="dropdown-menu" aria-labelledby="languageDropdown">
                    <li>
                        <a href="#" data-language="en">ENGLISH</a>
                    </li>
                    <li>
                        <a href="#" data-language="nl">NEDERLANDS</a>
                    </li>
                    <li>
                        <a href="#" data-language="ja">日本語</a>
                    </li>
                </ul>
            </li>
                <li role="presentation" class="dropdown dropdown-profile">
                    <button class="btn btn-menu dropdown-toggle" type="button" id="dropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        <span class="ico ico-arrow-down-white"></span>
                            <span class="userName">BRIAN PAULSEN</span>
                            <div id="hexGrid">
                                <div class="hex">
                                    <div class="hexIn" href="#">
                                        <img src="/Images/MYLAPS-GA-9d67660a95684131bab6244c838a73d1/2" width="30" height="40">
                                    </div>
                                </div>
                            </div>
                    </button>
                    <ul class="dropdown-menu profileDropDown" aria-labelledby="dropdownProfile">
                        <li>

                            <a href="/profile?tab=my-profile-tab">MY PROFILE</a>
                        </li>
                        <li>

                            <a href="/profile?tab=my-products-tab">MY PRODUCTS</a>
                        </li>
                        <li>
                            <form action="https://speedhive.mylaps.com/Account/LogOff" method="post" id="logoutForm">
                                <input name="__RequestVerificationToken" type="hidden" value="4pALCYBzzoM2oLIqRE-NyLRNwE8vnVjvczPcbDh29L0KRAXHkNdZKjR7-gINnG6INyn1uS8v_ldlAfoNh7xUwtn9g1NgMqbY9b7qo62yUtjQYNkyBsNxj7IATjQ9ZbLQ0" />
                                <input type="submit" style="background: #282f39 none repeat scroll 0 0;border-left:2px transparent; border-color: #282f39;" value="LOGOUT" class="btn btn-primary logout" />
                            </form>
                        </li>
                    </ul>
                </li>
        </ul>
    </div><!-- top-menu -->
    <nav class="navbar nav-menu mainNav">
        <div class="">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed main-menu-open" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="ico-burger-menu"></span>
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/" class="header-logo" onclick="CallEventsWithCleardSearchTerm();">
                    <img src="/Images/images/mylaps_speedhive_logo.png" alt="MyLaps" height="50" width="432" />
                </a>
                <div class="left-arrow-div">
                    <a class="ico ico-arrow-left-gray" href="" onclick="history.go(-1); return false;"></a>
                </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav nav-tabs nav-menu-inner">
                    <li role="presentation">
                        <a href="/" id="search-result-layout">
                            <p class="nav-elem">ALL EVENT RESULTS</p>
                        </a>
                        <span class="ico ico-nav-active"></span>
                    </li>
                    <li role="presentation">
                        <a href="/Practice">
                            <p class="nav-elem">ALL PRACTICE</p>
                        </a>
                        <span class="ico ico-nav-active"></span>
                    </li>
                    <li role="presentation">
                        <a href="/profile">
                            <p class="nav-elem">MY RESULTS</p>
                        </a>
                        <span class="ico ico-nav-active"></span>
                    </li>
                    <li role="presentation">
                        <a href="/LiveTiming">
                            <p class="nav-elem" style="text-transform: uppercase;">Live Timing<span class="livetiming-beta">beta</span></p>
                        </a>
                        <span class="ico ico-nav-active"></span>
                    </li>
                    <li role="presentation" class="upMenu">
                        <a href="https://www.mylaps.com" target="_blank">MYLAPS.COM</a>
                    </li>
                    <li role="presentation" class="upMenu">
                        <a href="/app">DOWNLOAD APP</a>
                    </li>
                    <li role="presentation" class="upMenu">
                        <a href="https://speedhiveshop.mylaps.com" target="_blank">SHOP</a>
                    </li>
                    <li role="presentation" class="upMenu">
                        <a href="/x2link">X2 LINK</a>
                    </li>
                    <li id="language-change" role="presentation" class="upMenu">
                        <a class="english" href="#" data-language="en">ENGLISH</a>
                        <a class="dutch" href="#" data-language="nl">NEDERLANDS</a>
                        <a class="japan" href="#" data-language="ja">日本語</a>
                    </li>
                            <li role="presentation" class="upMenu">
                                <a class="profile-info-responsive">
                                    <div id="hexGrid">
                                        <div class="hex">
                                            <div class="hexIn" href="#">
                                                <img src="/Images/MYLAPS-GA-9d67660a95684131bab6244c838a73d1/2" width="30" height="40">
                                            </div>
                                        </div>
                                    </div>
                                    <span class="userName">BRIAN PAULSEN</span>
                                </a>
                            </li>
                        <li role="presentation" class="upMenu">

                            <a href="/profile?tab=my-profile-tab">MY PROFILE</a>
                        </li>
                        <li role="presentation" class="upMenu">
                            <form action="https://speedhive.mylaps.com/Account/LogOff" method="post" id="logoutForm">
                                <input name="__RequestVerificationToken" type="hidden" value="-vO5SN5Z50HOdkPKhhS04LKxmsVv8ZWTImiqtwYUhTY0K5LdWsEAaA84ldVFwT-snGcaK0l0k3S7Y5hosVR5GwuqViNpXxGZ5pH6hjZbeSob53gUChxAV5xcMOJU_9jY0" />
                                <input type="submit" style="color: #94979c; background: #282f39 none repeat scroll 0 0; border-left: 2px transparent; border-color: #282f39;" value="LOGOUT" class="btn btn-primary logout" />
                                </form>
                        </li>
                        <li role="presentation" class="upMenu loggedin">
                            <div class="links-container">
                                <div class="links-second-row social-link clearfix">
    <div class="row">

            <a class="social ico-facebook" href="https://www.facebook.com/mylapsspeedhive"></a>
            <a class="social ico-yahoo" href="https://www.youtube.com/channel/UCgd-KMnDXno6s_SHN_w1GxQ"></a>
    </div>

                                </div>
                            </div>
                        </li>
                </ul><!-- nav-menu-inner -->
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div><!-- header -->
        <div class="body-content" id="js_print">
            




<div id="breadcrumb" class="container">
    <div class="row">
        <div class="col-xs-12 breadcrumb-social">
            <ul class="col-lg-9 col-md-7 col-sm-7 col-xs-9 breadcrumb breadcrumb-title">
                <li class="active">
                    <a href="#" class="mobile-arrow"><img class="mobile-arrow" src="/Images/assets/ico-arrow-left-blue.png"></a>
                

        <a href="/" title="Home">Home</a>
            <img src="/Images/assets/ico-arrow-right.png" style="width: 16px; height: 16px; margin-bottom: 5px;">

    Peachstate 225 - 2017 Road Atlanta
</li>
            </ul>
            <div class="col-lg-3 col-md-5 col-sm-5 col-xs-3 social-container">
                <button type="button" class="navbar-toggle collapsed social-dropdown" data-toggle="collapse" data-target=".social-toggle"></button>
                <div class="navbar-collapse collapse social-toggle" tabindex="-1">
                    <a  class="social-button facebook-icon" href="#"><span class="ico-breadcrumb-facebook"></span><span>Facebook</span></a>
                    <a class="social-button twitter-icon" href="#"><span class="ico-breadcrumb-twitter"></span><span>Twitter</span></a>
                    <a class="social-button arrow-icon email-icon" href="#"><span class="ico-breadcrumb-email"></span><span>Email</span></a>
                    <a href="" class="sendEmail" id="sendEmail"></a>
                    <a href="" class="sendTweet hide" id="sendTweet"></a>
                     <a class="print" href="javascript:window.print()">
                        <div class="social-button print-icon"><span class="ico-breadcrumb-print"></span></div>
                        <span class="print-text">Print</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId: '573827446116530',
            xfbml: true,
            version: 'v2.5'
        });
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) { return; }
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<script>
window.twttr = (function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0],
      t = window.twttr || {};
    if (d.getElementById(id)) return t;
    js = d.createElement(s);
    js.id = id;
    js.src = "https://platform.twitter.com/widgets.js";
    fjs.parentNode.insertBefore(js, fjs);

    t._e = [];
    t.ready = function (f) {
        t._e.push(f);
    };

    return t;
}(document, "script", "twitter-wjs"));</script>
<script>
    $(document).ready(function () {
        $('.facebook-icon').on('click', function () {
            if (!$('body').hasClass('page-sessions-laptimes')) {
                FB.ui({
                    method: 'share',
                    href: window.location.href,
                }, function (response) { });
            }
        });

        function unescapeHtml(unsafe) {
            return unsafe
                .replace(/&/g, "%26")
                .replace("?", "%3F");

        }

        $('.email-icon').on('click', function () {
            var current_title = $(document).attr('title');
            var current_url = encodeURI(window.location.href);
            current_url = unescapeHtml(current_url);
            if (!$('body').hasClass('page-sessions-laptimes')) {
                var pathname = window.location.href;
                $('#sendEmail').attr('href', 'mailto:?Subject=' + current_title + '&body=' + current_title + ' ' + current_url);
                $('#sendEmail')[0].click();
            }
        });
        $('.twitter-icon').on('click', function () {
            var current_url = encodeURI(window.location.href);
            current_url = unescapeHtml(current_url);
            if (!$('body').hasClass('page-sessions-laptimes')) {
                var pathname = window.location.href;
                $('#sendTweet').attr('href', 'https://twitter.com/intent/tweet?text=' + document.title + '&url=' + current_url);
                $('#sendTweet')[0].click();
            }
        });
    });
</script><div id="js_print" class="body-content">
    <div class="container event-details">
        <div class="sticky-header-global">
            <div class="sticky-header-global-text"></div>
        </div>
        <div class="row">
            <div id="event-details-headerstop" class="col-lg-12 col-md-12 data-loading">
                <div class="event-result-header">
                    <div class="main-title-container">
                        <div class="row-event-title affix-top">
                            <h1>Peachstate 225 - 2017 Road Atlanta</h1>
                        </div>
                        <div class="row-event-information">
                            <div class="race-type">Car</div>
                            <div class="race-location"> &#64; Plano (United States)</div>
                            <div class="race-date">•&nbsp;31 March 2017</div>
                            <div class="published-by">by</div>
                            <a href="/Organizations/5427" class="user-info">PCA Club Racing</a>
                        </div>
                        <button data-target=".other-information-container" data-toggle="collapse" class="navbar-toggle collapsed other-information-toggle" type="button"><span class="ico ico-arrow-down-gray"></span></button>
                    </div>
                    <div class="navbar-collapse collapse other-information-container">
                        <a class="championshipLink" href="/Organizations/5427/Championships">
                            <div class="row-event-type">Championship</div>
                        </a>
                        <div class="race-run">
                            <div class="row-event-cycle">Runs</div>
                            <div class="row-event-runs">34</div>
                        </div>
                        <div class="race-length">
                            <div class="race-length-name">Length</div>
                            <div class="row-event-length">2.54M</div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #event-details-header -->
        </div>
        <div class="row">
            <div id="event-details-infostop" class="col-lg-12">
                <a href="/Organizations/5427/Championships">
                    <div class="row-event-type-mobile">Championship</div>
                </a>
                <div class="content-wrapper-left">


<div class="row-event">

    <div class="info-holder title-holder">
        <div class="row-session-title">
            <h3>1: Red Race Group 1</h3>
        </div>
    </div>

        <a href="/Sessions/4315724" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 1</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">07:05</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315725" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 2</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">09:05</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315726" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 3</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">10:35</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315728" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-qualify"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-qualify-grey.png" alt="" />
                </div>
                <div class="row-event-name">Qualifying</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">07:05</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315727" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice Starts/ Fun Race</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">14:00</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315729" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Sprint Race 1</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">09:50</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315730" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Sprint Race 2</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">12:50</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
</div>
<div class="row-event">

    <div class="info-holder title-holder">
        <div class="row-session-title">
            <h3>2: GT4 Black Race Group 2</h3>
        </div>
    </div>

        <a href="/Sessions/4315731" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 1</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">07:35</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315732" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 2</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">13:00</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315733" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 3</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">15:30</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315737" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Enduro Warm Up</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">02 Apr</div>
                    <div class="row-event-time">07:45</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315734" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-qualify"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-qualify-grey.png" alt="" />
                </div>
                <div class="row-event-name">Qualifying</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">07:35</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315739" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-qualify-merge"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-qualify-merge-grey.png" alt="" />
                </div>
                <div class="row-event-name">Enduro Grid</div>
                <div class="row-event-schedule">
                    <div class="row-event-date"></div>
                    <div class="row-event-time"></div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315735" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Sprint Race 1</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">09:10</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315736" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Sprint Race 2</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">13:35</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315738" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Enduro (80min)</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">02 Apr</div>
                    <div class="row-event-time">12:50</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
</div>
<div class="row-event">

    <div class="info-holder title-holder">
        <div class="row-session-title">
            <h3>3: Blue Race Group 3</h3>
        </div>
    </div>

        <a href="/Sessions/4315740" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 1</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">08:05</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315741" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 2</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">09:35</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315742" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 3</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">12:00</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315744" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-qualify"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-qualify-grey.png" alt="" />
                </div>
                <div class="row-event-name">Qualifying</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">08:05</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315743" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice Starts/ Fun Race</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">14:30</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315745" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Sprint Race 1</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">10:30</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315746" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Sprint Race 2</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">14:20</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
</div>                </div>
                <div class="content-wrapper-right">

<div class="row-event">

    <div class="info-holder title-holder">
        <div class="row-session-title">
            <h3>4: Green Race Group 4</h3>
        </div>
    </div>

        <a href="/Sessions/4315747" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 1</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">08:35</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315748" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 2</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">10:05</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315749" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice 3</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">12:30</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315751" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-qualify"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-qualify-grey.png" alt="" />
                </div>
                <div class="row-event-name">Qualifying</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">08:35</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315750" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Practice Starts/ Fun Race</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">31 Mar</div>
                    <div class="row-event-time">15:00</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315752" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Sprint Race 1</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">12:10</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315753" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Sprint Race 2</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">01 Apr</div>
                    <div class="row-event-time">15:05</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
</div>
<div class="row-event">

    <div class="info-holder title-holder">
        <div class="row-session-title">
            <h3>5: Yellow Enduro Group A</h3>
        </div>
    </div>

        <a href="/Sessions/4315754" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Enduro Warmup</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">02 Apr</div>
                    <div class="row-event-time">07:10</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315755" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Enduro (90min)</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">02 Apr</div>
                    <div class="row-event-time">11:05</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
</div>
<div class="row-event">

    <div class="info-holder title-holder">
        <div class="row-session-title">
            <h3>6: Gold Enduro Group B</h3>
        </div>
    </div>

        <a href="/Sessions/4315756" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-practice"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-practice-grey.png" alt="" />
                </div>
                <div class="row-event-name">Warm Up</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">02 Apr</div>
                    <div class="row-event-time">08:20</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
        <a href="/Sessions/4315757" class="">
            <div class="info-holder event-holder">
                <div class="row-event-type-ico">
                    <span class="ico ico-race"></span>
                    <img class="print-icon-grey" src="/Images/assets/ico-race-grey.png" alt="" />
                </div>
                <div class="row-event-name">Enduro (90min)</div>
                <div class="row-event-schedule">
                    <div class="row-event-date">02 Apr</div>
                    <div class="row-event-time">14:25</div>
                    <div class="ico-event-link"><span class="ico ico-arrow-right-gray"></span></div>
                </div>
            </div>
        </a>
</div>                </div>
            </div>
        </div>
    </div>
</div>


        </div>
        
        
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center social-link">
    <div class="row">

            <a class="social ico-facebook" href="https://www.facebook.com/mylapsspeedhive"></a>
            <a class="social ico-yahoo" href="https://www.youtube.com/channel/UCgd-KMnDXno6s_SHN_w1GxQ"></a>
    </div>

            </div>
        </div>
        <div class="row">


    <div class="col-lg-15 col-md-15 col-sm-6 col-xs-12 footer-column">
        <p>
<strong>About Speedhive</strong></p>
<p>
MYLAPS Speedhive offers you better insights into your race performance in order to help you track, compare, share and increase your progress.<br />
<a href="/en/Home/AboutUs"><span style="color:#00BED4;">Read More</span></a></p>

    </div>
    <div class="col-lg-15 col-md-15 col-sm-6 col-xs-12 footer-column">
        <p>
<strong>About MYLAPS</strong></p>
<p>
We invented automatic sports timing. Thousands of events that previously used stopwatches and thumbs to keep track of results now rely on MYLAPS technology.<br />
<a href="https://www.mylaps.com/about-us/" target="_blank"><span style="color:#00bed4;">Read more</span></a></p>

    </div>
    <div class="col-lg-15 col-md-15 col-sm-6 col-xs-12 footer-column">
        <p>
<strong>Download app </strong></p>
<p>
The MYLAPS Speedhive app gives you quick access to the official results of motorized events.<br />
<a href="/en/home/download"><span style="color:#00BED4;">Read More</span></a></p>

    </div>
    <div class="col-lg-15 col-md-15 col-sm-6 col-xs-12 footer-column">
        <p>
<strong>FAQ</strong></p>
<p>
Search through our most frequently asked questions and find an answer to your question.<br />
<a href="/en/Home/FaqPage"><span style="color:#00BED4;">Read More</span></a></p>

    </div>
    <div class="col-lg-15 col-md-15 col-sm-6 col-xs-12 footer-column">
        <p>
<strong>Links</strong></p>
<p>
<a href="/en/Home/ContactUs"><span style="color:#00BED4;">Contact Us</span></a><br />
<a href="https://speedhiveshop.mylaps.com/?lang=english" target="_blank"><span style="color:#00BED4;">MYLAPS Store</span></a><br />
<a href="https://organisation.mylaps.com/#_ga=1.24772730.1741333028.1448035948" target="_blank"><span style="color:#00BED4;">Organization login</span></a><br />
<a href="https://mylaps.us6.list-manage.com/subscribe/post?u=fdd72bdedadf9b83d2967a5c8&id=ba4c9ca923" target="_blank"><span style="color:#00BED4;">Subscribe to our newsletter </span></a><br />
<a href="https://www.mylaps.com" target="_blank"><span style="color: rgb(0, 190, 212);">MYLAPS.com</span></a><br />
<a href="http://www.mylaps.com/data/sitemanagement/media/2017%20MYLAPS%20Privacy%20Policy.pdf" target="_blank"><span style="color: rgb(0, 190, 212);">Privacy policy</span></a><br />
 </p>
<p>
<br />
 </p>
<p>
 </p>

    </div>

        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="footer-logo">
                </div>
                <div class="copyright">
                    <p>&#169; MYLAPS 2017</p>
                </div>
            </div>
        </div>
    </div>
</footer><!-- footer -->
    </div>
    <script type="text/javascript">
        var url = window.location.pathname;
        var lang = url.split('/');
    </script>
    <script src="https://speedhive.azureedge.net/bundles/scripts?1.0.0.30876"></script>
<script>(window.$)||document.write('<script src="/bundles/scripts"><\/script>');</script>

    <script src="https://speedhive.azureedge.net/bundles/smartbanner?1.0.0.30876"></script>
<script>($.smartbanner)||document.write('<script src="/bundles/smartbanner"><\/script>');</script>

    
    <script type="text/javascript">
        $(document).ready(function () {

            $('.event-details #event-details-headerstop').on('shown.bs.collapse', function () {
                $(this).parent().find("span").removeClass("ico-arrow-down-gray").addClass('ico-arrow-up-gray');
            }).on('hidden.bs.collapse', function () {
                $(this).parent().find("span").removeClass("ico-arrow-up-gray").addClass("ico-arrow-down-gray");
            });

            var windowWidth = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
            var sportValue = 'car';
            if (windowWidth > 767) {
                $('body').addClass('bgr-cover-' + sportValue + '-desktop');
            }
            else {
                $('body').addClass('bgr-cover-' + sportValue + '-mobile');
            }
            if ($('body').width() < 768) {
                $('.row-event-title').affix({
                    offset: {
                        top: $('.row-event-title').offset().top
                    }
                });
            }
        });

        function CallEventsWithCleardSearchTerm() {
            var myCookie = new MyCookie();
            myCookie.createCookie('searchTerm', "");
        }
    </script>

</body>
</html>
EOF

return $content;
}

1;
