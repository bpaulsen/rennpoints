package TestsFor::RennPoints::MyLaps::Race;
use Test::Class::Moose;
use RennPoints::MyLaps::Race;

    # methods that begin with test_ are test methods.
sub test_parse_races {
    my $test = shift;

    isa_ok my $race = RennPoints::MyLaps::Race->new( content => getContent(), id => 0 ), 'RennPoints::MyLaps::Race';

    is @{$race->participants}, 48, "Testing number of participants that were parsed";
}

sub test_url {
    my $test = shift;

    isa_ok my $race = RennPoints::MyLaps::Race->new( content => getContent(), id => 0 ), 'RennPoints::MyLaps::Race';
    ok $race->url, 'test that URL is not null';
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
<title>RACE Sprint Race 1, Peachstate 225 - 2017 Road Atlanta, PCA Club Racing, United States - Official Event Results, MYLAPS Speedhive</title>
<meta property="og:title" content="RACE Sprint Race 1, Peachstate 225 - 2017 Road Atlanta, PCA Club Racing, United States - Official Event Results, MYLAPS Speedhive" />
<meta name="description" content="Explore official results, positions, times, best laps, lapcharts, comparison and more data, Peachstate 225 - 2017 Road Atlanta, race event 31 March 2017 12:00">
<meta name="og:description" content="Explore official results, positions, times, best laps, lapcharts, comparison and more data, Peachstate 225 - 2017 Road Atlanta, race event 31 March 2017 12:00">
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
    
    <link href="https://speedhive.azureedge.net/Content/css?1.0.0.32212" rel="stylesheet"/>
<script>(function() {
                var loadFallback,
                    len = document.styleSheets.length;
                for (var i = 0; i < len; i++) {
                    var sheet = document.styleSheets[i];
                    if (sheet.href.indexOf('https://speedhive.azureedge.net/Content/css?1.0.0.32212') !== -1) {
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
                                link.href = '/Content/css?1.0.0.32212';
                                head.appendChild(link);
                                return true;
                            } else {
                                document.write('<link href="/Content/css?1.0.0.32212" rel="stylesheet" type="text/css" />');
                            }
                        }
                    }
                }
                return true;
            }())||document.write('<script src="/Content/css"><\/script>');</script>

    
    <link href="https://speedhive.azureedge.net/Content/session?1.0.0.32212" rel="stylesheet"/>
<script>(function() {
                var loadFallback,
                    len = document.styleSheets.length;
                for (var i = 0; i < len; i++) {
                    var sheet = document.styleSheets[i];
                    if (sheet.href.indexOf('https://speedhive.azureedge.net/Content/session?1.0.0.32212') !== -1) {
                        var meta = document.createElement('meta');
                        meta.className = 'lapChart lapchart-header';
                        document.head.appendChild(meta);
                        var value = window.getComputedStyle(meta).getPropertyValue('height');
                        document.head.removeChild(meta);
                        if (value !== '50px') {
                            if(document.readyState === 'complete') {
                                var head  = document.getElementsByTagName('head')[0];
                                var link  = document.createElement('link');
                                link.rel  = 'stylesheet';
                                link.type = 'text/css';
                                link.href = '/Content/session?1.0.0.32212';
                                head.appendChild(link);
                                return true;
                            } else {
                                document.write('<link href="/Content/session?1.0.0.32212" rel="stylesheet" type="text/css" />');
                            }
                        }
                    }
                }
                return true;
            }())||document.write('<script src="/Content/session"><\/script>');</script>


    <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet'>
</head>
<body class="page-sessions page-sessions-details">
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
                                <input name="__RequestVerificationToken" type="hidden" value="2xbzO22ymwdAP5ostwBob21lSg51fqo7KEB7CMLR8Y3cf0ztcLdB9Q79CtnB_bt8KqmQjiKQsm9xJu8Hsr1kv6p9wwFTr46_kbpq8E7n5R6vziRXKIx1wwSFTr_TEWpn0" />
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
                                <input name="__RequestVerificationToken" type="hidden" value="PPHZy9NUF8-cN7YvRmMqESBkAUHmTyVvuu_sFw0IVrjFyaNnLbfEBzzslIYltU_5rOex1fUbnyFAM44LwP2NP7dqTpT-ytDnCd1fL1LF_AaBcrYpdeKqx7l46Ue7xuuj0" />
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

        <a href="/Events/1374510" title="Peachstate 225 - 2017 Road Atlanta">Peachstate 225 - 2017 Road Atlanta</a>
            <img src="/Images/assets/ico-arrow-right.png" style="width: 16px; height: 16px; margin-bottom: 5px;">

    4: Green Race Group 4 - Sprint Race 1
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
</script>
<div class="container">
    <div class="sticky-header-global">
        <div class="sticky-header-global-text"></div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div id="downloadcsv"><a href="/Sessions/4315752/Export" class="csv">Download CSV</a></div>
            <div id="session-header" class="session-details-header clearfix">
                <div class="session-details-title-container" style="/*visibility: hidden*/">
                    <div class="session-details-title dropdown dropdown-session-details">
                        <div class="left-arrow-divv"><a class="ico ico-arrow-left-gray" href=""></a></div>
                        <h1 id="leftLabel" data-toggle="dropdown" class="dropdown-toggle">Sprint Race 1<span class="ico ico-arrow-down-gray"></span></h1>
                        <ul class="dropdown-menu dropdown-left" aria-labelledby="leftLabel">
                            <li><span class="popup-title">4: Green Race Group 4</span></li>
                                <li>
                                    <a class="clearfix " href="/Sessions/4315747" data-sessionid="4315747">
                                        <span class="pull-left ">
                                            <span class="ico ico-practice"></span>
                                            <span class="sprint-type">Practice 1</span>
                                        </span>
                                        <span class="pull-right">
                                            <span class="sprint-time">31 Mar 08:35</span>
                                            <span class="ico ico-arrow-right-gray"></span>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a class="clearfix " href="/Sessions/4315748" data-sessionid="4315748">
                                        <span class="pull-left ">
                                            <span class="ico ico-practice"></span>
                                            <span class="sprint-type">Practice 2</span>
                                        </span>
                                        <span class="pull-right">
                                            <span class="sprint-time">31 Mar 10:05</span>
                                            <span class="ico ico-arrow-right-gray"></span>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a class="clearfix " href="/Sessions/4315749" data-sessionid="4315749">
                                        <span class="pull-left ">
                                            <span class="ico ico-practice"></span>
                                            <span class="sprint-type">Practice 3</span>
                                        </span>
                                        <span class="pull-right">
                                            <span class="sprint-time">31 Mar 12:30</span>
                                            <span class="ico ico-arrow-right-gray"></span>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a class="clearfix " href="/Sessions/4315751" data-sessionid="4315751">
                                        <span class="pull-left ">
                                            <span class="ico ico-qualify"></span>
                                            <span class="sprint-type">Qualifying</span>
                                        </span>
                                        <span class="pull-right">
                                            <span class="sprint-time">01 Apr 08:35</span>
                                            <span class="ico ico-arrow-right-gray"></span>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a class="clearfix " href="/Sessions/4315750" data-sessionid="4315750">
                                        <span class="pull-left ">
                                            <span class="ico ico-race"></span>
                                            <span class="sprint-type">Practice Starts/ Fun Race</span>
                                        </span>
                                        <span class="pull-right">
                                            <span class="sprint-time">31 Mar 15:00</span>
                                            <span class="ico ico-arrow-right-gray"></span>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a class="clearfix border-active" href="/Sessions/4315752" data-sessionid="4315752">
                                        <span class="pull-left ">
                                            <span class="ico ico-race"></span>
                                            <span class="sprint-type">Sprint Race 1</span>
                                        </span>
                                        <span class="pull-right">
                                            <span class="sprint-time">01 Apr 12:10</span>
                                            <span class="ico ico-arrow-right-gray"></span>
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a class="clearfix " href="/Sessions/4315753" data-sessionid="4315753">
                                        <span class="pull-left ">
                                            <span class="ico ico-race"></span>
                                            <span class="sprint-type">Sprint Race 2</span>
                                        </span>
                                        <span class="pull-right">
                                            <span class="sprint-time">01 Apr 15:05</span>
                                            <span class="ico ico-arrow-right-gray"></span>
                                        </span>
                                    </a>
                                </li>
                        </ul>
                    </div><!-- .session-details-title -->
                    <div class="session-details-subtitles clearfix">
                        <div class="session-details-subtitles-left">
                            <a class="second-dropdown ico ico-arrow-down-gray" href="#"></a>
                            <span>
                                <span class="info-race-name toggle-on-small hide-it">Car </span>
                                <span class="info-at toggle-on-small hide-it">&#64;</span>
                                <span class="info-location toggle-on-small hide-it">Road Atlanta</span>
                                <span class="info-country toggle-on-small hide-it"> (United States)</span>
                                <span class="info-race-dot toggle-on-small hide-it"> • </span>
                                <span class="info-date">31 March 2017</span>
                                <span class="by-term toggle-on-small hide-it">by</span>
                            </span>&nbsp;
                            <a class="session-details-link toggle-on-small hide-it" href="/Organizations/5427">PCA Club Racing</a>
                        </div><!-- .session-details-subtitles-left -->
                        <div class="session-details-subtitles-right">
                            <div class="subtitles-first-row clearfix">
                                <span class="session-length">Length</span>
                                <span class="session-bestlap">Best lap</span>
                                <span class="session-speed">Best Speed</span>
                                <span class="session-sort">By Competitor</span>
                            </div>
                            <div class="subtitles-second-row clearfix">
                                <span class="session-length">2.5400 M</span>
                                    <span class="session-bestlap">5 (01:26.412)</span>
                                    <span class="session-speed">105.819 M/h</span>
                                    <span class="session-sort">CHRIS BROWN</span>
                            </div>
                        </div> <!-- session-details-subtitles-right -->
                    </div>

                </div> <!-- .session-details-title-container -->
            </div> <!-- #session-header -->
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <ul id="session-options" class="session-options-tabs clearfix" role="tablist">
                <li role="presentation" class="active">
                    <a href="#all-results" aria-controls="all-results" class="event-tab allresults-tab" role="tab" data-toggle="tab">All Results</a>
                </li>
                <li role="presentation">
                    <a href="#byClass" aria-controls="byClass" class="event-tab  byclass-tab" role="tab" data-toggle="tab"><span class="hidden-xs">Results By Class</span><span class="visible-xs-block">By Class</span></a>
                </li>
                <li role="presentation">
                    <a href="#lapChart" aria-controls="lapChart" class="event-tab lapchartTab" role="tab" data-toggle="tab">Lap Chart</a>
                </li>
                <li role="presentation">
                    <a href="#compare" aria-controls="compare" class="event-tab compare-tab" role="tab" data-toggle="tab">Compare</a>
                </li>
                <li class="select-competitor-tab" style="display: none;">
                    <a class="event-tab" data-target="#selectCompetitors" data-toggle="modal" href="#"> Select competitors </a>
                    <span class="ico ico-arrow-down-blue"></span>
                </li>

            </ul><!-- sport-options -->
        </div>
    </div>
    <div class="tab-content" id="tab-content">

        


<div class="row session-details-all-results tab-pane active" id="all-results" role="tabpanel">
    <div class="col-xs-12">
        <div class="scrollable">
            <div class="event-results-header">
                    <div class="row-event row-event-race">
                        <div class="row-event-position">Pos</div>
                        <div class="row-event-racenumber">
                            <div>&nbsp;</div>
                        </div>
                        <div class="row-event-racenumber"><div>&nbsp;</div></div>
                        <div class="row-event-competitor">Competitor</div>
                                <div class="row-event-totaltime">Total time</div>
                        <div class="row-event-diff">Diff</div>
                        <div class="row-event-laps">Laps</div>
                        <div class="row-event-besttime">Best time</div>
                        <div class="row-event-bestlap">Best lap</div>
                        <div class="row-event-topspeed">Best Speed</div>
                    </div>
            </div>
            <div id="session-results" class="data-loading session-detail-results">
                <div class="loading" style="display: none;"></div>
                            <a class="row-event winner-row " href="/Sessions/4315752/LapTimes?pos=1" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">1</span>

            </div>
            <div class="row-event-racenumber">871</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=1">
                        
                        <span>CHRIS BROWN</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:15.947</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:26.412</div>
            <div class="row-event-bestlap">5</div>
            <div class="row-event-topspeed">105.819 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=2" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">2</span>

            </div>
            <div class="row-event-racenumber">07</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=2">
                        
                        <span>SETH DAVIDOW</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:21.506</div>
                    <div class="row-event-diff">5.559</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:27.772</div>
            <div class="row-event-bestlap">15</div>
            <div class="row-event-topspeed">104.179 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=3" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">3</span>

            </div>
            <div class="row-event-racenumber">009</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=3">
                        
                        <span>SCOTT DAIGER</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:34.838</div>
                    <div class="row-event-diff">18.891</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:28.572</div>
            <div class="row-event-bestlap">5</div>
            <div class="row-event-topspeed">103.238 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=4" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">4</span>

            </div>
            <div class="row-event-racenumber">701</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=4">
                        
                        <span>JEAN AUDET</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:35.644</div>
                    <div class="row-event-diff">19.697</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:28.892</div>
            <div class="row-event-bestlap">2</div>
            <div class="row-event-topspeed">102.866 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=5" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">5</span>

            </div>
            <div class="row-event-racenumber">108</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=5">
                        
                        <span>LOREN BEGGS</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:36.704</div>
                    <div class="row-event-diff">20.757</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:27.512</div>
            <div class="row-event-bestlap">15</div>
            <div class="row-event-topspeed">104.489 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=6" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">6</span>

            </div>
            <div class="row-event-racenumber">423</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=6">
                        
                        <span>JUSTIN JACKSON</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:40.957</div>
                    <div class="row-event-diff">25.010</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:27.701</div>
            <div class="row-event-bestlap">6</div>
            <div class="row-event-topspeed">104.263 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=7" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">7</span>

            </div>
            <div class="row-event-racenumber">02</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=7">
                        
                        <span>RAFAEL LLOPIZ</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:41.729</div>
                    <div class="row-event-diff">25.782</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:28.001</div>
            <div class="row-event-bestlap">7</div>
            <div class="row-event-topspeed">103.908 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=8" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">8</span>

            </div>
            <div class="row-event-racenumber">14</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=8">
                        
                        <span>ANTHONY LLOPIZ</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:49.306</div>
                    <div class="row-event-diff">33.359</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:29.023</div>
            <div class="row-event-bestlap">6</div>
            <div class="row-event-topspeed">102.715 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=9" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">9</span>

            </div>
            <div class="row-event-racenumber">118</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=9">
                        
                        <span>JOHN GOETZ</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:56.132</div>
                    <div class="row-event-diff">40.185</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:28.257</div>
            <div class="row-event-bestlap">7</div>
            <div class="row-event-topspeed">103.607 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=10" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">10</span>

            </div>
            <div class="row-event-racenumber">722</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=10">
                        
                        <span>PHILLIP MARTIEN</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:57.057</div>
                    <div class="row-event-diff">41.110</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:29.496</div>
            <div class="row-event-bestlap">10</div>
            <div class="row-event-topspeed">102.172 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=11" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">11</span>

            </div>
            <div class="row-event-racenumber">361</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=11">
                        
                        <span>ERIC MIES</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:57.516</div>
                    <div class="row-event-diff">41.569</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:30.101</div>
            <div class="row-event-bestlap">10</div>
            <div class="row-event-topspeed">101.486 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=12" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">12</span>

            </div>
            <div class="row-event-racenumber">036</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=12">
                        
                        <span>JASON KRIKORIAN</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:00.360</div>
                    <div class="row-event-diff">44.413</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:30.228</div>
            <div class="row-event-bestlap">6</div>
            <div class="row-event-topspeed">101.343 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=13" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">13</span>

            </div>
            <div class="row-event-racenumber">271</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=13">
                        
                        <span>ROBERT WISEN</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:06.277</div>
                    <div class="row-event-diff">50.330</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:30.547</div>
            <div class="row-event-bestlap">2</div>
            <div class="row-event-topspeed">100.986 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=14" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">14</span>

            </div>
            <div class="row-event-racenumber">93</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=14">
                        
                        <span>DAVE ELSNER</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:09.929</div>
                    <div class="row-event-diff">53.982</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:30.750</div>
            <div class="row-event-bestlap">2</div>
            <div class="row-event-topspeed">100.76 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=15" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">15</span>

            </div>
            <div class="row-event-racenumber">99</div>
                    <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=15">
                        
                        <span>STEVE DIMAKOS</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:13.764</div>
                    <div class="row-event-diff">57.817</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:28.081</div>
            <div class="row-event-bestlap">9</div>
            <div class="row-event-topspeed">103.814 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=16" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">16</span>

            </div>
            <div class="row-event-racenumber">178</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=16">
                        
                        <span>RANDALL JOE</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:19.771</div>
                    <div class="row-event-diff">1:03.824</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:31.082</div>
            <div class="row-event-bestlap">3</div>
            <div class="row-event-topspeed">100.393 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=17" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">17</span>

            </div>
            <div class="row-event-racenumber">999</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=17">
                        
                        <span>RICK STAFFORD</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:20.513</div>
                    <div class="row-event-diff">1:04.566</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:31.300</div>
            <div class="row-event-bestlap">6</div>
            <div class="row-event-topspeed">100.153 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=18" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">18</span>

            </div>
            <div class="row-event-racenumber">96</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=18">
                        
                        <span>CARL TALLARDY</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:20.752</div>
                    <div class="row-event-diff">1:04.805</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:31.032</div>
            <div class="row-event-bestlap">13</div>
            <div class="row-event-topspeed">100.448 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=19" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">19</span>

            </div>
            <div class="row-event-racenumber">08</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=19">
                        
                        <span>JOE STILL</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:31.368</div>
                    <div class="row-event-diff">1:15.421</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:31.846</div>
            <div class="row-event-bestlap">13</div>
            <div class="row-event-topspeed">99.558 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=20" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">20</span>

            </div>
            <div class="row-event-racenumber">44</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=20">
                        
                        <span>MIKE McMENAMIN</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:38.170</div>
                    <div class="row-event-diff">1:22.223</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:32.820</div>
            <div class="row-event-bestlap">10</div>
            <div class="row-event-topspeed">98.513 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=21" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">21</span>

            </div>
            <div class="row-event-racenumber">496</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=21">
                        
                        <span>LES LONG</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:44.189</div>
                    <div class="row-event-diff">1:28.242</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:31.633</div>
            <div class="row-event-bestlap">5</div>
            <div class="row-event-topspeed">99.789 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=22" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">22</span>

            </div>
            <div class="row-event-racenumber">3</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=22">
                        
                        <span>KEN LABORDE</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:47.646</div>
                    <div class="row-event-diff">1:31.699</div>
            <div class="row-event-laps">15</div>
                <div class="row-event-besttime">1:32.915</div>
            <div class="row-event-bestlap">6</div>
            <div class="row-event-topspeed">98.413 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=23" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">23</span>

            </div>
            <div class="row-event-racenumber">022</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=23">
                        
                        <span>ROB PURVIANCE</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:20.913</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:33.810</div>
            <div class="row-event-bestlap">8</div>
            <div class="row-event-topspeed">97.474 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=24" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">24</span>

            </div>
            <div class="row-event-racenumber">259</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=24">
                        
                        <span>DWIGHT KELLY</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:23.154</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:33.061</div>
            <div class="row-event-bestlap">8</div>
            <div class="row-event-topspeed">98.258 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=25" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">25</span>

            </div>
            <div class="row-event-racenumber">56</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=25">
                        
                        <span>LARRY HEBENSTREIT</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:51.393</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:35.252</div>
            <div class="row-event-bestlap">4</div>
            <div class="row-event-topspeed">95.998 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=26" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">26</span>

            </div>
            <div class="row-event-racenumber">680</div>
                    <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=26">
                        
                        <span>ANDREW JOHNSON</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:51.691</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:33.149</div>
            <div class="row-event-bestlap">6</div>
            <div class="row-event-topspeed">98.165 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=27" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">27</span>

            </div>
            <div class="row-event-racenumber">902</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=27">
                        
                        <span>JACK GILSDORF</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:52.886</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:34.334</div>
            <div class="row-event-bestlap">4</div>
            <div class="row-event-topspeed">96.932 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=28" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">28</span>

            </div>
            <div class="row-event-racenumber">823</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=28">
                        
                        <span>BRIAN ANDERSON</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:54.466</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:34.963</div>
            <div class="row-event-bestlap">3</div>
            <div class="row-event-topspeed">96.29 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=29" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">29</span>

            </div>
            <div class="row-event-racenumber">45</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=29">
                        
                        <span>JAMES STANISLAW</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:56.031</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:35.111</div>
            <div class="row-event-bestlap">6</div>
            <div class="row-event-topspeed">96.14 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=30" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">30</span>

            </div>
            <div class="row-event-racenumber">110</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=30">
                        
                        <span>MIKE COURTNEY</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">22:56.738</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:34.814</div>
            <div class="row-event-bestlap">7</div>
            <div class="row-event-topspeed">96.441 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=31" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">31</span>

            </div>
            <div class="row-event-racenumber">836</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=31">
                        
                        <span>KENNETH GREENBERG</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:01.289</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:34.820</div>
            <div class="row-event-bestlap">6</div>
            <div class="row-event-topspeed">96.435 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=32" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">32</span>

            </div>
            <div class="row-event-racenumber">116</div>
                    <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=32">
                        
                        <span>GEORGE TSANTES</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:05.713</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:36.482</div>
            <div class="row-event-bestlap">7</div>
            <div class="row-event-topspeed">94.774 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=33" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">33</span>

            </div>
            <div class="row-event-racenumber">324</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=33">
                        
                        <span>ANTON DIAS PERERA</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:19.008</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:36.698</div>
            <div class="row-event-bestlap">7</div>
            <div class="row-event-topspeed">94.562 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=34" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">34</span>

            </div>
            <div class="row-event-racenumber">540</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=34">
                        
                        <span>JOHN GRALTON</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:20.474</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:37.045</div>
            <div class="row-event-bestlap">4</div>
            <div class="row-event-topspeed">94.224 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=35" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">35</span>

            </div>
            <div class="row-event-racenumber">12</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=35">
                        
                        <span>PRICE FORD</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:29.547</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:38.163</div>
            <div class="row-event-bestlap">4</div>
            <div class="row-event-topspeed">93.151 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=36" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">36</span>

            </div>
            <div class="row-event-racenumber">931</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=36">
                        
                        <span>BOB HAHNEMANN</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:58.812</div>
                <div class="row-event-diff">1 lap</div>
            <div class="row-event-laps">14</div>
                <div class="row-event-besttime">1:38.976</div>
            <div class="row-event-bestlap">12</div>
            <div class="row-event-topspeed">92.386 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=37" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">37</span>

            </div>
            <div class="row-event-racenumber">234</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=37">
                        
                        <span>MARK REED</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:10.937</div>
                <div class="row-event-diff">2 laps</div>
            <div class="row-event-laps">13</div>
                <div class="row-event-besttime">1:42.086</div>
            <div class="row-event-bestlap">10</div>
            <div class="row-event-topspeed">89.572 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=38" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2">38</span>

            </div>
            <div class="row-event-racenumber">918</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=38">
                        
                        <span>JACK McCARTHY</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">23:22.618</div>
                <div class="row-event-diff">6 laps</div>
            <div class="row-event-laps">9</div>
                <div class="row-event-besttime">1:28.510</div>
            <div class="row-event-bestlap">2</div>
            <div class="row-event-topspeed">103.31 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=39" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2" class="dnf-position">DNF</span>

            </div>
            <div class="row-event-racenumber">64</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=39">
                        
                        <span>DWAYNE MOSES</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">21:35.621</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">13</div>
                <div class="row-event-besttime">1:34.065</div>
            <div class="row-event-bestlap">6</div>
            <div class="row-event-topspeed">97.209 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=40" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2" class="dnf-position">DNF</span>

            </div>
            <div class="row-event-racenumber">133</div>
                    <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=40">
                        
                        <span>MICHAEL BELER</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">20:08.484</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">12</div>
                <div class="row-event-besttime">1:35.394</div>
            <div class="row-event-bestlap">3</div>
            <div class="row-event-topspeed">95.855 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=41" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2" class="dnf-position">DNF</span>

            </div>
            <div class="row-event-racenumber">117</div>
                    <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=41">
                        
                        <span>GARY JENSEN</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">21:29.793</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">12</div>
                <div class="row-event-besttime">1:28.879</div>
            <div class="row-event-bestlap">5</div>
            <div class="row-event-topspeed">102.881 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=42" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2" class="dnf-position">DNF</span>

            </div>
            <div class="row-event-racenumber">92</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=42">
                        
                        <span>JERRY GREENE</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">14:30.717</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">9</div>
                <div class="row-event-besttime">1:31.318</div>
            <div class="row-event-bestlap">7</div>
            <div class="row-event-topspeed">100.134 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=43" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2" class="dnf-position">DNF</span>

            </div>
            <div class="row-event-racenumber">21</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=43">
                        
                        <span>GRADY WILLINGHAM</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">12:31.146</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">8</div>
                <div class="row-event-besttime">1:29.153</div>
            <div class="row-event-bestlap">4</div>
            <div class="row-event-topspeed">102.565 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=44" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2" class="dnf-position">DNF</span>

            </div>
            <div class="row-event-racenumber">03</div>
                    <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=44">
                        
                        <span>DAVID HERRINGTON</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">12:58.088</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">8</div>
                <div class="row-event-besttime">1:33.453</div>
            <div class="row-event-bestlap">6</div>
            <div class="row-event-topspeed">97.846 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=45" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2" class="dnf-position">DNF</span>

            </div>
            <div class="row-event-racenumber">91</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=45">
                        
                        <span>JOSEPH LOMBARDO</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">9:24.237</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">6</div>
                <div class="row-event-besttime">1:29.228</div>
            <div class="row-event-bestlap">4</div>
            <div class="row-event-topspeed">102.479 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=46" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2" class="dnf-position">DNF</span>

            </div>
            <div class="row-event-racenumber">194</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=46">
                        
                        <span>DAVID EDWARDS</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">4:13.424</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">2</div>
                <div class="row-event-besttime">1:38.902</div>
            <div class="row-event-bestlap">1</div>
            <div class="row-event-topspeed">92.455 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=47" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2" class="dnf-position">DNF</span>

            </div>
            <div class="row-event-racenumber">17</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=47">
                        
                        <span>ANDREW GUCCIARDI</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">4:28.898</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">2</div>
                <div class="row-event-besttime">1:36.506</div>
            <div class="row-event-bestlap">1</div>
            <div class="row-event-topspeed">94.751 M/h</div>


                            </a>
                            <a class="row-event   " href="/Sessions/4315752/LapTimes?pos=48" title="View Laptimes">
                                
            <div class="row-event-position">
                                <span data-position="2" class="dnf-position">DNF</span>

            </div>
            <div class="row-event-racenumber">901</div>
                        <div class="row-event-racenumber row-event-racenumber-2"></div>
            <div class="row-event-competitor">
                    <span class="competitorName " href="/Sessions/4315752/LapTimes?pos=48">
                        
                        <span>PHIL GILSDORF</span>
                    </span>
            </div>
                    <div class="row-event-totaltime">2:54.809</div>
                    <div class="row-event-diff">0.000</div>
            <div class="row-event-laps">1</div>
                <div class="row-event-besttime">0.000</div>
            <div class="row-event-bestlap">-</div>
            <div class="row-event-topspeed">-</div>


                            </a>
            </div><!-- session-detail-results -->
        </div>
    </div>
</div>


        
<div role="tabpanel" class="row session-details-all-results tab-pane" id="byClass">
    <div class="col-xs-12">
        <div class="scrollable" style="overflow: hidden;" tabindex="5000">
            <div class="data-loading session-detail-results" id="session-results">
                        <div class="row-event row-event-classname-wrapper">
                            <div class="row-event-classname">
                                <h2>GTC6</h2>
                            </div>
                        </div>
                        <div class="event-results-header">
                            <div class="row-event row-event-race">
                                <div class="row-event-position">Pos</div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-competitor">Competitor</div>
                                        <div class="row-event-totaltime">Total time</div>
                                <div class="row-event-diff">Diff</div>
                                <div class="row-event-laps">Laps</div>
                                <div class="row-event-besttime">Best time</div>
                                <div class="row-event-bestlap">Best lap</div>
                                <div class="row-event-topspeed">Best Speed</div>
                            </div>
                        </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">1</span>

                                        </div>
                                        <div class="row-event-racenumber">871</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=1">
                                                    
                                                    <span>CHRIS BROWN</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:15.947</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:26.412</div>
                                            <div class="row-event-bestlap">5</div>
                                        <div class="row-event-topspeed">105.819 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">2</span>

                                        </div>
                                        <div class="row-event-racenumber">07</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=2">
                                                    
                                                    <span>SETH DAVIDOW</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:21.506</div>
                                                                                        <div class="row-event-diff">5.559</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:27.772</div>
                                            <div class="row-event-bestlap">15</div>
                                        <div class="row-event-topspeed">104.179 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">3</span>

                                        </div>
                                        <div class="row-event-racenumber">108</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=5">
                                                    
                                                    <span>LOREN BEGGS</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:36.704</div>
                                                                                        <div class="row-event-diff">20.757</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:27.512</div>
                                            <div class="row-event-bestlap">15</div>
                                        <div class="row-event-topspeed">104.489 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">4</span>

                                        </div>
                                        <div class="row-event-racenumber">02</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=7">
                                                    
                                                    <span>RAFAEL LLOPIZ</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:41.729</div>
                                                                                        <div class="row-event-diff">25.782</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:28.001</div>
                                            <div class="row-event-bestlap">7</div>
                                        <div class="row-event-topspeed">103.908 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">5</span>

                                        </div>
                                        <div class="row-event-racenumber">118</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=9">
                                                    
                                                    <span>JOHN GOETZ</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:56.132</div>
                                                                                        <div class="row-event-diff">40.185</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:28.257</div>
                                            <div class="row-event-bestlap">7</div>
                                        <div class="row-event-topspeed">103.607 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">6</span>

                                        </div>
                                        <div class="row-event-racenumber">93</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=14">
                                                    
                                                    <span>DAVE ELSNER</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:09.929</div>
                                                                                        <div class="row-event-diff">53.982</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:30.750</div>
                                            <div class="row-event-bestlap">2</div>
                                        <div class="row-event-topspeed">100.76 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">7</span>

                                        </div>
                                        <div class="row-event-racenumber">99</div>
                                                <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=15">
                                                    
                                                    <span>STEVE DIMAKOS</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:13.764</div>
                                                                                        <div class="row-event-diff">57.817</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:28.081</div>
                                            <div class="row-event-bestlap">9</div>
                                        <div class="row-event-topspeed">103.814 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">8</span>

                                        </div>
                                        <div class="row-event-racenumber">680</div>
                                                <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=26">
                                                    
                                                    <span>ANDREW JOHNSON</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:51.691</div>
                                                                                    <div class="row-event-diff">1 lap</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:33.149</div>
                                            <div class="row-event-bestlap">6</div>
                                        <div class="row-event-topspeed">98.165 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">9</span>

                                        </div>
                                        <div class="row-event-racenumber">918</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=38">
                                                    
                                                    <span>JACK McCARTHY</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:22.618</div>
                                                                                    <div class="row-event-diff">6 laps</div>
                                                                                    <div class="row-event-laps">9</div>
                                        <div class="row-event-besttime">1:28.510</div>
                                            <div class="row-event-bestlap">2</div>
                                        <div class="row-event-topspeed">103.31 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1" class="dnf-position">DNF</span>

                                        </div>
                                        <div class="row-event-racenumber">117</div>
                                                <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=41">
                                                    
                                                    <span>GARY JENSEN</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">21:29.793</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">12</div>
                                        <div class="row-event-besttime">1:28.879</div>
                                            <div class="row-event-bestlap">5</div>
                                        <div class="row-event-topspeed">102.881 M/h</div>
                                    </div>
                        <div class="row-event row-event-classname-wrapper">
                            <div class="row-event-classname">
                                <h2>GTA3</h2>
                            </div>
                        </div>
                        <div class="event-results-header">
                            <div class="row-event row-event-race">
                                <div class="row-event-position">Pos</div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-competitor">Competitor</div>
                                        <div class="row-event-totaltime">Total time</div>
                                <div class="row-event-diff">Diff</div>
                                <div class="row-event-laps">Laps</div>
                                <div class="row-event-besttime">Best time</div>
                                <div class="row-event-bestlap">Best lap</div>
                                <div class="row-event-topspeed">Best Speed</div>
                            </div>
                        </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">1</span>

                                        </div>
                                        <div class="row-event-racenumber">009</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=3">
                                                    
                                                    <span>SCOTT DAIGER</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:34.838</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:28.572</div>
                                            <div class="row-event-bestlap">5</div>
                                        <div class="row-event-topspeed">103.238 M/h</div>
                                    </div>
                        <div class="row-event row-event-classname-wrapper">
                            <div class="row-event-classname">
                                <h2>GTA2</h2>
                            </div>
                        </div>
                        <div class="event-results-header">
                            <div class="row-event row-event-race">
                                <div class="row-event-position">Pos</div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-competitor">Competitor</div>
                                        <div class="row-event-totaltime">Total time</div>
                                <div class="row-event-diff">Diff</div>
                                <div class="row-event-laps">Laps</div>
                                <div class="row-event-besttime">Best time</div>
                                <div class="row-event-bestlap">Best lap</div>
                                <div class="row-event-topspeed">Best Speed</div>
                            </div>
                        </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">1</span>

                                        </div>
                                        <div class="row-event-racenumber">701</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=4">
                                                    
                                                    <span>JEAN AUDET</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:35.644</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:28.892</div>
                                            <div class="row-event-bestlap">2</div>
                                        <div class="row-event-topspeed">102.866 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">2</span>

                                        </div>
                                        <div class="row-event-racenumber">271</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=13">
                                                    
                                                    <span>ROBERT WISEN</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:06.277</div>
                                                                                        <div class="row-event-diff">30.633</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:30.547</div>
                                            <div class="row-event-bestlap">2</div>
                                        <div class="row-event-topspeed">100.986 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">3</span>

                                        </div>
                                        <div class="row-event-racenumber">496</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=21">
                                                    
                                                    <span>LES LONG</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:44.189</div>
                                                                                        <div class="row-event-diff">1:08.545</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:31.633</div>
                                            <div class="row-event-bestlap">5</div>
                                        <div class="row-event-topspeed">99.789 M/h</div>
                                    </div>
                        <div class="row-event row-event-classname-wrapper">
                            <div class="row-event-classname">
                                <h2>GTA1</h2>
                            </div>
                        </div>
                        <div class="event-results-header">
                            <div class="row-event row-event-race">
                                <div class="row-event-position">Pos</div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-competitor">Competitor</div>
                                        <div class="row-event-totaltime">Total time</div>
                                <div class="row-event-diff">Diff</div>
                                <div class="row-event-laps">Laps</div>
                                <div class="row-event-besttime">Best time</div>
                                <div class="row-event-bestlap">Best lap</div>
                                <div class="row-event-topspeed">Best Speed</div>
                            </div>
                        </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">1</span>

                                        </div>
                                        <div class="row-event-racenumber">423</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=6">
                                                    
                                                    <span>JUSTIN JACKSON</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:40.957</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:27.701</div>
                                            <div class="row-event-bestlap">6</div>
                                        <div class="row-event-topspeed">104.263 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">2</span>

                                        </div>
                                        <div class="row-event-racenumber">259</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=24">
                                                    
                                                    <span>DWIGHT KELLY</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:23.154</div>
                                                                                    <div class="row-event-diff">1 lap</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:33.061</div>
                                            <div class="row-event-bestlap">8</div>
                                        <div class="row-event-topspeed">98.258 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">3</span>

                                        </div>
                                        <div class="row-event-racenumber">823</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=28">
                                                    
                                                    <span>BRIAN ANDERSON</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:54.466</div>
                                                                                    <div class="row-event-diff">1 lap</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:34.963</div>
                                            <div class="row-event-bestlap">3</div>
                                        <div class="row-event-topspeed">96.29 M/h</div>
                                    </div>
                        <div class="row-event row-event-classname-wrapper">
                            <div class="row-event-classname">
                                <h2>GTC4</h2>
                            </div>
                        </div>
                        <div class="event-results-header">
                            <div class="row-event row-event-race">
                                <div class="row-event-position">Pos</div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-competitor">Competitor</div>
                                        <div class="row-event-totaltime">Total time</div>
                                <div class="row-event-diff">Diff</div>
                                <div class="row-event-laps">Laps</div>
                                <div class="row-event-besttime">Best time</div>
                                <div class="row-event-bestlap">Best lap</div>
                                <div class="row-event-topspeed">Best Speed</div>
                            </div>
                        </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">1</span>

                                        </div>
                                        <div class="row-event-racenumber">14</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=8">
                                                    
                                                    <span>ANTHONY LLOPIZ</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:49.306</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:29.023</div>
                                            <div class="row-event-bestlap">6</div>
                                        <div class="row-event-topspeed">102.715 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">2</span>

                                        </div>
                                        <div class="row-event-racenumber">361</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=11">
                                                    
                                                    <span>ERIC MIES</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:57.516</div>
                                                                                        <div class="row-event-diff">8.210</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:30.101</div>
                                            <div class="row-event-bestlap">10</div>
                                        <div class="row-event-topspeed">101.486 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">3</span>

                                        </div>
                                        <div class="row-event-racenumber">036</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=12">
                                                    
                                                    <span>JASON KRIKORIAN</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:00.360</div>
                                                                                        <div class="row-event-diff">11.054</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:30.228</div>
                                            <div class="row-event-bestlap">6</div>
                                        <div class="row-event-topspeed">101.343 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">4</span>

                                        </div>
                                        <div class="row-event-racenumber">178</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=16">
                                                    
                                                    <span>RANDALL JOE</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:19.771</div>
                                                                                        <div class="row-event-diff">30.465</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:31.082</div>
                                            <div class="row-event-bestlap">3</div>
                                        <div class="row-event-topspeed">100.393 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">5</span>

                                        </div>
                                        <div class="row-event-racenumber">999</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=17">
                                                    
                                                    <span>RICK STAFFORD</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:20.513</div>
                                                                                        <div class="row-event-diff">31.207</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:31.300</div>
                                            <div class="row-event-bestlap">6</div>
                                        <div class="row-event-topspeed">100.153 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">6</span>

                                        </div>
                                        <div class="row-event-racenumber">08</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=19">
                                                    
                                                    <span>JOE STILL</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:31.368</div>
                                                                                        <div class="row-event-diff">42.062</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:31.846</div>
                                            <div class="row-event-bestlap">13</div>
                                        <div class="row-event-topspeed">99.558 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">7</span>

                                        </div>
                                        <div class="row-event-racenumber">116</div>
                                                <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=32">
                                                    
                                                    <span>GEORGE TSANTES</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:05.713</div>
                                                                                    <div class="row-event-diff">1 lap</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:36.482</div>
                                            <div class="row-event-bestlap">7</div>
                                        <div class="row-event-topspeed">94.774 M/h</div>
                                    </div>
                        <div class="row-event row-event-classname-wrapper">
                            <div class="row-event-classname">
                                <h2>GTC5</h2>
                            </div>
                        </div>
                        <div class="event-results-header">
                            <div class="row-event row-event-race">
                                <div class="row-event-position">Pos</div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-competitor">Competitor</div>
                                        <div class="row-event-totaltime">Total time</div>
                                <div class="row-event-diff">Diff</div>
                                <div class="row-event-laps">Laps</div>
                                <div class="row-event-besttime">Best time</div>
                                <div class="row-event-bestlap">Best lap</div>
                                <div class="row-event-topspeed">Best Speed</div>
                            </div>
                        </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">1</span>

                                        </div>
                                        <div class="row-event-racenumber">722</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=10">
                                                    
                                                    <span>PHILLIP MARTIEN</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:57.057</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:29.496</div>
                                            <div class="row-event-bestlap">10</div>
                                        <div class="row-event-topspeed">102.172 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1" class="dnf-position">DNF</span>

                                        </div>
                                        <div class="row-event-racenumber">21</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=43">
                                                    
                                                    <span>GRADY WILLINGHAM</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">12:31.146</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">8</div>
                                        <div class="row-event-besttime">1:29.153</div>
                                            <div class="row-event-bestlap">4</div>
                                        <div class="row-event-topspeed">102.565 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1" class="dnf-position">DNF</span>

                                        </div>
                                        <div class="row-event-racenumber">91</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=45">
                                                    
                                                    <span>JOSEPH LOMBARDO</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">9:24.237</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">6</div>
                                        <div class="row-event-besttime">1:29.228</div>
                                            <div class="row-event-bestlap">4</div>
                                        <div class="row-event-topspeed">102.479 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1" class="dnf-position">DNF</span>

                                        </div>
                                        <div class="row-event-racenumber">17</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=47">
                                                    
                                                    <span>ANDREW GUCCIARDI</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">4:28.898</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">2</div>
                                        <div class="row-event-besttime">1:36.506</div>
                                            <div class="row-event-bestlap">1</div>
                                        <div class="row-event-topspeed">94.751 M/h</div>
                                    </div>
                        <div class="row-event row-event-classname-wrapper">
                            <div class="row-event-classname">
                                <h2>GTP2</h2>
                            </div>
                        </div>
                        <div class="event-results-header">
                            <div class="row-event row-event-race">
                                <div class="row-event-position">Pos</div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-competitor">Competitor</div>
                                        <div class="row-event-totaltime">Total time</div>
                                <div class="row-event-diff">Diff</div>
                                <div class="row-event-laps">Laps</div>
                                <div class="row-event-besttime">Best time</div>
                                <div class="row-event-bestlap">Best lap</div>
                                <div class="row-event-topspeed">Best Speed</div>
                            </div>
                        </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">1</span>

                                        </div>
                                        <div class="row-event-racenumber">96</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=18">
                                                    
                                                    <span>CARL TALLARDY</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:20.752</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:31.032</div>
                                            <div class="row-event-bestlap">13</div>
                                        <div class="row-event-topspeed">100.448 M/h</div>
                                    </div>
                        <div class="row-event row-event-classname-wrapper">
                            <div class="row-event-classname">
                                <h2>GTC3</h2>
                            </div>
                        </div>
                        <div class="event-results-header">
                            <div class="row-event row-event-race">
                                <div class="row-event-position">Pos</div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-competitor">Competitor</div>
                                        <div class="row-event-totaltime">Total time</div>
                                <div class="row-event-diff">Diff</div>
                                <div class="row-event-laps">Laps</div>
                                <div class="row-event-besttime">Best time</div>
                                <div class="row-event-bestlap">Best lap</div>
                                <div class="row-event-topspeed">Best Speed</div>
                            </div>
                        </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">1</span>

                                        </div>
                                        <div class="row-event-racenumber">44</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=20">
                                                    
                                                    <span>MIKE McMENAMIN</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:38.170</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:32.820</div>
                                            <div class="row-event-bestlap">10</div>
                                        <div class="row-event-topspeed">98.513 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">2</span>

                                        </div>
                                        <div class="row-event-racenumber">3</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=22">
                                                    
                                                    <span>KEN LABORDE</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:47.646</div>
                                                                                        <div class="row-event-diff">9.476</div>
                                                                                    <div class="row-event-laps">15</div>
                                        <div class="row-event-besttime">1:32.915</div>
                                            <div class="row-event-bestlap">6</div>
                                        <div class="row-event-topspeed">98.413 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">3</span>

                                        </div>
                                        <div class="row-event-racenumber">022</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=23">
                                                    
                                                    <span>ROB PURVIANCE</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:20.913</div>
                                                                                    <div class="row-event-diff">1 lap</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:33.810</div>
                                            <div class="row-event-bestlap">8</div>
                                        <div class="row-event-topspeed">97.474 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">4</span>

                                        </div>
                                        <div class="row-event-racenumber">902</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=27">
                                                    
                                                    <span>JACK GILSDORF</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:52.886</div>
                                                                                    <div class="row-event-diff">1 lap</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:34.334</div>
                                            <div class="row-event-bestlap">4</div>
                                        <div class="row-event-topspeed">96.932 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">5</span>

                                        </div>
                                        <div class="row-event-racenumber">110</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=30">
                                                    
                                                    <span>MIKE COURTNEY</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:56.738</div>
                                                                                    <div class="row-event-diff">1 lap</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:34.814</div>
                                            <div class="row-event-bestlap">7</div>
                                        <div class="row-event-topspeed">96.441 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">6</span>

                                        </div>
                                        <div class="row-event-racenumber">324</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=33">
                                                    
                                                    <span>ANTON DIAS PERERA</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:19.008</div>
                                                                                    <div class="row-event-diff">1 lap</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:36.698</div>
                                            <div class="row-event-bestlap">7</div>
                                        <div class="row-event-topspeed">94.562 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1" class="dnf-position">DNF</span>

                                        </div>
                                        <div class="row-event-racenumber">64</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=39">
                                                    
                                                    <span>DWAYNE MOSES</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">21:35.621</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">13</div>
                                        <div class="row-event-besttime">1:34.065</div>
                                            <div class="row-event-bestlap">6</div>
                                        <div class="row-event-topspeed">97.209 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1" class="dnf-position">DNF</span>

                                        </div>
                                        <div class="row-event-racenumber">133</div>
                                                <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=40">
                                                    
                                                    <span>MICHAEL BELER</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">20:08.484</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">12</div>
                                        <div class="row-event-besttime">1:35.394</div>
                                            <div class="row-event-bestlap">3</div>
                                        <div class="row-event-topspeed">95.855 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1" class="dnf-position">DNF</span>

                                        </div>
                                        <div class="row-event-racenumber">92</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=42">
                                                    
                                                    <span>JERRY GREENE</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">14:30.717</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">9</div>
                                        <div class="row-event-besttime">1:31.318</div>
                                            <div class="row-event-bestlap">7</div>
                                        <div class="row-event-topspeed">100.134 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1" class="dnf-position">DNF</span>

                                        </div>
                                        <div class="row-event-racenumber">03</div>
                                                <div class="row-event-racenumber row-event-racenumber-2 subcription-200"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=44">
                                                    
                                                    <span>DAVID HERRINGTON</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">12:58.088</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">8</div>
                                        <div class="row-event-besttime">1:33.453</div>
                                            <div class="row-event-bestlap">6</div>
                                        <div class="row-event-topspeed">97.846 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1" class="dnf-position">DNF</span>

                                        </div>
                                        <div class="row-event-racenumber">194</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=46">
                                                    
                                                    <span>DAVID EDWARDS</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">4:13.424</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">2</div>
                                        <div class="row-event-besttime">1:38.902</div>
                                            <div class="row-event-bestlap">1</div>
                                        <div class="row-event-topspeed">92.455 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1" class="dnf-position">DNF</span>

                                        </div>
                                        <div class="row-event-racenumber">901</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=48">
                                                    
                                                    <span>PHIL GILSDORF</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">2:54.809</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">1</div>
                                        <div class="row-event-besttime">0.000</div>
                                            <div class="row-event-bestlap">-</div>
                                        <div class="row-event-topspeed">0 M/h</div>
                                    </div>
                        <div class="row-event row-event-classname-wrapper">
                            <div class="row-event-classname">
                                <h2>GT3</h2>
                            </div>
                        </div>
                        <div class="event-results-header">
                            <div class="row-event row-event-race">
                                <div class="row-event-position">Pos</div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-competitor">Competitor</div>
                                        <div class="row-event-totaltime">Total time</div>
                                <div class="row-event-diff">Diff</div>
                                <div class="row-event-laps">Laps</div>
                                <div class="row-event-besttime">Best time</div>
                                <div class="row-event-bestlap">Best lap</div>
                                <div class="row-event-topspeed">Best Speed</div>
                            </div>
                        </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">1</span>

                                        </div>
                                        <div class="row-event-racenumber">56</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=25">
                                                    
                                                    <span>LARRY HEBENSTREIT</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:51.393</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:35.252</div>
                                            <div class="row-event-bestlap">4</div>
                                        <div class="row-event-topspeed">95.998 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">2</span>

                                        </div>
                                        <div class="row-event-racenumber">836</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=31">
                                                    
                                                    <span>KENNETH GREENBERG</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:01.289</div>
                                                                                        <div class="row-event-diff">9.896</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:34.820</div>
                                            <div class="row-event-bestlap">6</div>
                                        <div class="row-event-topspeed">96.435 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">3</span>

                                        </div>
                                        <div class="row-event-racenumber">931</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=36">
                                                    
                                                    <span>BOB HAHNEMANN</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:58.812</div>
                                                                                        <div class="row-event-diff">1:07.419</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:38.976</div>
                                            <div class="row-event-bestlap">12</div>
                                        <div class="row-event-topspeed">92.386 M/h</div>
                                    </div>
                        <div class="row-event row-event-classname-wrapper">
                            <div class="row-event-classname">
                                <h2>K</h2>
                            </div>
                        </div>
                        <div class="event-results-header">
                            <div class="row-event row-event-race">
                                <div class="row-event-position">Pos</div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-racenumber">
                                    <div>&nbsp;</div>
                                </div>
                                <div class="row-event-competitor">Competitor</div>
                                        <div class="row-event-totaltime">Total time</div>
                                <div class="row-event-diff">Diff</div>
                                <div class="row-event-laps">Laps</div>
                                <div class="row-event-besttime">Best time</div>
                                <div class="row-event-bestlap">Best lap</div>
                                <div class="row-event-topspeed">Best Speed</div>
                            </div>
                        </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">1</span>

                                        </div>
                                        <div class="row-event-racenumber">45</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=29">
                                                    
                                                    <span>JAMES STANISLAW</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">22:56.031</div>
                                                                                        <div class="row-event-diff"> </div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:35.111</div>
                                            <div class="row-event-bestlap">6</div>
                                        <div class="row-event-topspeed">96.14 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">2</span>

                                        </div>
                                        <div class="row-event-racenumber">540</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=34">
                                                    
                                                    <span>JOHN GRALTON</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:20.474</div>
                                                                                        <div class="row-event-diff">24.443</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:37.045</div>
                                            <div class="row-event-bestlap">4</div>
                                        <div class="row-event-topspeed">94.224 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">3</span>

                                        </div>
                                        <div class="row-event-racenumber">12</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=35">
                                                    
                                                    <span>PRICE FORD</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:29.547</div>
                                                                                        <div class="row-event-diff">33.516</div>
                                                                                    <div class="row-event-laps">14</div>
                                        <div class="row-event-besttime">1:38.163</div>
                                            <div class="row-event-bestlap">4</div>
                                        <div class="row-event-topspeed">93.151 M/h</div>
                                    </div>
                                    <div class="row-event ">
                                        <div class="row-event-position">
                                                            <span data-position="1">4</span>

                                        </div>
                                        <div class="row-event-racenumber">234</div>
                                                    <div class="row-event-racenumber row-event-racenumber-2"></div>
                                        <div class="row-event-competitor">
                                                <a class="competitorName " href="/Sessions/4315752/LapTimes?pos=37">
                                                    
                                                    <span>MARK REED</span>
                                                </a>
                                        </div>
                                            <div class="row-event-totaltime">23:10.937</div>
                                                                                    <div class="row-event-diff">1 lap</div>
                                                                                    <div class="row-event-laps">13</div>
                                        <div class="row-event-besttime">1:42.086</div>
                                            <div class="row-event-bestlap">10</div>
                                        <div class="row-event-topspeed">89.572 M/h</div>
                                    </div>
            </div>
        </div>
    </div>
</div>
        <div role="tabpanel" class="tab-pane lapChart" id="lapChart">
            <div class="row">
                <div class="loading" id="loadingLapchart" style="display: none; top: auto;"></div>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane compare-racers-resp" id="compare"></div>
    </div>
    



</div>
<div id="trans-DNF" data-trans="DNF" style="display:none"></div>

<!-- Modal -->
<div class="modal fade " id="selectCompetitors" role="dialog">
    <div class="modal-dialog modal-lg selectCompetitors">
        <div class="modal-content selectCompetitorsContent">
            <div class="modal-header">
                <span class="modal-title">
                    Select competitors
                </span>
                <span class="number-competitors">(</span>
                <span class="number-competitors-selected">0</span>
                <span class="max-number-competitors">of 3 )</span>
            </div>
            <div class="modal-body">
                <div class="results-header">
                    <div class="row-event-position">Pos</div>
                    <div class="row-event-racenumber"><div>&nbsp;</div></div>
                    <div class="row-event-competitor">Competitor</div>
                    <div class="select-competitor-checkbox"></div>
                </div>
                <div id="competitors-results" class="competitors-detail-results" style="height: 600px; overflow: hidden; position: relative;" tabindex="5001">
                    <div id="scrollable-modal" class="scrollable-modal">
                        <div class="content" style="transform: translate3d(0, 0, 0);">
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">1</span></div>
                                    <div class="row-event-racenumber padding-right10">871</div>
                                    <div class="row-event-competitor"><span class="no-logo">CHRIS BROWN</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-1" finishposition="1"><label for="racer-1"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">2</span></div>
                                    <div class="row-event-racenumber padding-right10">07</div>
                                    <div class="row-event-competitor"><span class="no-logo">SETH DAVIDOW</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-2" finishposition="2"><label for="racer-2"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">3</span></div>
                                    <div class="row-event-racenumber padding-right10">009</div>
                                    <div class="row-event-competitor"><span class="no-logo">SCOTT DAIGER</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-3" finishposition="3"><label for="racer-3"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">4</span></div>
                                    <div class="row-event-racenumber padding-right10">701</div>
                                    <div class="row-event-competitor"><span class="no-logo">JEAN AUDET</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-4" finishposition="4"><label for="racer-4"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">5</span></div>
                                    <div class="row-event-racenumber padding-right10">108</div>
                                    <div class="row-event-competitor"><span class="no-logo">LOREN BEGGS</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-5" finishposition="5"><label for="racer-5"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">6</span></div>
                                    <div class="row-event-racenumber padding-right10">423</div>
                                    <div class="row-event-competitor"><span class="no-logo">JUSTIN JACKSON</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-6" finishposition="6"><label for="racer-6"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">7</span></div>
                                    <div class="row-event-racenumber padding-right10">02</div>
                                    <div class="row-event-competitor"><span class="no-logo">RAFAEL LLOPIZ</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-7" finishposition="7"><label for="racer-7"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">8</span></div>
                                    <div class="row-event-racenumber padding-right10">14</div>
                                    <div class="row-event-competitor"><span class="no-logo">ANTHONY LLOPIZ</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-8" finishposition="8"><label for="racer-8"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">9</span></div>
                                    <div class="row-event-racenumber padding-right10">118</div>
                                    <div class="row-event-competitor"><span class="no-logo">JOHN GOETZ</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-9" finishposition="9"><label for="racer-9"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">10</span></div>
                                    <div class="row-event-racenumber padding-right10">722</div>
                                    <div class="row-event-competitor"><span class="no-logo">PHILLIP MARTIEN</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-10" finishposition="10"><label for="racer-10"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">11</span></div>
                                    <div class="row-event-racenumber padding-right10">361</div>
                                    <div class="row-event-competitor"><span class="no-logo">ERIC MIES</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-11" finishposition="11"><label for="racer-11"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">12</span></div>
                                    <div class="row-event-racenumber padding-right10">036</div>
                                    <div class="row-event-competitor"><span class="no-logo">JASON KRIKORIAN</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-12" finishposition="12"><label for="racer-12"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">13</span></div>
                                    <div class="row-event-racenumber padding-right10">271</div>
                                    <div class="row-event-competitor"><span class="no-logo">ROBERT WISEN</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-13" finishposition="13"><label for="racer-13"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">14</span></div>
                                    <div class="row-event-racenumber padding-right10">93</div>
                                    <div class="row-event-competitor"><span class="no-logo">DAVE ELSNER</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-14" finishposition="14"><label for="racer-14"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">15</span></div>
                                    <div class="row-event-racenumber padding-right10">99</div>
                                    <div class="row-event-competitor"><span class="no-logo">STEVE DIMAKOS</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-15" finishposition="15"><label for="racer-15"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">16</span></div>
                                    <div class="row-event-racenumber padding-right10">178</div>
                                    <div class="row-event-competitor"><span class="no-logo">RANDALL JOE</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-16" finishposition="16"><label for="racer-16"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">17</span></div>
                                    <div class="row-event-racenumber padding-right10">999</div>
                                    <div class="row-event-competitor"><span class="no-logo">RICK STAFFORD</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-17" finishposition="17"><label for="racer-17"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">18</span></div>
                                    <div class="row-event-racenumber padding-right10">96</div>
                                    <div class="row-event-competitor"><span class="no-logo">CARL TALLARDY</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-18" finishposition="18"><label for="racer-18"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">19</span></div>
                                    <div class="row-event-racenumber padding-right10">08</div>
                                    <div class="row-event-competitor"><span class="no-logo">JOE STILL</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-19" finishposition="19"><label for="racer-19"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">20</span></div>
                                    <div class="row-event-racenumber padding-right10">44</div>
                                    <div class="row-event-competitor"><span class="no-logo">MIKE McMENAMIN</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-20" finishposition="20"><label for="racer-20"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">21</span></div>
                                    <div class="row-event-racenumber padding-right10">496</div>
                                    <div class="row-event-competitor"><span class="no-logo">LES LONG</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-21" finishposition="21"><label for="racer-21"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">22</span></div>
                                    <div class="row-event-racenumber padding-right10">3</div>
                                    <div class="row-event-competitor"><span class="no-logo">KEN LABORDE</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-22" finishposition="22"><label for="racer-22"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">23</span></div>
                                    <div class="row-event-racenumber padding-right10">022</div>
                                    <div class="row-event-competitor"><span class="no-logo">ROB PURVIANCE</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-23" finishposition="23"><label for="racer-23"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">24</span></div>
                                    <div class="row-event-racenumber padding-right10">259</div>
                                    <div class="row-event-competitor"><span class="no-logo">DWIGHT KELLY</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-24" finishposition="24"><label for="racer-24"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">25</span></div>
                                    <div class="row-event-racenumber padding-right10">56</div>
                                    <div class="row-event-competitor"><span class="no-logo">LARRY HEBENSTREIT</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-25" finishposition="25"><label for="racer-25"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">26</span></div>
                                    <div class="row-event-racenumber padding-right10">680</div>
                                    <div class="row-event-competitor"><span class="no-logo">ANDREW JOHNSON</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-26" finishposition="26"><label for="racer-26"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">27</span></div>
                                    <div class="row-event-racenumber padding-right10">902</div>
                                    <div class="row-event-competitor"><span class="no-logo">JACK GILSDORF</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-27" finishposition="27"><label for="racer-27"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">28</span></div>
                                    <div class="row-event-racenumber padding-right10">823</div>
                                    <div class="row-event-competitor"><span class="no-logo">BRIAN ANDERSON</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-28" finishposition="28"><label for="racer-28"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">29</span></div>
                                    <div class="row-event-racenumber padding-right10">45</div>
                                    <div class="row-event-competitor"><span class="no-logo">JAMES STANISLAW</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-29" finishposition="29"><label for="racer-29"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">30</span></div>
                                    <div class="row-event-racenumber padding-right10">110</div>
                                    <div class="row-event-competitor"><span class="no-logo">MIKE COURTNEY</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-30" finishposition="30"><label for="racer-30"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">31</span></div>
                                    <div class="row-event-racenumber padding-right10">836</div>
                                    <div class="row-event-competitor"><span class="no-logo">KENNETH GREENBERG</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-31" finishposition="31"><label for="racer-31"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">32</span></div>
                                    <div class="row-event-racenumber padding-right10">116</div>
                                    <div class="row-event-competitor"><span class="no-logo">GEORGE TSANTES</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-32" finishposition="32"><label for="racer-32"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">33</span></div>
                                    <div class="row-event-racenumber padding-right10">324</div>
                                    <div class="row-event-competitor"><span class="no-logo">ANTON DIAS PERERA</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-33" finishposition="33"><label for="racer-33"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">34</span></div>
                                    <div class="row-event-racenumber padding-right10">540</div>
                                    <div class="row-event-competitor"><span class="no-logo">JOHN GRALTON</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-34" finishposition="34"><label for="racer-34"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">35</span></div>
                                    <div class="row-event-racenumber padding-right10">12</div>
                                    <div class="row-event-competitor"><span class="no-logo">PRICE FORD</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-35" finishposition="35"><label for="racer-35"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">36</span></div>
                                    <div class="row-event-racenumber padding-right10">931</div>
                                    <div class="row-event-competitor"><span class="no-logo">BOB HAHNEMANN</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-36" finishposition="36"><label for="racer-36"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">37</span></div>
                                    <div class="row-event-racenumber padding-right10">234</div>
                                    <div class="row-event-competitor"><span class="no-logo">MARK REED</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-37" finishposition="37"><label for="racer-37"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">38</span></div>
                                    <div class="row-event-racenumber padding-right10">918</div>
                                    <div class="row-event-competitor"><span class="no-logo">JACK McCARTHY</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-38" finishposition="38"><label for="racer-38"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">39</span></div>
                                    <div class="row-event-racenumber padding-right10">64</div>
                                    <div class="row-event-competitor"><span class="no-logo">DWAYNE MOSES</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-39" finishposition="39"><label for="racer-39"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">40</span></div>
                                    <div class="row-event-racenumber padding-right10">133</div>
                                    <div class="row-event-competitor"><span class="no-logo">MICHAEL BELER</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-40" finishposition="40"><label for="racer-40"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">41</span></div>
                                    <div class="row-event-racenumber padding-right10">117</div>
                                    <div class="row-event-competitor"><span class="no-logo">GARY JENSEN</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-41" finishposition="41"><label for="racer-41"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">42</span></div>
                                    <div class="row-event-racenumber padding-right10">92</div>
                                    <div class="row-event-competitor"><span class="no-logo">JERRY GREENE</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-42" finishposition="42"><label for="racer-42"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">43</span></div>
                                    <div class="row-event-racenumber padding-right10">21</div>
                                    <div class="row-event-competitor"><span class="no-logo">GRADY WILLINGHAM</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-43" finishposition="43"><label for="racer-43"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">44</span></div>
                                    <div class="row-event-racenumber padding-right10">03</div>
                                    <div class="row-event-competitor"><span class="no-logo">DAVID HERRINGTON</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-44" finishposition="44"><label for="racer-44"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">45</span></div>
                                    <div class="row-event-racenumber padding-right10">91</div>
                                    <div class="row-event-competitor"><span class="no-logo">JOSEPH LOMBARDO</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-45" finishposition="45"><label for="racer-45"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">46</span></div>
                                    <div class="row-event-racenumber padding-right10">194</div>
                                    <div class="row-event-competitor"><span class="no-logo">DAVID EDWARDS</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-46" finishposition="46"><label for="racer-46"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">47</span></div>
                                    <div class="row-event-racenumber padding-right10">17</div>
                                    <div class="row-event-competitor"><span class="no-logo">ANDREW GUCCIARDI</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-47" finishposition="47"><label for="racer-47"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                                <div class="row-event">
                                    <div class="row-event-position"><span data-position="2">48</span></div>
                                    <div class="row-event-racenumber padding-right10">901</div>
                                    <div class="row-event-competitor"><span class="no-logo">PHIL GILSDORF</span></div>
                                    <div class="checkbox checkbox-compare-racers"><input type="checkbox" class="compare-racers" id="racer-48" finishposition="48"><label for="racer-48"></label></div>
                                    <!-- <div class="checkbox checkbox-compare-racers1"><input type="checkbox" disabled="disabled" class="compare-racers checked" id="racer1" finishposition="2"><label for="racer1"></label></div> -->
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a data-dismiss="modal" class="cancel-comparison">Cancel</a>
                <button type="button" class="btn-compare" disabled>Compare</button>
            </div>
        </div>
    </div>
</div>
<div id="transl" style="display: none">
    <div class="row-event-lap-number" data-translation="Lap"></div>
    <div class="row-event-lap-time" data-translation="Lap Time"></div>
    <div class="race-info" data-translation="Pos"></div>
    <div class="diff-text" data-translation="Diff"></div>
</div>

<script src="/Scripts/d3.v3.min.js" charset="utf-8"></script>


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
    <script src="https://speedhive.azureedge.net/bundles/scripts?1.0.0.32212"></script>
<script>(window.$)||document.write('<script src="/bundles/scripts"><\/script>');</script>

    <script src="https://speedhive.azureedge.net/bundles/smartbanner?1.0.0.32212"></script>
<script>($.smartbanner)||document.write('<script src="/bundles/smartbanner"><\/script>');</script>

    
    <script src="https://speedhive.azureedge.net/bundles/session-details?1.0.0.32212"></script>
<script>(window.utils)||document.write('<script src="/bundles/session-details"><\/script>');</script>

        <script type="text/javascript">
            if (utils && utils.setupTabLinks) {
                utils.setupTabLinks();
            }
            var languageurl = window.location.pathname;
            if (languageurl.indexOf('/en') !== -1) {
                $(".dropdown-menu > #language-change").find(".english").css("color", "white");
            }
            else if (languageurl.indexOf('/nl') !== -1) {
                $(".dropdown-menu > #language-change").find(".dutch").css("color", "white");
            }
            else {
                $(".dropdown-menu > #language-change").find(".japan").css("color", "white");
            }

            $("body").on('click', '.lapchartTab', function() {
                if ($('.select-competitor-tab').length) {
                    $('.select-competitor-tab').css('display', 'none');
                }
            });
            $("body").on('click', '.byclass-tab', function() {
                if ($('.select-competitor-tab').length) {
                    $('.select-competitor-tab').css('display', 'none');
                }
            });
            //  var maxNumberOfLaps = 0;
            var windowWidth = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
            var sportValue = 'car';
            if (windowWidth > 767) {
                $('body').addClass('bgr-cover-' + sportValue + '-desktop');
            }
            else {
                $('body').addClass('bgr-cover-' + sportValue + '-mobile');
            }
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                if(!Modernizr.flexbox){
                    $('.announcement-row > span').css('margin-top', '4px');
                }

                $("body").on('change', '.checkbox-compare-racers', function () {
                    $(this).find('.compare-racers').toggleClass('checked');
                    var self = this;
                    var numberOfCheckBoxSelected = $('.compare-racers.checked').size();
                    $(".number-competitors-selected").html(numberOfCheckBoxSelected);
                    $(".btn-compare").attr('disabled', (numberOfCheckBoxSelected >= 2) ? false : true);
                    if(numberOfCheckBoxSelected == 3) {
                        $('.compare-racers').not(".checked").attr('disabled', true);
                    }
                    else if (numberOfCheckBoxSelected < 3) {
                        $('.compare-racers:disabled').attr('disabled', false);
                    }
                });

                $("body").on('click', '.row-event > div:not(:last-child)', function () {
                    var numberOfCheckboxSelectes = $('.compare-racers:checked').size(),
                        rowElement = $(this).parent();
                    if (!rowElement.find('.compare-racers').is(':disabled')) {
                        rowElement.find(".checkbox-compare-racers").trigger('change');
                    }
                });

                $("body").on('click', '.compare-tab', function () {
                    if ($('#compare').is(':empty')) {
                        $("#selectCompetitors").modal("show");
                    }
                    if ($('.select-competitor-tab').length) {
                        if (window.matchMedia('(min-width: 991px)').matches) {
                            $('#session-options > .select-competitor-tab').css('display', 'block');
                        }
                    }
                    if ($('.select-competitor-row').length) {
                        //       $('.select-competitor-row').css('display', 'block');
                    }
                })

                $('#selectCompetitors').on('shown.bs.modal', function () {
                    $("#competitors-results").niceScroll(".content", {
                        cursorcolor: "#585B60",
                        cursorborderradius: "0px",
                        autohidemode: false,
                        cursorborder: "none",
                    });
                })

                $("body").on('click', '.btn-compare', function () {
                    $('.btn-compare').attr('disabled', true);
                    $("#selectCompetitors").modal("hide");
                    $('#compare').empty();

                    if ($('.select-competitor-tab').length) {
                        if (window.matchMedia('(min-width: 991px)').matches) {
                            $('#session-options > .select-competitor-tab').css('display', 'block');
                        }
                    }
                    if ($('.select-competitor-row').length) {
                        $('.select-competitor-row').remove();
                    }
                    var finishPositions=[];
                    var eventId = 0;
                    eventId = 4315752;
                    $("#compare").append('<div class="row racers-comparison"></div>');
                    $.each($('.compare-racers.checked'), function (index, value) {
                        finishPositions.push({Id:eventId, "FinishedPosition": parseInt(value.getAttribute('finishposition'))});
                    });
                    $.ajax({
                        type: "POST",
                        url: '/Sessions/4315752/SessionDetailsCompare',
                        data:  JSON.stringify(finishPositions),
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#compare').html(data);
                        }
                    });
                });

                // maxNumberOfLaps =100;
                if (window.matchMedia('(max-width: 767px)').matches) {
                    $('.dropdown-session-details').find('.dropdown-left').css('height', 270).css('background-color', '#292F38');
                    $(".dropdown-left").niceScroll({
                        cursorcolor: "#585B60",
                        cursorborderradius: "0px",
                        autohidemode: false,
                        cursorborder: "none",
                    });
                    $(".dropdown-left").getNiceScroll().resize();
                }
                $('#session-header').find('.session-details-title-container').css('visibility', 'visible');
                $(".scrollable").niceScroll({
                    cursorcolor: "#585B60",
                    cursorborderradius: "0px",
                    autohidemode: false,
                    cursorborder: "none",
                });
                $(".scrollable").getNiceScroll().resize();
                $('#session-header').find('.dropdown-toggle').dropdown();
                $("a[href=\"#lapChart\"][data-toggle=\"tab\"]").on('hide.bs.tab', function (e) {
                    $("#announcements").show();
                });
            });
            $('#session-header').find('.session-details-title').on({
                "show.bs.dropdown": function (event) {

                    if (event.relatedTarget.id == "leftLabel") {
                        $(this).find('h1 > span').removeClass('ico-arrow-down-gray').addClass('ico-arrow-up-gray');
                    } else if (event.relatedTarget.id == "rightLabel") {
                        if ($('body').width() < 768) {
                            $('body')
                                .addClass('stop-scrolling')
                                .bind('touchmove', function (e) { e.preventDefault(); });
                        }

                        $(this).find('.dropdown-menu-right li.a-group a')
                            .add($(this).find('.dropdown-menu-right li:last-child > div'))
                            .css('padding-left', $('#session-header').parent().parent().css('width'));

                        $('#rightLabel').removeClass('main-menu-div-open').addClass('main-menu-div-close');

                    }

                },
                "shown.bs.dropdown": function (event) {
                    $(".dropdown-menu-right").niceScroll({
                        cursorcolor: "#585B60",
                        cursorborderradius: "0px",
                        autohidemode: false,
                        cursorborder: "none",
                    });
                    if ($(event.target).hasClass('dropdown-right-container')) {
                        $(this)
                            .find('.dropdown-menu-right li.a-group a')
                            .add($(this).find('.dropdown-menu-right li:last-child > div'))
                            .each(function (index, current) {

                                $(current).animate({
                                    paddingLeft: 0
                                }, { duration: (500 + 25 * index), queue: false });

                            });

                        $('#session-header').find('.left-arrow-div').add('#leftLabel').css('visibility', 'hidden');
                    }
                },
                "hide.bs.dropdown": function (event) {

                    if (event.relatedTarget.id == "leftLabel") {
                        $(this).find('h1 > span').removeClass('ico-arrow-up-gray').addClass('ico-arrow-down-gray');
                    } else if (event.relatedTarget.id = "rightLabel") {
                        if ($('body').width() < 768) {
                            $('body')
                                .removeClass('stop-scrolling')
                                .unbind('touchmove');
                        }
                        $('#rightLabel').removeClass('main-menu-div-close').addClass('main-menu-div-open');
                        $('#session-header').find('.left-arrow-div').add('#leftLabel').css('visibility', 'visible');
                    }

                }
            });
            $('#session-header').find('.second-dropdown').on("click", function (event) {
                var $this = $(this);
                event.preventDefault();
                $(".scrollable").getNiceScroll().hide();

                $('#session-header').find('.session-details-subtitles-right').slideToggle("slow", function () {
                    $this.toggleClass('ico-arrow-down gray ico-arrow-up-gray');
                    $('.toggle-on-small').toggleClass('hide-it');
                    $(".scrollable").getNiceScroll().resize();
                    $(".scrollable").getNiceScroll().show();
                });

            });
            $('#session-header').parent().parent().affix({
                offset: {
                    top: $('#session-header').parent().parent().offset().top
                }
            });
            $(window).scroll(function () {
                var targetEl;
                if ($('body').width() < 768) {
                    $(".scrollable").getNiceScroll().resize();
                }
            });

            var targetEl = $("#all-results").find('.scrollable');

            if ($('body').width() < 768) {
                targetEl.width(targetEl.parent().width() - 103);
            } else {
                targetEl.addClass('fullwidthscrollbar');
            }

            $(window).resize(function () {
                var targetEl = $("#all-results").find('.scrollable');
                if ($('body').width() < 751) {
                    if (targetEl.hasClass('fullwidthscrollbar')) {
                        targetEl.removeClass('fullwidthscrollbar');
                    }
                    if($('.allresults-tab').parent().hasClass('active')){
                        targetEl.width(targetEl.parent().width() - 103);
                    }
                    else{
                        // -103 = width of the 2 colums static, 30 paddings
                        targetEl.width($('body').width() -103 - 30);
                    }
                } else {
                    if (!targetEl.hasClass('fullwidthscrollbar')) {
                        targetEl.addClass('fullwidthscrollbar');
                    }
                }
            });

            function loadLapChart() {
                $("#announcements").hide();
                $('#loadingLapchart').css('display', 'block');
                $.ajax({
                    type: "GET",
                    url: '/Sessions/4315752/LapChart',
                    contentType: "json; charset=utf-8",
                    success: function (data) {
                        $('#lapChart .row').html(data);
                    }
                });
                $('#loadingLapchart').css('display', 'block');
            }
            if (window.location.hash === "#lapChart") {
                loadLapChart();
            }
            $('.lapchartTab').on("click", function(event) {
                loadLapChart();
            });

            $('.allresults-tab,.byclass-tab').on("click", function (event) {
                $(".scrollable").niceScroll({
                    cursorcolor: "#585B60",
                    cursorborderradius: "0px",
                    autohidemode: false,
                    cursorborder: "none",
                });
            });

            function InitChart (data, numberOfRacers) {
                $('.svg-chart').html("");
                var HEIGHT = numberOfRacers * 50.75,
                    WIDTH,
                    MARGINS = {
                        top: 22,
                        right: 20,
                        bottom: 25,
                        left: 5
                    },
                    self = this,
                    colorIndex = 0,
                    orderdData = [],
                    lineElement,
                    startClass,
                    xAxisTickValues = [],
                    increment = 1,
                    firstLapNr,
                    haveDuplicateRacers = false;

                var ClassificationModel = {"type":"Race","bestLaps":{"field":{"resultClass":"GTC6","name":"CHRIS BROWN","fieldFinishPosition":1},"classes":[{"resultClass":"GTC6","name":"CHRIS BROWN","fieldFinishPosition":1},{"resultClass":"GTA3","name":"SCOTT DAIGER","fieldFinishPosition":3},{"resultClass":"GTA2","name":"JEAN AUDET","fieldFinishPosition":4},{"resultClass":"GTA1","name":"JUSTIN JACKSON","fieldFinishPosition":6},{"resultClass":"GTC4","name":"ANTHONY LLOPIZ","fieldFinishPosition":8},{"resultClass":"GTC5","name":"GRADY WILLINGHAM","fieldFinishPosition":43},{"resultClass":"GTP2","name":"CARL TALLARDY","fieldFinishPosition":18},{"resultClass":"GTC3","name":"JERRY GREENE","fieldFinishPosition":42},{"resultClass":"GT3","name":"KENNETH GREENBERG","fieldFinishPosition":31},{"resultClass":"K","name":"JAMES STANISLAW","fieldFinishPosition":29}]},"rows":[{"totalTime":"22:15.947","bestTime":"1:26.412","bestLap":5,"bestSpeed":105.819,"numberOfLaps":15,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":1,"startNumber":"871","name":"CHRIS BROWN","resultClass":"GTC6","positionInClass":1,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-c5f8d0657bb5477baca23759abf39809","productCategory":0,"chip":{"code":"3250916"}}},{"totalTime":"22:21.506","bestTime":"1:27.772","bestLap":15,"bestSpeed":104.179,"numberOfLaps":15,"diffClass":{"timeDifference":"5.559","lapsBehind":0},"difference":{"timeDifference":"5.559","lapsBehind":0},"position":2,"startNumber":"07","name":"SETH DAVIDOW","resultClass":"GTC6","positionInClass":2,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"4585950"}}},{"totalTime":"22:34.838","bestTime":"1:28.572","bestLap":5,"bestSpeed":103.238,"numberOfLaps":15,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"18.891","lapsBehind":0},"position":3,"startNumber":"009","name":"SCOTT DAIGER","resultClass":"GTA3","positionInClass":1,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"895693"}}},{"totalTime":"22:35.644","bestTime":"1:28.892","bestLap":2,"bestSpeed":102.866,"numberOfLaps":15,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"19.697","lapsBehind":0},"position":4,"startNumber":"701","name":"JEAN AUDET","resultClass":"GTA2","positionInClass":1,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"2318754"}}},{"totalTime":"22:36.704","bestTime":"1:27.512","bestLap":15,"bestSpeed":104.489,"numberOfLaps":15,"diffClass":{"timeDifference":"20.757","lapsBehind":0},"difference":{"timeDifference":"20.757","lapsBehind":0},"position":5,"startNumber":"108","name":"LOREN BEGGS","resultClass":"GTC6","positionInClass":3,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"1276723"}}},{"totalTime":"22:40.957","bestTime":"1:27.701","bestLap":6,"bestSpeed":104.263,"numberOfLaps":15,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"25.010","lapsBehind":0},"position":6,"startNumber":"423","name":"JUSTIN JACKSON","resultClass":"GTA1","positionInClass":1,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"4044039"}}},{"totalTime":"22:41.729","bestTime":"1:28.001","bestLap":7,"bestSpeed":103.908,"numberOfLaps":15,"diffClass":{"timeDifference":"25.782","lapsBehind":0},"difference":{"timeDifference":"25.782","lapsBehind":0},"position":7,"startNumber":"02","name":"RAFAEL LLOPIZ","resultClass":"GTC6","positionInClass":4,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-ffd9daa8ff6e4ae192df58129700e728","productCategory":0,"chip":{"code":"3681513"}}},{"totalTime":"22:49.306","bestTime":"1:29.023","bestLap":6,"bestSpeed":102.715,"numberOfLaps":15,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"33.359","lapsBehind":0},"position":8,"startNumber":"14","name":"ANTHONY LLOPIZ","resultClass":"GTC4","positionInClass":1,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-43d484982393418d9f996312dc33228a","productCategory":0,"chip":{"code":"1269805"}}},{"totalTime":"22:56.132","bestTime":"1:28.257","bestLap":7,"bestSpeed":103.607,"numberOfLaps":15,"diffClass":{"timeDifference":"40.185","lapsBehind":0},"difference":{"timeDifference":"40.185","lapsBehind":0},"position":9,"startNumber":"118","name":"JOHN GOETZ","resultClass":"GTC6","positionInClass":5,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"5745032"}}},{"totalTime":"22:57.057","bestTime":"1:29.496","bestLap":10,"bestSpeed":102.172,"numberOfLaps":15,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"41.110","lapsBehind":0},"position":10,"startNumber":"722","name":"PHILLIP MARTIEN","resultClass":"GTC5","positionInClass":1,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"5452848"}}},{"totalTime":"22:57.516","bestTime":"1:30.101","bestLap":10,"bestSpeed":101.486,"numberOfLaps":15,"diffClass":{"timeDifference":"8.210","lapsBehind":0},"difference":{"timeDifference":"41.569","lapsBehind":0},"position":11,"startNumber":"361","name":"ERIC MIES","resultClass":"GTC4","positionInClass":2,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"1435665"}}},{"totalTime":"23:00.360","bestTime":"1:30.228","bestLap":6,"bestSpeed":101.343,"numberOfLaps":15,"diffClass":{"timeDifference":"11.054","lapsBehind":0},"difference":{"timeDifference":"44.413","lapsBehind":0},"position":12,"startNumber":"036","name":"JASON KRIKORIAN","resultClass":"GTC4","positionInClass":3,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"3394357"}}},{"totalTime":"23:06.277","bestTime":"1:30.547","bestLap":2,"bestSpeed":100.986,"numberOfLaps":15,"diffClass":{"timeDifference":"30.633","lapsBehind":0},"difference":{"timeDifference":"50.330","lapsBehind":0},"position":13,"startNumber":"271","name":"ROBERT WISEN","resultClass":"GTA2","positionInClass":2,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-065d134945574bd99c1ef961dfca18b6","productCategory":0,"chip":{"code":"4784065"}}},{"totalTime":"23:09.929","bestTime":"1:30.750","bestLap":2,"bestSpeed":100.76,"numberOfLaps":15,"diffClass":{"timeDifference":"53.982","lapsBehind":0},"difference":{"timeDifference":"53.982","lapsBehind":0},"position":14,"startNumber":"93","name":"DAVE ELSNER","resultClass":"GTC6","positionInClass":6,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"4059142"}}},{"totalTime":"23:13.764","bestTime":"1:28.081","bestLap":9,"bestSpeed":103.814,"numberOfLaps":15,"diffClass":{"timeDifference":"57.817","lapsBehind":0},"difference":{"timeDifference":"57.817","lapsBehind":0},"position":15,"startNumber":"99","name":"STEVE DIMAKOS","resultClass":"GTC6","positionInClass":7,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-5a1c8976e7a14bc2bfcc09db1ae3cd06","productCategory":200,"chip":{"code":"6584869"}}},{"totalTime":"23:19.771","bestTime":"1:31.082","bestLap":3,"bestSpeed":100.393,"numberOfLaps":15,"diffClass":{"timeDifference":"30.465","lapsBehind":0},"difference":{"timeDifference":"1:03.824","lapsBehind":0},"position":16,"startNumber":"178","name":"RANDALL JOE","resultClass":"GTC4","positionInClass":4,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"1623103"}}},{"totalTime":"23:20.513","bestTime":"1:31.300","bestLap":6,"bestSpeed":100.153,"numberOfLaps":15,"diffClass":{"timeDifference":"31.207","lapsBehind":0},"difference":{"timeDifference":"1:04.566","lapsBehind":0},"position":17,"startNumber":"999","name":"RICK STAFFORD","resultClass":"GTC4","positionInClass":5,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"4567827"}}},{"totalTime":"23:20.752","bestTime":"1:31.032","bestLap":13,"bestSpeed":100.448,"numberOfLaps":15,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"1:04.805","lapsBehind":0},"position":18,"startNumber":"96","name":"CARL TALLARDY","resultClass":"GTP2","positionInClass":1,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"36233"}}},{"totalTime":"23:31.368","bestTime":"1:31.846","bestLap":13,"bestSpeed":99.558,"numberOfLaps":15,"diffClass":{"timeDifference":"42.062","lapsBehind":0},"difference":{"timeDifference":"1:15.421","lapsBehind":0},"position":19,"startNumber":"08","name":"JOE STILL","resultClass":"GTC4","positionInClass":6,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"7504842"}}},{"totalTime":"23:38.170","bestTime":"1:32.820","bestLap":10,"bestSpeed":98.513,"numberOfLaps":15,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"1:22.223","lapsBehind":0},"position":20,"startNumber":"44","name":"MIKE McMENAMIN","resultClass":"GTC3","positionInClass":1,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"8778118"}}},{"totalTime":"23:44.189","bestTime":"1:31.633","bestLap":5,"bestSpeed":99.789,"numberOfLaps":15,"diffClass":{"timeDifference":"1:08.545","lapsBehind":0},"difference":{"timeDifference":"1:28.242","lapsBehind":0},"position":21,"startNumber":"496","name":"LES LONG","resultClass":"GTA2","positionInClass":3,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"653675"}}},{"totalTime":"23:47.646","bestTime":"1:32.915","bestLap":6,"bestSpeed":98.413,"numberOfLaps":15,"diffClass":{"timeDifference":"9.476","lapsBehind":0},"difference":{"timeDifference":"1:31.699","lapsBehind":0},"position":22,"startNumber":"3","name":"KEN LABORDE","resultClass":"GTC3","positionInClass":2,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-2f92ede683494136b4ca95c5d935309e","productCategory":0,"chip":{"code":"1285906"}}},{"totalTime":"22:20.913","bestTime":"1:33.810","bestLap":8,"bestSpeed":97.474,"numberOfLaps":14,"diffClass":{"timeDifference":"0.000","lapsBehind":1},"difference":{"timeDifference":"0.000","lapsBehind":1},"position":23,"startNumber":"022","name":"ROB PURVIANCE","resultClass":"GTC3","positionInClass":3,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-ffd9daa8ff6e4ae192df58129700e728","productCategory":0,"chip":{"code":"2092130"}}},{"totalTime":"22:23.154","bestTime":"1:33.061","bestLap":8,"bestSpeed":98.258,"numberOfLaps":14,"diffClass":{"timeDifference":"0.000","lapsBehind":1},"difference":{"timeDifference":"2.241","lapsBehind":1},"position":24,"startNumber":"259","name":"DWIGHT KELLY","resultClass":"GTA1","positionInClass":2,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-7c3008eb12a8428fa530dc6577be03eb","productCategory":0,"chip":{"code":"2858646"}}},{"totalTime":"22:51.393","bestTime":"1:35.252","bestLap":4,"bestSpeed":95.998,"numberOfLaps":14,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"30.480","lapsBehind":1},"position":25,"startNumber":"56","name":"LARRY HEBENSTREIT","resultClass":"GT3","positionInClass":1,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"2951102"}}},{"totalTime":"22:51.691","bestTime":"1:33.149","bestLap":6,"bestSpeed":98.165,"numberOfLaps":14,"diffClass":{"timeDifference":"0.000","lapsBehind":1},"difference":{"timeDifference":"30.778","lapsBehind":1},"position":26,"startNumber":"680","name":"ANDREW JOHNSON","resultClass":"GTC6","positionInClass":8,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-c0d79a2a92b546638fc0051ee5d6162d","productCategory":200,"chip":{"code":"7262969"}}},{"totalTime":"22:52.886","bestTime":"1:34.334","bestLap":4,"bestSpeed":96.932,"numberOfLaps":14,"diffClass":{"timeDifference":"31.973","lapsBehind":1},"difference":{"timeDifference":"31.973","lapsBehind":1},"position":27,"startNumber":"902","name":"JACK GILSDORF","resultClass":"GTC3","positionInClass":4,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"190284"}}},{"totalTime":"22:54.466","bestTime":"1:34.963","bestLap":3,"bestSpeed":96.29,"numberOfLaps":14,"diffClass":{"timeDifference":"31.312","lapsBehind":1},"difference":{"timeDifference":"33.553","lapsBehind":1},"position":28,"startNumber":"823","name":"BRIAN ANDERSON","resultClass":"GTA1","positionInClass":3,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-584d627c7d634b6a89d933a3e779de60","productCategory":0,"chip":{"code":"5072589"}}},{"totalTime":"22:56.031","bestTime":"1:35.111","bestLap":6,"bestSpeed":96.14,"numberOfLaps":14,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"35.118","lapsBehind":1},"position":29,"startNumber":"45","name":"JAMES STANISLAW","resultClass":"K","positionInClass":1,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"2148490"}}},{"totalTime":"22:56.738","bestTime":"1:34.814","bestLap":7,"bestSpeed":96.441,"numberOfLaps":14,"diffClass":{"timeDifference":"35.825","lapsBehind":1},"difference":{"timeDifference":"35.825","lapsBehind":1},"position":30,"startNumber":"110","name":"MIKE COURTNEY","resultClass":"GTC3","positionInClass":5,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"3341075"}}},{"totalTime":"23:01.289","bestTime":"1:34.820","bestLap":6,"bestSpeed":96.435,"numberOfLaps":14,"diffClass":{"timeDifference":"9.896","lapsBehind":0},"difference":{"timeDifference":"40.376","lapsBehind":1},"position":31,"startNumber":"836","name":"KENNETH GREENBERG","resultClass":"GT3","positionInClass":2,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-ca945e24625b4269a8a4e26d1979c1bb","productCategory":0,"chip":{"code":"896403"}}},{"totalTime":"23:05.713","bestTime":"1:36.482","bestLap":7,"bestSpeed":94.774,"numberOfLaps":14,"diffClass":{"timeDifference":"0.000","lapsBehind":1},"difference":{"timeDifference":"44.800","lapsBehind":1},"position":32,"startNumber":"116","name":"GEORGE TSANTES","resultClass":"GTC4","positionInClass":7,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-26e2c8c0d3e447f8a3300b7e1085ffb1","productCategory":200,"chip":{"code":"2780979"}}},{"totalTime":"23:19.008","bestTime":"1:36.698","bestLap":7,"bestSpeed":94.562,"numberOfLaps":14,"diffClass":{"timeDifference":"58.095","lapsBehind":1},"difference":{"timeDifference":"58.095","lapsBehind":1},"position":33,"startNumber":"324","name":"ANTON DIAS PERERA","resultClass":"GTC3","positionInClass":6,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-0f0134f5997f4e369b411810146e8ade","productCategory":0,"chip":{"code":"4821134"}}},{"totalTime":"23:20.474","bestTime":"1:37.045","bestLap":4,"bestSpeed":94.224,"numberOfLaps":14,"diffClass":{"timeDifference":"24.443","lapsBehind":0},"difference":{"timeDifference":"59.561","lapsBehind":1},"position":34,"startNumber":"540","name":"JOHN GRALTON","resultClass":"K","positionInClass":2,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-7ab663b65fb340d390663aeb7c356e23","productCategory":0,"chip":{"code":"1352774"}}},{"totalTime":"23:29.547","bestTime":"1:38.163","bestLap":4,"bestSpeed":93.151,"numberOfLaps":14,"diffClass":{"timeDifference":"33.516","lapsBehind":0},"difference":{"timeDifference":"1:08.634","lapsBehind":1},"position":35,"startNumber":"12","name":"PRICE FORD","resultClass":"K","positionInClass":3,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"2593615"}}},{"totalTime":"23:58.812","bestTime":"1:38.976","bestLap":12,"bestSpeed":92.386,"numberOfLaps":14,"diffClass":{"timeDifference":"1:07.419","lapsBehind":0},"difference":{"timeDifference":"1:37.899","lapsBehind":1},"position":36,"startNumber":"931","name":"BOB HAHNEMANN","resultClass":"GT3","positionInClass":3,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":"MYLAPS-GA-d3f0f116d1e3466fbc5426d9c8ded06f","productCategory":0,"chip":{"code":"527581"}}},{"totalTime":"23:10.937","bestTime":"1:42.086","bestLap":10,"bestSpeed":89.572,"numberOfLaps":13,"diffClass":{"timeDifference":"0.000","lapsBehind":1},"difference":{"timeDifference":"0.000","lapsBehind":2},"position":37,"startNumber":"234","name":"MARK REED","resultClass":"K","positionInClass":4,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"8618036"}}},{"totalTime":"23:22.618","bestTime":"1:28.510","bestLap":2,"bestSpeed":103.31,"numberOfLaps":9,"diffClass":{"timeDifference":"0.000","lapsBehind":6},"difference":{"timeDifference":"0.000","lapsBehind":6},"position":38,"startNumber":"918","name":"JACK McCARTHY","resultClass":"GTC6","positionInClass":9,"additionalFields":[],"isQualified":true,"status":"Normal","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"953345"}}},{"totalTime":"21:35.621","bestTime":"1:34.065","bestLap":6,"bestSpeed":97.209,"numberOfLaps":13,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":39,"startNumber":"64","name":"DWAYNE MOSES","resultClass":"GTC3","positionInClass":0,"additionalFields":[],"isQualified":false,"status":"DNF","user":{"mstUserId":"MYLAPS-GA-00ea0b9493d242019acbd8a2fed4d2c1","productCategory":0,"chip":{"code":"4283750"}}},{"totalTime":"20:08.484","bestTime":"1:35.394","bestLap":3,"bestSpeed":95.855,"numberOfLaps":12,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":40,"startNumber":"133","name":"MICHAEL BELER","resultClass":"GTC3","positionInClass":0,"additionalFields":[],"isQualified":false,"status":"DNF","user":{"mstUserId":"MYLAPS-GA-12da982883e747a69e65376d35171f90","productCategory":200,"chip":{"code":"2490187"}}},{"totalTime":"21:29.793","bestTime":"1:28.879","bestLap":5,"bestSpeed":102.881,"numberOfLaps":12,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":41,"startNumber":"117","name":"GARY JENSEN","resultClass":"GTC6","positionInClass":0,"additionalFields":[],"isQualified":false,"status":"DNF","user":{"mstUserId":"MYLAPS-GA-f8538b83041248e799c5c13ace49eb10","productCategory":200,"chip":{"code":"2227625"}}},{"totalTime":"14:30.717","bestTime":"1:31.318","bestLap":7,"bestSpeed":100.134,"numberOfLaps":9,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":42,"startNumber":"92","name":"JERRY GREENE","resultClass":"GTC3","positionInClass":0,"additionalFields":[],"isQualified":false,"status":"DNF","user":{"mstUserId":"MYLAPS-GA-d74f2e46f01e43d1ad01fc9e6c60ffbd","productCategory":0,"chip":{"code":"1256452"}}},{"totalTime":"12:31.146","bestTime":"1:29.153","bestLap":4,"bestSpeed":102.565,"numberOfLaps":8,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":43,"startNumber":"21","name":"GRADY WILLINGHAM","resultClass":"GTC5","positionInClass":0,"additionalFields":[],"isQualified":false,"status":"DNF","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"2831675"}}},{"totalTime":"12:58.088","bestTime":"1:33.453","bestLap":6,"bestSpeed":97.846,"numberOfLaps":8,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":44,"startNumber":"03","name":"DAVID HERRINGTON","resultClass":"GTC3","positionInClass":0,"additionalFields":[],"isQualified":false,"status":"DNF","user":{"mstUserId":"MYLAPS-GA-6b6ada78aa77401ea428c2da6c609816","productCategory":200,"chip":{"code":"6617056"}}},{"totalTime":"9:24.237","bestTime":"1:29.228","bestLap":4,"bestSpeed":102.479,"numberOfLaps":6,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":45,"startNumber":"91","name":"JOSEPH LOMBARDO","resultClass":"GTC5","positionInClass":0,"additionalFields":[],"isQualified":false,"status":"DNF","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"7363796"}}},{"totalTime":"4:13.424","bestTime":"1:38.902","bestLap":1,"bestSpeed":92.455,"numberOfLaps":2,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":46,"startNumber":"194","name":"DAVID EDWARDS","resultClass":"GTC3","positionInClass":0,"additionalFields":[],"isQualified":false,"status":"DNF","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"8020170"}}},{"totalTime":"4:28.898","bestTime":"1:36.506","bestLap":1,"bestSpeed":94.751,"numberOfLaps":2,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":47,"startNumber":"17","name":"ANDREW GUCCIARDI","resultClass":"GTC5","positionInClass":0,"additionalFields":[],"isQualified":false,"status":"DNF","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"5445537"}}},{"totalTime":"2:54.809","bestTime":"0.000","bestLap":0,"bestSpeed":0.0,"numberOfLaps":1,"diffClass":{"timeDifference":"0.000","lapsBehind":0},"difference":{"timeDifference":"0.000","lapsBehind":0},"position":48,"startNumber":"901","name":"PHIL GILSDORF","resultClass":"GTC3","positionInClass":0,"additionalFields":[],"isQualified":false,"status":"DNF","user":{"mstUserId":null,"productCategory":0,"chip":{"code":"154711"}}}],"classes":["GTC6","GTA3","GTA2","GTA1","GTC4","GTC5","GTP2","GTC3","GT3","K"]};
                var maxNumberOfLaps = ClassificationModel.rows[0].numberOfLaps;
                if (window.matchMedia('(max-width: 767px)').matches) {
                    WIDTH = $('.session-details-header').outerWidth() - 140;
                    $('.svg-chart').css('width', WIDTH);
                    $('.svg-chart').css('left', 70);
                }
                else {
                    WIDTH = $('.session-details-header').outerWidth() - 330;
                }
                $.each(data, function (index, value) {
                    if(value != null){
                        if (numberOfRacers > 1) {
                            if (value.lapDataInfo != null) {
                                orderdData.push(value);
                            }
                        }
                        else if (numberOfRacers == 1) {
                            if (value.lapDataInfo != null) {
                                orderdData.push(value);
                            }
                        }
                    }
                })

                if (orderdData.length != 0) {
                    firstLapNr = orderdData[0].lapDataInfo.firstLapNr;

                    orderdData.sort(function (a, b) {
                        if (a.lapDataInfo.participantInfo.startPos< b.lapDataInfo.participantInfo.startPos) {
                            return -1;
                        }
                        else if (a.lapDataInfo.participantInfo.startPos> b.lapDataInfo.participantInfo.startPos) {
                            return 1;
                        }
                        return 0;
                    });
                    xScalee = d3.scale.linear().range([MARGINS.left, WIDTH - MARGINS.right]);
                    yScalee = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]);
                    xScalee.domain([0, maxNumberOfLaps]);
                    yScalee.domain([numberOfRacers, 1]);

                    if (maxNumberOfLaps <= 6) {
                        (window.matchMedia('(min-width:320px) and (max-width: 991px)').matches) ? increment = 1 : increment = 1;
                    }
                    else if (maxNumberOfLaps <= 20) {
                        (window.matchMedia('(min-width:320px) and (max-width: 991px)').matches) ? increment = 3 : increment = 1;
                    }
                    else if (maxNumberOfLaps <= 50) {
                        (window.matchMedia('(min-width:320px) and (max-width: 991px)').matches) ? increment = 10 : increment = 5;
                    }
                    else if (maxNumberOfLaps <= 100) {
                        (window.matchMedia('(min-width:320px) and (max-width: 991px)').matches) ? increment = 30 : increment = 10;
                    }
                    else if (maxNumberOfLaps <= 1000) {
                        (window.matchMedia('(min-width:320px) and (max-width: 991px)').matches) ? increment = 200 : increment = 100;
                    }
                    else {
                        increment = 500;
                    }

                    for (var i = 0; i <= maxNumberOfLaps - increment; i += increment) {
                        xAxisTickValues.push(i);
                    }
                    xAxisTickValues.push(maxNumberOfLaps);

                    //create x, y axis
                    xAxis = d3.svg.axis()
                        .scale(xScalee)
                        .tickValues(xAxisTickValues)
                        .tickFormat(d3.format("d"))
                        .tickPadding(-3);

                    yAxis = d3.svg.axis()
                        .scale(yScalee)
                        .orient("left");

                    svg = d3.select(".svg-chart").append("svg")
                        .attr("width", WIDTH)
                        .attr("height", HEIGHT);

                    svg.append("svg:g")
                        .attr("class", "x axis")
                        .attr("fill", "#94979c")
                        .call(xAxis);

                    orderdData = orderdData.filter(function (obj) {
                        return obj.lapDataInfo.participantInfo.startPos !== null;
                    });

                    var startPosArray = orderdData.map(function (item) { return item.lapDataInfo.participantInfo.startPos });
                    haveDuplicateRacers = startPosArray.some(function (item, idx) {
                        return startPosArray.indexOf(item) != idx
                    });

                    orderdData = orderdData.filter(function (obj) {
                        return (obj.lapDataInfo.lapCount != 0 && obj.lapDataInfo.allLapsHaveFieldPos);
                    });
                    for (var i = 0; i < orderdData.length; i++) {
                        if (i % 3 == 0) {
                            colorIndex = 0;
                        }
                        var line = d3.svg.line()
                            .x(function (d) {
                                if(d.lapNr == null){
                                    return 0;
                                }
                                return xScalee(d.lapNr);
                            })
                            .y(function (d) {
                                if (haveDuplicateRacers) {
                                    if(d.fieldComparison == null){
                                        return 0;
                                    }
                                    return yScalee(d.fieldComparison.position + 1);
                                }
                                else {
                                    if(d.fieldComparison == null){
                                        return 0;
                                    }
                                    return yScalee(d.fieldComparison.position);
                                }
                            })
                            .interpolate('cardinal')
                            .tension(0.8);

                        orderdData[i].laps.unshift({ "lapNr": 0, "fieldComparison": { "position": orderdData[i].lapDataInfo.participantInfo.startPos } });

                        svg.append('svg:path')
                            .attr('d', line(orderdData[i].laps))
                            .attr('class', 'line-graph color' + colorIndex + ' startPosition' + orderdData[i].lapDataInfo.participantInfo.startPos+ '')
                            .attr('stroke', '#94979c')
                            .attr('stroke-width', 2)
                            .attr('fill', 'none')
                            .attr('cursor', 'pointer')
                            .attr("transform", "translate(0," + (MARGINS.top + 15) + ")")
                            .on("mouseover", function() {
                                lineElement = d3.select(this);
                                startClass = lineElement.attr('class').split("startPosition");
                                if (startClass[1].length > 7) {
                                    startClass = startClass[1].split(" ");
                                    $('.row-event').find('.startPosition' + startClass[0]).children().toggleClass("hovered");
                                }
                                else {
                                    $('.row-event').find('.startPosition' + startClass[1]).children().toggleClass("hovered");
                                }
                                if (!lineElement.classed("hovered")) {
                                    lineElement
                                        .attr('stroke-width', 4)
                                        .classed("hovered", true);
                                }
                            })
                            .on("mouseout", function() {
                                lineElement = d3.select(this);
                                startClass = lineElement.attr('class').split("startPosition");
                                if (startClass[1].length > 7) {
                                    startClass = startClass[1].split(" ");
                                    $('.row-event').find('.startPosition' + startClass[0]).children().toggleClass("hovered");
                                }
                                else {
                                    $('.row-event').find('.startPosition' + startClass[1]).children().toggleClass("hovered");
                                }
                                if (!lineElement.classed("selected")) {
                                    lineElement
                                        .style("stroke", "#94979c")
                                        .attr('stroke-width', 2)
                                        .classed("hovered", false);
                                }
                                else {
                                    lineElement
                                        .style("stroke", "#94979c")
                                        .attr('stroke-width', 4)
                                        .classed("hovered", false);
                                }
                            })
                            .on("click", function () {
                                lineElement = d3.select(this);
                                startClass = lineElement.attr('class').split("startPosition");
                                if (startClass[1].length > 7) {
                                    startClass = startClass[1].split(" ");
                                    $('.row-event').find('.startPosition' + startClass[0]).children().toggleClass("selected");
                                }
                                else {
                                    $('.row-event').find('.startPosition' + startClass[1]).children().toggleClass("selected");
                                }
                                if (!lineElement.classed("selected")) {
                                    lineElement
                                        .attr('stroke-width', 4)
                                        .classed("selected", true)
                                }
                                else {
                                    lineElement
                                        .style("stroke", "#94979c")
                                        .attr('stroke-width', 2)
                                        .classed("selected", false);
                                }
                            });
                        colorIndex++;
                    }
                    d3.select('svg').attr("height", HEIGHT + 30);
                }
            }

            $(document).ready(function () {
                $("body").on('click', '.lapchart-results .row-event-position:not(.unselectable) > span, .lapchart-results .row-event-competitor:not(.unselectable) > span, .lapchart-results .row-event-racenumber:not(.unselectable) > span'
                    ,function () {
                        var startClass, lineElement;
                        if ($(this) == "row-event-position-back") {
                            startClass = $(this).parent().attr('class').split("startPosition");
                        }
                        else {
                            startClass = $(this).parent().attr('class').split("startPosition");
                        }
                        $('.row-event').find('.startPosition' + startClass[1]).children().toggleClass("selected");
                        lineElement = d3.select('path.startPosition' + startClass[1] + '');
                        if(!lineElement.empty()){
                            if (!lineElement.classed("selected")) {
                                lineElement
                                    .attr('stroke-width', 4)
                                    .classed("selected", true);
                            }
                            else{
                                lineElement
                                    .style("stroke", "#94979c")
                                    .attr('stroke-width', 2)
                                    .classed("selected", false);
                            }
                        }
                    });

                //region position hover effect
                $("body").on('mouseover', '.lapchart-results .row-event-position:not(.unselectable) > span', function() {
                    var startClass, lineElement;
                    if (!$(this).hasClass("selected")){
                        startClass = $(this).parent().attr('class').split("startPosition");
                        $('.row-event').find('.startPosition' + startClass[1]).children().toggleClass("hovered");
                        lineElement = d3.select('path.startPosition' + startClass[1] + '');
                        if(!lineElement.empty()){
                            if (!lineElement.classed("hovered")) {
                                lineElement
                                    .attr('stroke-width', 4)
                                    .classed("hovered", true);
                            }
                            else{
                                lineElement
                                    .style("stroke", "#94979c")
                                    .attr('stroke-width', 2)
                                    .classed("hovered", false);

                            }
                        }
                    }
                }).on('mouseout', '.lapchart-results .row-event-position:not(.unselectable) > span', function() {
                    var startClass, lineElement;
                    if (!$(this).hasClass("selected")){
                        startClass = $(this).parent().attr('class').split("startPosition");
                        $('.row-event').find('.startPosition' + startClass[1]).children().toggleClass("hovered");
                        lineElement = d3.select('path.startPosition' + startClass[1] + '');
                        if(!lineElement.empty()){
                            if (!lineElement.classed("hovered")) {
                                lineElement
                                    .attr('stroke-width', 4)
                                    .classed("hovered", true);
                            }
                            else{
                                lineElement
                                    .style("stroke", "#94979c")
                                    .attr('stroke-width', 2)
                                    .classed("hovered", false);

                            }
                        }
                    }
                });
                //end region hover effect

                //region hover competitor name
                $("body").on('mouseover', '#lapchart-results .row-event-competitor, #lapchart-results .row-event-racenumber', function() {
                    var startClass, lineElement;
                    startClass = $(this).attr('class').split("startPosition");
                    lineElement = d3.select('path.startPosition' + startClass[1] + '');
                    if (!lineElement.classed("selected")){
                        if (!lineElement.classed("hovered")){
                            $('.row-event').find('.startPosition' + startClass[1]).children().toggleClass("hovered");
                            if (!lineElement.empty()) {
                                if (!lineElement.classed("hovered")) {
                                    lineElement
                                        .attr('stroke-width', 4)
                                        .classed("hovered", true);
                                }
                                else {
                                    lineElement
                                        .style("stroke", "#94979c")
                                        .attr('stroke-width', 2)
                                        .classed("hovered", false);
                                }
                            }
                        }
                    }
                }).on('mouseout', '#lapchart-results .row-event-competitor, #lapchart-results .row-event-racenumber', function() {
                    var startClass, lineElement;
                    startClass = $(this).attr('class').split("startPosition");
                    lineElement = d3.select('path.startPosition' + startClass[1] + '');
                    if (!lineElement.classed("selected")){
                        $('.row-event').find('.startPosition' + startClass[1]).children().toggleClass("hovered");
                        if (!lineElement.empty()) {
                            if (!lineElement.classed("hovered")) {
                                lineElement
                                    .attr('stroke-width', 4)
                                    .classed("hovered", true);
                            }
                            else {
                                lineElement
                                    .style("stroke", "#94979c")
                                    .attr('stroke-width', 2)
                                    .classed("hovered", false);
                            }
                        }
                    }
                });
                //endregion hover competitor name

                (function ($, sr) {

                    var debounce = function (func, threshold, execAsap) {
                        var timeout;

                        return function debounced() {
                            var obj = this, args = arguments;
                            function delayed() {
                                if (!execAsap)
                                    func.apply(obj, args);
                                timeout = null;
                            };

                            if (timeout)
                                clearTimeout(timeout);
                            else if (execAsap)
                                func.apply(obj, args);

                            timeout = setTimeout(delayed, threshold || 100);
                        };
                    }

                    jQuery.fn[sr] = function (fn) { return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

                })(jQuery, 'smartresize');
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
