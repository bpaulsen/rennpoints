package TestsFor::RennPoints::PCA;
use Test::Class::Moose;
use RennPoints::PCA;
use File::Basename qw(dirname);

    # methods that begin with test_ are test methods.
sub test_parse_events {
    my $test = shift;

    my $dir = dirname( $INC{ 'PCA.pm' } );
    $dir .= "/PCA";
    isa_ok my $pca = RennPoints::PCA->new( content => getContent(), zip_directory => $dir ), 'RennPoints::PCA';
    
    is @{$pca->events}, 214, "Testing number of events that were parsed";
}

sub test_url {
    my $test = shift;

    isa_ok my $pca = RennPoints::PCA->new( content => getContent() ), 'RennPoints::PCA';
    ok $pca->url, 'test that URL is not null';
}

sub getContent {
my $content =<<'EOF';
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" version="XHTML+RDFa 1.0" dir="ltr"
  xmlns:content="http://purl.org/rss/1.0/modules/content/"
  xmlns:dc="http://purl.org/dc/terms/"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:og="http://ogp.me/ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:sioc="http://rdfs.org/sioc/ns#"
  xmlns:sioct="http://rdfs.org/sioc/types#"
  xmlns:skos="http://www.w3.org/2004/02/skos/core#"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema#">

<head profile="http://www.w3.org/1999/xhtml/vocab">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="https://www.pca.org/sites/default/files/pcaFavicon_10.png" type="image/png" />
<meta name="Generator" content="Drupal 7 (http://drupal.org)" />

  <meta name="MobileOptimized" content="width">
  <meta name="HandheldFriendly" content="true">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Race Results | Porsche Club of America</title>
  <link type="text/css" rel="stylesheet" href="https://www.pca.org/sites/default/files/css/css_xE-rWrJf-fncB6ztZfd2huxqgxu4WO-qwma6Xer30m4.css" media="all" />
<link type="text/css" rel="stylesheet" href="https://www.pca.org/sites/default/files/css/css_WmJ8EmIF-d26U88srujGpw2YxSuENiJKbtiN7ZbZkM8.css" media="all" />
<link type="text/css" rel="stylesheet" href="https://www.pca.org/sites/default/files/css/css_hUEDNI2DAfBLk6QfLVQih-4Pyw2Zxs01-JmHc5BKpe8.css" media="all" />
<link type="text/css" rel="stylesheet" href="https://www.pca.org/sites/default/files/css/css_PxkluuRL5KHEl2kZMFlfzEYJx0wcUrxbGO6_eFQkLoU.css" media="all" />
<link type="text/css" rel="stylesheet" href="https://www.pca.org/sites/default/files/css/css_6d0scSgGjaDr5YHlv512TgeLigMmk-vMwDxi-CegzjQ.css" media="print" />

<!--[if ie 8]>
<link type="text/css" rel="stylesheet" href="https://www.pca.org/sites/default/files/css/css_wtFs_6kuA8AK75BQDA-2hwAE6ck_IeZuNFWRRutgPFA.css" media="all" />
<![endif]-->
<link type="text/css" rel="stylesheet" href="https://www.pca.org/sites/default/files/css/css__zhNlFuk_81rKnb5YdIDPLE53zd8xm0sRJ_R6EOiQfw.css" media="all" />
  <script type="text/javascript" src="https://www.pca.org/sites/default/files/js/js_Xjzh1hVfcgVAixhmmB6Go8TUMPOiprA-2vkC-oWXARQ.js"></script>
<script type="text/javascript" src="https://www.pca.org/sites/default/files/js/js_45JniWrXrY8q8AEVIV6GFupI5scizolw-FrujytMgiY.js"></script>
<script type="text/javascript" src="https://www.pca.org/sites/default/files/js/js_uiF75tUtWsZIPud4DMk7FvzKr_zA8oqdtm3l-SnQKJ0.js"></script>
<script type="text/javascript" src="https://www.pca.org/sites/default/files/js/js_KATLIwJ3DJmQSFKi_5p8ZPP1b-Ofn-zn4sHrVpBEFz8.js"></script>
<script type="text/javascript">
<!--//--><![CDATA[//><!--
(function(i,s,o,g,r,a,m){i["GoogleAnalyticsObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,"script","//www.google-analytics.com/analytics.js","ga");ga("create", "UA-30100889-1", {"cookieDomain":"auto"});ga("send", "pageview");
//--><!]]>
</script>
<script type="text/javascript" src="https://www.pca.org/sites/default/files/js/js_udeNf72_m1WhMKOcJQbDdthFNb4gmYUylmUG9MPzZ8I.js"></script>
<script type="text/javascript">
<!--//--><![CDATA[//><!--
jQuery.extend(Drupal.settings, {"basePath":"\/","pathPrefix":"","ajaxPageState":{"theme":"pca","theme_token":"qrIB9PD5Y89RDaEisDQwazLPRtsCv5NKAbNRNgcMTAM","js":{"misc\/jquery.js":1,"misc\/jquery.once.js":1,"misc\/drupal.js":1,"sites\/all\/modules\/contrib\/nice_menus\/js\/jquery.bgiframe.js":1,"sites\/all\/modules\/contrib\/nice_menus\/js\/jquery.hoverIntent.js":1,"sites\/all\/modules\/contrib\/nice_menus\/js\/superfish.js":1,"sites\/all\/modules\/contrib\/nice_menus\/js\/nice_menus.js":1,"sites\/all\/modules\/contrib\/admin_menu\/admin_devel\/admin_devel.js":1,"sites\/all\/modules\/contrib\/extlink\/extlink.js":1,"sites\/all\/libraries\/colorbox\/jquery.colorbox-min.js":1,"sites\/all\/modules\/contrib\/colorbox\/js\/colorbox.js":1,"sites\/all\/modules\/contrib\/colorbox\/styles\/default\/colorbox_style.js":1,"sites\/all\/modules\/contrib\/lightbox2\/js\/lightbox.js":1,"sites\/all\/modules\/contrib\/video\/js\/video.js":1,"sites\/all\/themes\/pca\/js\/views-csv.js":1,"sites\/all\/modules\/contrib\/google_analytics\/googleanalytics.js":1,"0":1,"sites\/all\/themes\/pca\/js\/pca.js":1,"sites\/all\/themes\/pca\/js\/flowtype.js":1},"css":{"modules\/system\/system.base.css":1,"modules\/system\/system.menus.css":1,"modules\/system\/system.messages.css":1,"modules\/system\/system.theme.css":1,"sites\/all\/modules\/contrib\/calendar\/css\/calendar_multiday.css":1,"modules\/comment\/comment.css":1,"sites\/all\/modules\/contrib\/date\/date_api\/date.css":1,"sites\/all\/modules\/contrib\/date\/date_popup\/themes\/datepicker.1.7.css":1,"modules\/field\/theme\/field.css":1,"sites\/all\/modules\/contrib\/logintoboggan\/logintoboggan.css":1,"modules\/node\/node.css":1,"modules\/search\/search.css":1,"sites\/all\/modules\/contrib\/ubercart\/uc_order\/uc_order.css":1,"sites\/all\/modules\/contrib\/ubercart\/uc_product\/uc_product.css":1,"sites\/all\/modules\/contrib\/ubercart\/uc_store\/uc_store.css":1,"modules\/user\/user.css":1,"sites\/all\/modules\/contrib\/views\/css\/views.css":1,"sites\/all\/modules\/contrib\/extlink\/extlink.css":1,"sites\/all\/modules\/contrib\/ckeditor\/css\/ckeditor.css":1,"sites\/all\/modules\/contrib\/colorbox\/styles\/default\/colorbox_style.css":1,"sites\/all\/modules\/contrib\/ctools\/css\/ctools.css":1,"sites\/all\/modules\/contrib\/lexicon\/css\/lexicon.css":1,"sites\/all\/modules\/contrib\/lightbox2\/css\/lightbox.css":1,"sites\/all\/modules\/contrib\/panels\/css\/panels.css":1,"sites\/all\/modules\/contrib\/video\/css\/video.css":1,"sites\/all\/modules\/contrib\/nice_menus\/css\/nice_menus.css":1,"sites\/all\/modules\/contrib\/nice_menus\/css\/nice_menus_default.css":1,"sites\/all\/libraries\/fontawesome\/css\/font-awesome.css":1,"sites\/all\/themes\/pca\/css\/styles.css":1,"sites\/all\/themes\/pca\/css\/print.css":1,"sites\/all\/themes\/pca\/css\/ie8.css":1,"cpn_global":1}},"colorbox":{"opacity":"0.85","current":"{current} of {total}","previous":"\u00ab Prev","next":"Next \u00bb","close":"Close","maxWidth":"98%","maxHeight":"98%","fixed":true,"mobiledetect":true,"mobiledevicewidth":"480px"},"lightbox2":{"rtl":0,"file_path":"\/(\\w\\w\/)public:\/","default_image":"\/sites\/all\/modules\/contrib\/lightbox2\/images\/brokenimage.jpg","border_size":10,"font_color":"000","box_color":"fff","top_position":"","overlay_opacity":"0.8","overlay_color":"000","disable_close_click":1,"resize_sequence":0,"resize_speed":400,"fade_in_speed":400,"slide_down_speed":600,"use_alt_layout":0,"disable_resize":0,"disable_zoom":0,"force_show_nav":0,"show_caption":0,"loop_items":0,"node_link_text":"View Image Details","node_link_target":0,"image_count":"Image !current of !total","video_count":"Video !current of !total","page_count":"Page !current of !total","lite_press_x_close":"press \u003Ca href=\u0022#\u0022 onclick=\u0022hideLightbox(); return FALSE;\u0022\u003E\u003Ckbd\u003Ex\u003C\/kbd\u003E\u003C\/a\u003E to close","download_link_text":"","enable_login":false,"enable_contact":false,"keys_close":"c x 27","keys_previous":"p 37","keys_next":"n 39","keys_zoom":"z","keys_play_pause":"32","display_image_size":"original","image_node_sizes":"()","trigger_lightbox_classes":"","trigger_lightbox_group_classes":"","trigger_slideshow_classes":"","trigger_lightframe_classes":"","trigger_lightframe_group_classes":"","custom_class_handler":0,"custom_trigger_classes":"","disable_for_gallery_lists":true,"disable_for_acidfree_gallery_lists":true,"enable_acidfree_videos":true,"slideshow_interval":5000,"slideshow_automatic_start":true,"slideshow_automatic_exit":true,"show_play_pause":true,"pause_on_next_click":false,"pause_on_previous_click":true,"loop_slides":false,"iframe_width":600,"iframe_height":400,"iframe_border":1,"enable_video":0,"useragent":"Mozilla\/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit\/603.1.30 (KHTML, like Gecko) Version\/10.1 Safari\/603.1.30"},"better_exposed_filters":{"views":{"race_results":{"displays":{"page":{"filters":[]}}}}},"nice_menus_options":{"delay":800,"speed":"slow"},"extlink":{"extTarget":"_blank","extClass":"ext","extLabel":"(link is external)","extImgClass":0,"extSubdomains":1,"extExclude":"","extInclude":"","extCssExclude":"","extCssExplicit":"","extAlert":0,"extAlertText":"This link will take you to an external web site.","mailtoClass":"mailto","mailtoLabel":"(link sends e-mail)"},"googleanalytics":{"trackOutbound":1,"trackMailto":1,"trackDownload":1,"trackDownloadExtensions":"7z|aac|arc|arj|asf|asx|avi|bin|csv|doc(x|m)?|dot(x|m)?|exe|flv|gif|gz|gzip|hqx|jar|jpe?g|js|mp(2|3|4|e?g)|mov(ie)?|msi|msp|pdf|phps|png|ppt(x|m)?|pot(x|m)?|pps(x|m)?|ppam|sld(x|m)?|thmx|qtm?|ra(m|r)?|sea|sit|tar|tgz|torrent|txt|wav|wma|wmv|wpd|xls(x|m|b)?|xlt(x|m)|xlam|xml|z|zip","trackColorbox":1},"urlIsAjaxTrusted":{"\/race-results":true}});
//--><!]]>
</script>
  <!-- typography.com fonts -->
  <link rel="stylesheet" type="text/css" href="//cloud.typography.com/7926452/728644/css/fonts.css" />
</head>
<body class="html not-front not-logged-in no-sidebars page-race-results" >
  <div id="skip-link">
    <a href="#main-content" class="element-invisible element-focusable">Skip to main content</a>
  </div>
    <div id="page-wrapper">
  <div id="page" class="page">
    <div class="overlay"></div>
    <div id="header">
      <div class="section clearfix">
                    <div class="region region-header-left">
    <div id="block-block-1" class="block block-block">

    
  <div class="content">
    <p><a href="/"><img alt="PCA Logo" src="/sites/all/themes/pca/images/pca_logo.png" title="PCA" /></a></p>
  </div>
</div>
  </div>
        
                    <div class="region region-header-middle">
    <div id="block-block-2" class="block block-block">

    
  <div class="content">
    <div class="site-title">
<p>Porsche Club of America</p>
</div>
  </div>
</div>
  </div>
        
                    <div class="region region-header-right">
    <div id="block-pca-login-pca-login" class="block block-pca-login">

    
  <div class="content">
    <div id="login-block-content-wrapper"><a href="/user" class="button-red user-login">Member Log-in</a><a href="/user/join/membership" class="button-red user-join">Join PCA</a><a href="/renew" class="button-red user-renew">Renew</a></div><div class="clear"></div>  </div>
</div>
<div id="block-search-form" class="block block-search">

    
  <div class="content">
    <form action="/race-results" method="post" id="search-block-form" accept-charset="UTF-8">
  <div>
        <div class="container-inline">
      <h2 class="element-invisible">Search form</h2>
    <div class="form-item form-type-textfield form-item-search-block-form">
  <label class="element-invisible" for="edit-search-block-form--2">Search </label>
 <input title="Enter the terms you wish to search for." type="text" id="edit-search-block-form--2" name="search_block_form" value="" size="15" maxlength="128" class="form-text" />
</div>
<div class="form-actions form-wrapper" id="edit-actions"><input type="submit" id="edit-submit" name="op" value="Search" class="form-submit" /></div><input type="hidden" name="form_build_id" value="form-YNOoazPwxYF9p5y1eapzKXfL64J6WlwmM4TEAd_rr1Y" />
<input type="hidden" name="form_id" value="search_block_form" />
</div>
  </div>
</form>

  </div>
</div>
  </div>
              </div> <!-- /.section -->
    </div> <!-- /#header -->

            <div class="region region-main-menu">
    <div id="block-nice-menus-1" class="block block-nice-menus">

    
  <div class="content">
    <ul class="nice-menu nice-menu-down nice-menu-main-menu" id="nice-menu-1"><li class="menu-218 menu-path-front first odd "><a href="/">Home</a></li>
<li class="menu-1279 menuparent  menu-path-node-3102  even "><a href="/membership">Membership</a><ul><li class="menu-1344 menu-path-user first odd "><a href="/user" title="">My Account</a></li>
<li class="menu-2077 menu-path-node-128061  even "><a href="/join-porsche-club-america">Join</a></li>
<li class="menu-2068 menu-path-node-128060  odd "><a href="/renew">Renew</a></li>
<li class="menu-3727 menu-path-node-307145  even "><a href="/pca-test-drive">PCA Test Drive</a></li>
<li class="menu-1416 menu-path-pcawebstorecom-  odd "><a href="http://www.pcawebstore.com/" title="">Shop PCA</a></li>
<li class="menu-3276 menu-path-membership-benefits  even "><a href="/membership-benefits" title="">Membership Benefits</a></li>
<li class="menu-1364 menu-path-node-3124  odd "><a href="/activities">Activities</a></li>
<li class="menu-3828 menu-path-node-308848  even last"><a href="/porsche-values">Porsche Values</a></li>
</ul></li>
<li class="menu-3559 menuparent  menu-path-events  odd "><a href="/events" title="">Events</a><ul></ul></li>
<li class="menu-1282 menuparent  menu-path-news  even "><a href="/news" title="">News</a><ul><li class="menu-3507 menu-path-top-news first odd "><a href="/top-news" title="">Top News</a></li>
<li class="menu-4604 menu-path-trophy-east-news  even "><a href="/trophy-east-news" title="">Trophy East News</a></li>
<li class="menu-1964 menu-path-webpcaorg-indexcfmeventpotmpotmarticle  odd "><a href="http://web.pca.org/index.cfm?event=potm.potmArticle" title="">Photo Gallery</a></li>
<li class="menu-3876 menu-path-node-312822  even "><a href="/news/2016-02-05/48-hours-sebring-pca-club-race-live-feed" title="">Sebring 48 blog</a></li>
<li class="menu-3857 menu-path-node-310424  odd last"><a href="/news/2015-09-25/live-blog-rennsport-reunion-v" title="">Rennsport Reunion V blog</a></li>
</ul></li>
<li class="menu-1280 menuparent  menu-path-node-320783  odd "><a href="/panorama/edition/panorama-april-2017" title="">Magazine</a><ul><li class="menu-1348 menu-path-node-320783 first odd "><a href="/panorama/edition/panorama-april-2017" title="">New Panorama</a></li>
<li class="menu-1349 menu-path-panorama-back-issues  even "><a href="/panorama-back-issues" title="">Past Panoramas</a></li>
<li class="menu-1973 menu-path-panorama-index-search  odd "><a href="/panorama-index-search">Panorama Index</a></li>
<li class="menu-1901 menu-path-panorama-staff  even "><a href="/panorama-staff">Contact Panorama</a></li>
<li class="menu-3870 menu-path-node-312033  odd "><a href="/advertise-with-pca">Advertise with PCA</a></li>
<li class="menu-1557 menu-path-node-3108  even last"><a href="/advertiser-index">Advertiser index</a></li>
</ul></li>
<li class="menu-1285 menuparent  menu-path-browse-the-mart-classified-ads  even "><a href="/browse-the-mart-classified-ads" title="">Classifieds</a><ul><li class="menu-1743 menu-path-browse-the-mart-classified-ads first odd "><a href="/browse-the-mart-classified-ads" title="">Browse Classifieds</a></li>
<li class="menu-1426 menu-path-node-174  even "><a href="/mart-rules">Mart Rules</a></li>
<li class="menu-3878 menu-path-node-312936  odd last"><a href="/buyer-safety-tips" title="">Buyer Safety Tips</a></li>
</ul></li>
<li class="menu-1283 menuparent  menu-path-technical-question-search  odd "><a href="/technical-question-search" title="">Technical</a><ul><li class="menu-1367 menu-path-technical-question-search first odd "><a href="/technical-question-search" title="">Tech Q &amp; A</a></li>
<li class="menu-1369 menu-path-technical-committee  even "><a href="/technical-committee" title="">Experts</a></li>
<li class="menu-1370 menu-path-news  odd "><a href="/news?field_news_type_tid=1301" title="">Technical News</a></li>
<li class="menu-1371 menu-path-events  even last"><a href="/events?field_event_type_tid=224" title="">Technical Events</a></li>
</ul></li>
<li class="menu-1281 menuparent  menu-path-node-3123  even last"><a href="/contact">Connect</a><ul><li class="menu-1357 menu-path-node-3123 first odd "><a href="/contact">Contact Us</a></li>
<li class="menu-1356 menu-path-node-173  even "><a href="/about-us">About Us</a></li>
<li class="menu-1361 menu-path-node-3098  odd "><a href="/history">PCA History</a></li>
<li class="menu-3547 menu-path-node-304179  even "><a href="/about-porsche">About Porsche</a></li>
<li class="menu-1381 menu-path-region-directory  odd "><a href="/region-directory" title="">Region Directory</a></li>
<li class="menu-1385 menu-path-special-interest-groups  even "><a href="/special-interest-groups" title="">Register Groups</a></li>
<li class="menu-1903 menu-path-executive-council  odd "><a href="/executive-council" title="Contact an Executive Council member.">Executive Council</a></li>
<li class="menu-1902 menu-path-national-hq  even "><a href="/national-hq" title="Contact National HQ staff members.">National Office</a></li>
<li class="menu-1906 menu-path-zone-officials  odd "><a href="/zone-officials" title="Contact a Zone Official">Zone Officials</a></li>
<li class="menu-1905 menu-path-region-officials  even "><a href="/region-officials" title="Contact Regional officers.">Region Officials</a></li>
<li class="menu-3561 menu-path-national-committee-chairs  odd last"><a href="/national-committee-chairs" title="">National Committee Chairs</a></li>
</ul></li>
</ul>
  </div>
</div>
<div id="block-system-main-menu" class="block block-system block-menu">

    
  <div class="content">
    <ul class="menu"><li class="first collapsed"><a href="/">Home</a></li>
<li class="collapsed"><a href="/membership">Membership</a></li>
<li class="collapsed"><a href="/events" title="">Events</a></li>
<li class="collapsed"><a href="/news" title="">News</a></li>
<li class="collapsed"><a href="/panorama/edition/panorama-april-2017" title="">Magazine</a></li>
<li class="collapsed"><a href="/browse-the-mart-classified-ads" title="">Classifieds</a></li>
<li class="collapsed"><a href="/technical-question-search" title="">Technical</a></li>
<li class="last collapsed"><a href="/contact">Connect</a></li>
</ul>  </div>
</div>
  </div>
    
    <div id="device-navigation">
      <div class="icon">
        <img class="menu-icon" src="/sites/all/themes/pca/images/menu-icon.png" /><span>Main Menu</span>
      </div>
    </div>

          <div id="breadcrumb"><h2 class="element-invisible">You are here</h2><div class="breadcrumb"><a href="/">Home</a> » <a href="/club-racing" title="" class="active-trail">Club Racing</a></div></div>
    
    
          <div id="content-top-wrapper">
        <div id="content-top" class="column sidebar">
          <div class="section">
                      </div>
        </div>
      </div>
    
    <div id="main-wrapper">
      <div id="main" class="clearfix section">
        <div id="content"  class="column content-left-slim">
          <!-- Featured Section -->
                      <div id="featured-wrapper">
              <div id="featured" class="column sidebar">
                <div class="section">
                                  </div>
              </div>
            </div>
                    <!-- Highlighted -->
                    <a id="main-content"></a>

                      
            
            <h1 class="title" id="page-title">
              Race Results            </h1>

                      
                                  <div class="tabs">
                          </div>
                                          <div class="region region-content">
    <div id="block-system-main" class="block block-system">

    
  <div class="content">
    <div class="view view-race-results view-id-race_results view-display-id-page view-dom-id-cf86665b7a930d3858857c050f04fa36">
            <div class="view-header">
      <p>Please click on a Club Race event and a .ZIP file containing all individual result files (Sprint groups, Enduro, qualifying) will automatically download. Prior year results are available in the <a href="/race-results-archive">Archive</a>.</p>
<p>To view all your laps through the AMB website visit <a href="http://www.mylaps.com/en" target="_blank">mylaps.com</a>. Registration through AMB's site is required. Laps will be posted to mylaps.com when available. Also note that this data may be unedited and is not the official race results.</p>
<p>Got race photos? Please submit race photos for posting to <a href="/club-racing-contacts">Club Racing Webmaster</a> and be sure to indicate the event, run group, and a caption.</p>
<p><a target="_blank" href="http://www.rennpoints.com/points/">Points Championship Standings</a></p>
    </div>
  
  
  
      <div class="view-content">
        <h3>2017</h3>
<table class="views-view-grid cols-2">
  
  <tbody>
          <tr class="row-1 row-first">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2017-04-RoadAtlanta-PCA-Web%20%282%29.zip" target="_blank">04/2017 - Road Atlanta</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2017-03-Thundehill-Results-PCA-Web.zip" target="_blank">03/2017 - Thunderhill Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-2">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2017-04-LimeRock-PCA-Web.zip" target="_blank">04/2017 - Lime Rock Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2017-02-Sebring-Results-PCA-Web.zip" target="_blank">02/2017 - Sebring International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-3 row-last">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2017-03-COTA-Results-PCA-Web_0.zip" target="_blank">03/2017 - Circuit of the Americas</a></div>  </div>          </td>
                  <td class="col-2 col-last">
                      </td>
              </tr>
      </tbody>
</table>
  <h3>2016</h3>
<table class="views-view-grid cols-2">
  
  <tbody>
          <tr class="row-1 row-first">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-11-MSR-PCA-Web.zip" target="_blank">11/2016 - Motorsport Ranch</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-06-WGI-PCA-Web%20%282%29.zip" target="_blank">06/2016 - Watkins Glen International</a></div>  </div>          </td>
              </tr>
          <tr class="row-2">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-11-Buttonwillow-PCA-Web.zip" target="_blank">11/2016 - Buttonwillow Raceway Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-06-VIR-PCA-Web.zip" target="_blank">06/2016 - VIRginia International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-3">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-10-Hallett-PCA-Web_0.zip" target="_blank">10/2016 - Hallett Motor Racing Circuit</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-05-COTA-PCA-Web_1.zip" target="_blank">05/2016 - Circuit of the Americas</a></div>  </div>          </td>
              </tr>
          <tr class="row-4">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-10-Daytona-PCA-Web%20%281%29.zip" target="_blank">10/2016 - Daytona International Speedway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-05-Buttonwillow-PCA-Web.zip" target="_blank">05/2016 - Buttonwillow Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-5">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-09-Thunderhill-PCA-Web.zip" target="_blank">09/2016 - Thunderhill Raceway Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-05-Mid-Ohio-PCA-Web.zip" target="_blank">05/2016 - Mid-Ohio Sports Car Course</a></div>  </div>          </td>
              </tr>
          <tr class="row-6">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-09-HPR-PCA-Web.zip" target="_blank">09/2016 - High Plains Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-04-RoadAtlanta-PCA-Web.zip" target="_blank">04/2016 - Road Atlanta</a></div>  </div>          </td>
              </tr>
          <tr class="row-7">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-09-RoadAmerica-PCA-Web%20%282%29.zip" target="_blank">09/2016 - Road America</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-04-AutoClub-PCA-Web.zip" target="_blank">04/2016 - Auto Club Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-8">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-09-Utah-PCA-Web.zip" target="_blank">09/2016 - Utah Motorsports Campus</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-04-NOLA-PCA-Web.zip" target="_blank">04/2016 - NOLA Motorsports Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-9">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-09-SummitPoint-PCA-Web.zip" target="_blank">09/2016 - Summit Point Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-04-LimeRock-PCA-Web.zip" target="_blank">04/2016 - Lime Rock Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-10">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-08-CTMP-PCA-Web.zip" target="_blank">08/2016 - Canadian Tire Motorsport Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-04-Gateway-PCA-Web.zip" target="_blank">04/2016 - Gateway Motorsports Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-11">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-08-NJMP-PCA-Web_0.zip" target="_blank">08/2016 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-04-WillowSprngs-PCA-Web.zip" target="_blank">04/2016 - Willow Springs International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-12">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-07-Monticello-PCA-Web%20%282%29.zip" target="_blank">07/2016 - Monticello Motor Club</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-03-TWS-PCA-Web.zip" target="_blank">03/2016 - Texas Wold Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-13">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-07-Laguna-PCA-Web.zip" target="_blank">07/2016 - Mazda Raceway Laguna Seca</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-03-Thunderhill-PCA-Web.zip" target="_blank">03/2016 - Thunderhill Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-14">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-07-Brainerd-PCA-Web.zip" target="_blank">07/2016 - Brainerd International Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-02-Sebring-PCA-Web_0.zip" target="_blank">02/2016 - Sebring International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-15 row-last">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-06-MPH-PCA-Web.zip" target="_blank">06/2016 - Motorsports Park Hastings</a></div>  </div>          </td>
                  <td class="col-2 col-last">
                      </td>
              </tr>
      </tbody>
</table>
  <h3>2015</h3>
<table class="views-view-grid cols-2">
  
  <tbody>
          <tr class="row-1 row-first">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-PCA_Club_Racing-Award_Winners.zip" target="_blank">12/2015 - Full Season Results</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-07-Brainerd-PCA-Web.zip" target="_blank">07/2015 - Brainerd International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-2">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-11-MSR-PCA-Web.zip" target="_blank">11/2015 - MotorSport Ranch</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-06-WGI-PCA-Web.zip" target="_blank">06/2015 - Watkins Glen International</a></div>  </div>          </td>
              </tr>
          <tr class="row-3">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-11-Buttonwillow-PCA-Web.zip" target="_blank">11/2015 - Buttonwillow Raceway Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-06-Laguna-PCA-Results.zip" target="_blank">06/2015 - Mazda Raceway Laguna Seca</a></div>  </div>          </td>
              </tr>
          <tr class="row-4">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-10-Hallett-PCA-Web.zip" target="_blank">10/2015 - Hallett Motor Racing Circuit</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-06-VIR-PCA-Web.zip" target="_blank">06/2015 - VIRginia International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-5">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-10-Daytona-PCA-Webs.zip" target="_blank">10/2015 - Daytona International Speedway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2016-06-NJMP-NASA-PCA-Web.zip" target="_blank">06/2015 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-6">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-09-Thunderhill-PCA-Web.zip" target="_blank">09/2015 - Thunderhill Raceway Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-05-COTA-PCA-Web_0.zip" target="_blank">05/2015 - Circuits of the Americas</a></div>  </div>          </td>
              </tr>
          <tr class="row-7">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-09-RoadAmerica-PCA-Web.zip" target="_blank">09/2015 - Road America</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-05-Monticello-PCA-Web.zip" target="_blank">05/2015 - Monticello Motor Club</a></div>  </div>          </td>
              </tr>
          <tr class="row-8">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-09-Miller-PCA-Web.zip" target="_blank">09/2015 - Miller Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-05-Buttonwillow-PCA-Web.zip" target="_blank">05/2015 - Buttonwillow Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-9">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-09-Mid-Ohio-PCA-Web.zip" target="_blank">09/2015 - Mid-Ohio Sports Car Course</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-05-MPH-PCA-Web.zip" target="_blank">05/2015 - Motorsport Park Hastings</a></div>  </div>          </td>
              </tr>
          <tr class="row-10">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-09-SummitPoint-PCA-Web.zip" target="_blank">09/2015 - Summit Point Motorsport Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-04-AutoClub-PCA-Web.zip" target="_blank">04/2015 - Auto Club Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-11">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-09-Laguna-PCA-Web.zip" target="_blank">09/2015 - Mazda Raceway Laguna Seca</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-04-LimeRock-PCA-Web.zip" target="_blank">04/2015 - Lime Rock Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-12">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-08-GingerMan-PCA-Web.zip" target="_blank">08/2015 - GingerMan Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-03-TWS-PCA-Web.zip" target="_blank">03/2015 - Texas World Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-13">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-08-CTMP-PCA-Web.zip" target="_blank">08/2015 - Canadian Tire Motorsport Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-03-Thunderhill-PCA-Web.zip" target="_blank">03/2015 - Thunderhill Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-14">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-08-HPR-PCA-Web.zip" target="_blank">08/2015 - High Plains Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-03-RoadAtlanta-PCA-Web.zip" target="_blank">03/2015 - Road Atlanta</a></div>  </div>          </td>
              </tr>
          <tr class="row-15">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-08-NJMP-PCA-Web.zip" target="_blank">08/2015 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-02-Sebring-PCA-Web_1.zip" target="_blank">02/2015 - Sebring International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-16 row-last">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-07-Putnam-PCA-Web.zip" target="_blank">07/2015 - Putnam Park Road Course</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2015-02-NOLA-PCA-Webs.zip" target="_blank">02/2015 - NOLA Motorsports Park</a></div>  </div>          </td>
              </tr>
      </tbody>
</table>
  <h3>2014</h3>
<table class="views-view-grid cols-2">
  
  <tbody>
          <tr class="row-1 row-first">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-10-Daytona-PCA-Web.zip" target="_blank">10/2014 - Daytona International Speedway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-07-BIR-PCA-Web.zip" target="_blank">07/2014 - Brainerd International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-2">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-10-MSR-PCA-Web_0.zip" target="_blank">10/2014 - Motorsport Ranch</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-06-VIR-PCA-Web%20%281%29.zip" target="_blank">06/2014 - VIRginia International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-3">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-10-Buttonwillow-PCA-Web.zip" target="_blank">10/2014 - Buttonwillow Raceway Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-05-COTA-PCA-Web.zip" target="_blank">05/2014 - Circuit of the Americas</a></div>  </div>          </td>
              </tr>
          <tr class="row-4">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-10-Hallett-PCA-Web.zip" target="_blank">10/2014 - Hallett Motor Racing Circuit</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-05-Buttonwillow-PCA-Web.zip" target="_blank">05/2014 - Buttonwillow Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-5">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-10-Monticello-PCA-Web.zip" target="_blank">10/2014 - Monticello Motor Club</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-05-NOLA-PCA-Web.zip" target="_blank">05/2014 - NOLA Motorsports Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-6">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-09-Thunderhill-PCA-Web.zip" target="_blank">09/2014 - Thunderhill Raceway Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-05-WGI-PCA-Web_0.zip" target="_blank">05/2014 - Watkins Glen International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-7">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-09-MidOhio-PCA-Web.zip" target="_blank">09/2014 - Mid-Ohio Sports Car Course</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-05-MPH-PCA-Web.zip" target="_blank">05/2014 - Motorsports Park Hastings</a></div>  </div>          </td>
              </tr>
          <tr class="row-8">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-09-Miller-PCA-Web.zip" target="_blank">09/2014 - Miller Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-05-Roebling-PCA-Web.zip" target="_blank">05/2014 - Roebling Road Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-9">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-09-WillowSprings-PCA-Web.zip" target="_blank">09/2014 - Willow Springs Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"></div>  </div>          </td>
              </tr>
          <tr class="row-10">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-09-SummitPoint-PCA-Web.zip" target="_blank">09/2014 - Summit Point Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-04-LimeRock-PCA-Webs.zip" target="_blank">04/2014 - Lime Rock Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-11">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-08-CTMP-PCA-Web.zip" target="_blank">08/2014 - Canadian Tire Motorsport Park</a></div>  </div>          </td>
ws-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-06-MPH-PCA-Web.zip" target="_blank">06/2012 - Motorsports Park Hastings</a></div>  </div>          </td>
              </tr>
          <tr class="row-3">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-10-Daytona-PCA-Web.zip" target="_blank">10/2012 - Daytona International Speedway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-06-Miller-PCA-Web.zip" target="_blank">06/2012 - Miller Motorsports Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-4">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-10-MSR-PCA-Web.zip" target="_blank">10/2012 - MotorSport Ranch</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-06-GingerMan-PCA-Web.zip" target="_blank">06/2012 - GingerMan Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-5">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-10-CMP-PCA-Web.zip" target="_blank">10/2012 - Carolina Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-05-NJMP-PCA-Web.zip" target="_blank">05/2012 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-6">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-09-RoadAmerica-PCA-Web.zip" target="_blank">09/2012 - Road America</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-05-Buttonwillow-PCA-Web.zip" target="_blank">05/2012 - Buttonwillow Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-7">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-09-SummitPoint-PCA-Web.zip" target="_blank">09/2012 - Summit Point Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-04-Heartland-PCA-Web.zip" target="_blank">04/2012 - Heartland Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-8">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-08-HPR-PCA-Web.zip" target="_blank">08/2012 - High Plains Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-04-California-PCA-Web.zip" target="_blank">04/2012 - California Auto Club Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-9">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-08-Mid-Ohio-PCA-Web.zip" target="_blank">08/2012 - Mid-Ohio Sports Car Course</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-04-LimeRock-PCA-Web.zip" target="_blank">04/2012 - Lime Rock Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-10">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-08-NJMP-PCA-Web.zip" target="_blank">08/2012 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-04-LagunaSeca-PCA-Web.zip" target="_blank">04/2012 - Mazda Raceway Laguna Seca</a></div>  </div>          </td>
              </tr>
          <tr class="row-11">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-07-Mosport-PCA-Web.zip" target="_blank">07/2012 - Canadian Tire Motorsport Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-03-TWS-PCA-Web.zip" target="_blank">03/2012 - Texas World Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-12">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-07-Putnam-PCA-Web.zip" target="_blank">07/2012 - Putnam Park Road Course</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-03-RoadAtlanta-PCA-Web.zip" target="_blank">03/2012 - Road Atlanta</a></div>  </div>          </td>
              </tr>
          <tr class="row-13">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-07-Brainerd-PCA-Web.zip" target="_blank">07/2012 - Brainerd International Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-03-Thunderhill-PCA-Web.zip" target="_blank">03/2012 - Thunderhill Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-14">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-06-Portland-PCA-Web.zip" target="_blank">06/2012 - Portland International Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-02-Sebring-PCA-Web.zip" target="_blank">02/2012 - Sebring International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-15 row-last">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-06-VIR-PCA-Web.zip" target="_blank">06/2012 - VIRginia International Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
                      </td>
              </tr>
      </tbody>
</table>
  <h3>2011</h3>
<table class="views-view-grid cols-2">
  
  <tbody>
          <tr class="row-1 row-first">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-12-Roebling-PCA-Web.zip" target="_blank">12/2011 - Roebling Road Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-07-Mosport-PCA-Web.zip" target="_blank">07/2011 - Mosport International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-2">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-10-Hallett-PCA-Web.zip" target="_blank">10/2011 - Hallett Motor Racing Circuit</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-06-MPH-PCA-Web.zip" target="_blank">06/2011 - Motorsports Park Hastings</a></div>  </div>          </td>
              </tr>
          <tr class="row-3">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-10-SummitPoint-PCA-Web.zip" target="_blank">10/2011 - Summit Point Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-06-Portland-PCA-Web.zip" target="_blank">06/2011 - Portland International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-4">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-10-LagunaSeca-PCA-Web.zip" target="_blank">10/2011 - Mazda Raceway Laguna Seca</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-06-VIR-PCA-Web.zip" target="_blank">06/2011 - VIRginia International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-5">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-10-Daytona-PCA-Web.zip" target="_blank">10/2011 - Daytona International Speedway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-05-MidOhio-PCA-Web.zip" target="_blank">05/2011 - Mid-Ohio Sports Car Course</a></div>  </div>          </td>
              </tr>
          <tr class="row-6">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-10-ECR-PCA-Web.zip" target="_blank">10/2011 - Eagles Canyon Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-05-Buttonwillow-PCA-Web.zip" target="_blank">05/2011 - Buttonwillow Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-7">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-10-CMP-PCA-Web.zip" target="_blank">10/2011 - Carolina Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-05-WatkinsGlen-PCA-Web.zip" target="_blank">05/2011 - Watkins Glen International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-8">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-09-RoadAmerica-PCA-Web.zip" target="_blank">09/2011 - Road America</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-04-California-PCA-Web.zip" target="_blank">04/2011 - Auto Club Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-9">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-09-Miller-PCA-Web.zip" target="_blank">09/2011 - Miller Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-04-Heartland-PCA-Web.zip" target="_blank">04/2011 - Heartland Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-10">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-08-Brainerd-PCA-Web.zip" target="_blank">08/2011 - Brainerd International Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-04-LimeRock-PCA-Web.zip" target="_blank">04/2011 - Lime Rock Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-11">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-08-HPR-PCA-Web.zip" target="_blank">08/2011 - High Plains Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-04-Thunderhill-PCA-Web.zip" target="_blank">04/2011 - Thunderhill Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-12">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-08-NJMP-PCA-Web.zip" target="_blank">08/2011 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-03-TWS-PCA-Web_0.zip" target="_blank">03/2011 - Texas World Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-13">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-GingerMan-PCA-Web.zip" target="_blank">07/2011 - GingerMan Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-03-RoadAtlanta-PCA-Web.zip" target="_blank">03/2011 - Road Atlanta</a></div>  </div>          </td>
              </tr>
          <tr class="row-14">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-07-Putnam-PCA-Web.zip" target="_blank">07/2011 - Putnam Park Road Course</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-02-Sebring-PCA-Web.zip" target="_blank">02/2011 - Sebring</a></div>  </div>          </td>
              </tr>
          <tr class="row-15 row-last">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2011-07-NJMP-PCA-Web.zip" target="_blank">07/2011 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
                      </td>
              </tr>
      </tbody>
</table>
  <h3>2010</h3>
<table class="views-view-grid cols-2">
  
  <tbody>
          <tr class="row-1 row-first">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-12-Roebling-PCA-Web.zip" target="_blank">12/2010 - Roebling Road Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-06-Portland-PCA-Web.zip" target="_blank">06/2010 - Portland International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-2">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-10-SummitPoint-PCA-Web.zip" target="_blank">10/2010 - Summit Point Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-06-VIR-PCA-Web.zip" target="_blank">06/2010 - VIRginia International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-3">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-10-Hallett-PCA-Web.zip" target="_blank">10/2010 - Hallett Motor Racing Circuit</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-05-MidOhio-PCA-Web.zip" target="_blank">05/2010 - Mid-Ohio Sports Car Course</a></div>  </div>          </td>
              </tr>
          <tr class="row-4">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-10-CMP-PCA-Web.zip" target="_blank">10/2010 - Carolina Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-05-Buttonwillow-PCA-Web.zip" target="_blank">05/2010 - Buttonwillow Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-5">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-09-RoadAmerica-PCA-Web-1.zip" target="_blank">09/2010 - Road America</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-05-WatkinsGlen-PCA-Web.zip" target="_blank">05/2010 - Watkins Glen International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-6">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-09-Thunderhill-PCA-Web.zip" target="_blank">09/2010 - Thunderhill Raceway Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-05-EaglesCanyon-PCA-Web.zip" target="_blank">05/2010 - Eagles Canyon Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-7">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-09-Miller-PCA-Web.zip" target="_blank">09/2010 - Miller Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-04-California-PCA-Web.zip" target="_blank">04/2010 - Auto Club Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-8">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-08-Thunderbolt-PCA-Web.zip" target="_blank">08/2010 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-04-CGB-PCA-Web.zip" target="_blank">04/2010 - Circuit Grand Bayou</a></div>  </div>          </td>
              </tr>
          <tr class="row-9">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-08-HPR-PCA-Web.zip" target="_blank">08/2010 - High Plains Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-04-Heartland-PCA-Web.zip" target="_blank">04/2010 - Heartland Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-10">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-07-Putnam-PCA-Web.zip" target="_blank">07/2010 - Putnam Park Road Course</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-04-LimeRock-PCA-Web.zip" target="_blank">04/2010 - Lime Rock Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-11">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-07-NJMP-PCA-Web.zip" target="_blank">07/2010 - NJMP Thunderbolt Raceway/PCA at Grand-Am</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-03-TWS-PCA-Web.zip" target="_blank">03/2010 - Texas World Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-12">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-07-Brainerd-PCA-Web.zip" target="_blank">07/2010 - Brainerd International Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-03-RoadAtlanta-PCA-Web.zip" target="_blank">03/2010 - Road Atlanta</a></div>  </div>          </td>
              </tr>
          <tr class="row-13">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-Mosport-PCA-Web.zip" target="_blank">07/2010 - Mosport International Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-03-Thunderhill-PCA-Web.zip" target="_blank">03/2010 - Thunderhill Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-14 row-last">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-06-Hastings-PCA-Web.zip" target="_blank">06/2010 - Motorsports Park Hastings</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2010-02-Sebring-PCA-Web.zip" target="_blank">02/2010 - Sebring</a></div>  </div>          </td>
              </tr>
      </tbody>
</table>
    </div>
  
  
  
  
  
  
</div>  </div>
</div>
  </div>
                  </div> <!-- /#content -->

                  <div id="left-sidebar-slim" class="column sidebar"><div class="section">
              <div class="region region-left-sidebar-slim">
    <div id="block-menu-block-3" class="block block-menu-block">

    
  <div class="content">
    <div class="menu-block-wrapper menu-block-3 menu-name-menu-activities parent-mlid-0 menu-level-1">
  <ul class="menu"><li class="first collapsed menu-mlid-3797"><a href="/porsche-parade" title="">Porsche Parade</a></li>
<li class="collapsed menu-mlid-3803"><a href="/autocross" title="">Autocross</a></li>
<li class="collapsed menu-mlid-3806"><a href="/driver-education" title="">Driver Education</a></li>
<li class="expanded active-trail menu-mlid-3815"><a href="/club-racing" title="" class="active-trail">Club Racing</a><ul class="menu"><li class="first leaf menu-mlid-2855"><a href="http://register.pca.org" title="">Registration</a></li>
<li class="leaf menu-mlid-3816"><a href="/pca-club-racing-calendar-2017" title="">Schedule</a></li>
<li class="leaf menu-mlid-3824"><a href="/rules-licensing-forms" title="">Rules, Licensing, &amp; Forms</a></li>
<li class="leaf active-trail active menu-mlid-2421"><a href="/race-results" title="" class="active-trail active">Race Results</a></li>
<li class="leaf menu-mlid-4572"><a href="/club-racing-news" title="">Club Racing News</a></li>
<li class="leaf menu-mlid-3825"><a href="/sponsors" title="">Sponsors</a></li>
<li class="last leaf menu-mlid-3817"><a href="/club-racing-contacts" title="">Contacts</a></li>
</ul></li>
<li class="leaf menu-mlid-3818"><a href="/concours-delegance" title="">Concours</a></li>
<li class="leaf menu-mlid-3819"><a href="/rally" title="">Rally</a></li>
<li class="leaf menu-mlid-3820"><a href="/pca-treffen-tour" title="">Treffen</a></li>
<li class="last leaf menu-mlid-3386"><a href="/porscheplatz-frequently-asked-questions" title="">Porscheplatz</a></li>
</ul></div>
  </div>
</div>
  </div>
          </div></div>
        
        
              </div>
    </div> <!-- /#main, /#main-wrapper -->

    
    <div id="footer">
      <div class="section">
                    <div class="region region-footer-left">
    <div id="block-menu-menu-footer" class="block block-menu">

    
  <div class="content">
    <ul class="menu"><li class="first leaf"><a href="/" title="">Home</a></li>
<li class="leaf"><a href="/policies" title="">Policies</a></li>
<li class="leaf"><a href="/sitemap" title="">Site Map</a></li>
<li class="last leaf"><a href="/contact" title="">Contact</a></li>
</ul>  </div>
</div>
  </div>
        
                    <div class="region region-footer-middle">
    <div id="block-block-8" class="block block-block">

    
  <div class="content">
    <p>Copyright 2017 Porsche Club of America Inc. All Rights Reserved.</p>
  </div>
</div>
  </div>
        
                    <div class="region region-footer-right">
    <div id="block-block-9" class="block block-block">

    
  <div class="content">
    <p><a href="https://www.facebook.com/porscheclubofamerica" style="font-size: 13px; line-height: 1.6em;" target="_blank"><img alt="" src="/sites/default/files/u/Facebook-signature-small.jpg" style="width: 24px; height: 24px;" /></a><a href="https://twitter.com/PCANational" style="font-size: 13px; line-height: 1.6em;" target="_blank"> <img alt="" src="/sites/default/files/u/Twitter-signature-small.jpg" style="width: 24px; height: 24px;" /></a><a href="https://www.instagram.com/pcanational/" style="font-size: 13px; line-height: 1.6em;" target="_blank"><img alt="" src="/sites/default/files/u/Instagram-signature-small.jpg" style="width: 24px; height: 24px;" /></a><a href="https://www.youtube.com/user/PCAHQ" style="font-size: 13px; line-height: 1.6em;" target="_blank"><img alt="" src="/sites/default/files/u/YouTube-signature-small.jpg" style="width: 24px; height: 24px;" /></a><a href="http://www.pcawebstore.com/" style="font-size: 13px; line-height: 1.6em;" target="_blank"><img alt="PCA Store" class="last" src="/sites/all/themes/pca/images/PCA_store.png" /></a></p>
  </div>
</div>
  </div>
              </div>
    </div> <!-- /.section, /#footer -->
  </div>
</div> <!-- /#page, /#page-wrapper -->
    <script src="/sites/all/themes/pca/js/pca_adjust.js"></script>
</body>
</html>

           
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-07-NJMP-PCA-Web.zip" target="_blank">07/2013 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-03-Thunderhill-PCA-Web.zip" target="_blank">03/2013 - Thunderhill Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-16">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-06-WGI-PCA-Web.zip" target="_blank">06/2013 - Watkins Glen International Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-01-Sebring-PCA-Web.zip" target="_blank">01/2013 - Sebring International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-17 row-last">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-06-GingerMan-PCA-Web.zip" target="_blank">06/2013 - GingerMan Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
                      </td>
              </tr>
      </tbody>
</table>
  <h3>2012</h3>
<table class="views-view-grid cols-2">
  
  <tbody>
          <tr class="row-1 row-first">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-11-Buttonwillow-PCA-Web.zip" target="_blank">11/2012 - Buttonwillow Raceway Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-06-WGI-PCA-Web.zip" target="_blank">06/2012 - Watkins Glen International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-2">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2012-10-Hallett-PCA-Web.zip" target="_blank">10/2012 - Hallett Motor Racing Circuit</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="vieg/sites/default/files/race-results/2013-08-HPR-PCA-Web.zip" target="_blank">08/2013 - High Plains Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-04-AutoClub-PCA-Web.zip" target="_blank">04/2013 - Auto Club Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-10">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-08-Thunderhill-PCA-Web.zip" target="_blank">08/2013 - Thunderhill Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-04-NOLA-PCA-Web.zip" target="_blank">04/2013 - NOLA Motorsports Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-11">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-08-RdAmerica-PCA-Web.zip" target="_blank">08/2013 - Road America</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-04-LimeRock-PCA-Results.zip" target="_blank">04/2013 - Lime Rock Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-12">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-08-NJMP-PCA-Web.zip" target="_blank">08/2013 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-03-TWS-PCA-Web.zip" target="_blank">03/2013 - Texas World Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-13">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-07-MidOhio-PCA-Web.zip" target="_blank">07/2013 - Mid-Ohio Sports Car Course</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-03-Roebling-PCA-Web.zip" target="_blank">03/2013 - Roebling Road Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-14">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-07-Brainerd-PCA-Web.zip" target="_blank">07/2013 - Brainerd International Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-03-RoadAtlanta-PCA-Web.zip" target="_blank">03/2013 - Road Atlanta</a></div>  </div>          </td>
              </tr>
          <tr class="row-15">
                  <td class="col-1 col-first">
           <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-06-Laguna-PCA-Web.zip" target="_blank">06/2013 - Mazda Raceway Laguna Seca</a></div>  </div>          </td>
              </tr>
          <tr class="row-4">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-10-ECR-PCA-Web.zip" target="_blank">10/2013 - Eagles Canyon Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-06-Mosport-PCA-Web.zip" target="_blank">06/2013 - Canadian Tire Motorsport Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-5">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-10-CMP-PCA-Web.zip" target="_blank">10/2013 - Carolina Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-06-MPH-PCA-Web.zip" target="_blank">06/2013 - Motorsports Park Hastings</a></div>  </div>          </td>
              </tr>
          <tr class="row-6">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-09-Miller-PCA-Web.zip" target="_blank">09/2013 - Miller Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-05-COTA-PCA-Web.zip" target="_blank">05/2013 - Circuit of the Americas</a></div>  </div>          </td>
              </tr>
          <tr class="row-7">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-09-Summit-PCA-Web.zip" target="_blank">09/2013 - Summit Point Motorsports Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-05-Buttonwillow-PCA-Web.zip" target="_blank">05/2013 - Buttonwillow Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-8">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-08-Putnam-PCA-Web.zip" target="_blank">08/2013 - Putnam Park Road Course</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-05-SprintMtn-PCA-Web.zip" target="_blank">05/2013 - Spring Mountain Motorsports Ranch</a></div>  </div>          </td>
              </tr>
          <tr class="row-9">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.or                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"></div>  </div>          </td>
              </tr>
          <tr class="row-12">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-08-RoadAmerica-PCA-Web.zip" target="_blank">08/2014 - Road America</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-03-TWS-PCA-Web.zip" target="_blank">03/2014 - Texas World Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-13">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-08-NJMP-PCA-Web.zip" target="_blank">08/2014 - NJMP Thunderbolt Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-03-Thunderhill-PCA-Web.zip" target="_blank">03/2014 - Thunderhill Raceway Park</a></div>  </div>          </td>
              </tr>
          <tr class="row-14 row-last">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-08-HPR-PCA-Web.zip" target="_blank">08/2014 - High Plains Raceway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2014-01-Sebring-PCA-Web.zip" target="_blank">01/2014 - Sebring International Raceway</a></div>  </div>          </td>
              </tr>
      </tbody>
</table>
  <h3>2013</h3>
<table class="views-view-grid cols-2">
  
  <tbody>
          <tr class="row-1 row-first">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-11-Buttonwillow-PCA-Web.zip" target="_blank">11/2013 - Buttonwillow Raceway Park</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-06-VIR-PCA-Web.zip" target="_blank">06/2013 - VIRginia International Raceway</a></div>  </div>          </td>
              </tr>
          <tr class="row-2">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-10-Daytona-PCA-Web.zip" target="_blank">10/2013 - Daytona International Speedway</a></div>  </div>          </td>
                  <td class="col-2 col-last">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-06-Kansas-PCA-Web.zip" target="_blank">06/2013 - Kansas Speedway</a></div>  </div>          </td>
              </tr>
          <tr class="row-3">
                  <td class="col-1 col-first">
              
  <div class="views-field views-field-field-race-results">        <div class="field-content"><a href="https://www.pca.org/sites/default/files/race-results/2013-10-Hallett-PCA-Web.zip" target="_blank">10/2013 - Hallett Motor Racing Circuit</a></div>  </div>          </td>
EOF

return $content;
}

1;
