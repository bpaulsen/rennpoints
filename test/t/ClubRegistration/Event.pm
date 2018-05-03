package TestsFor::RennPoints::ClubRegistration::Event;
use Test::Class::Moose;
use RennPoints::ClubRegistration::Event;

sub test_registration_date {
    my $test = shift;

    isa_ok my $event = RennPoints::ClubRegistration::Event->new( registration_date_content => getRegistrationContent(), id => 0 ), 'RennPoints::ClubRegistration::Event';
#    ok $event->url, 'test that URL is not null';
    is $event->registration_date, '07/31/17', 'test registration date';
}

sub test_get_races {
    my $test = shift;

    isa_ok my $event = RennPoints::ClubRegistration::Event->new( content => getContent(), id => 0 ), 'RennPoints::ClubRegistration::Event';
    is_deeply $event->races, [ 16063, 16071 ], 'test races';

    isa_ok $event = RennPoints::ClubRegistration::Event->new( content => getContent2(), id => 0 ), 'RennPoints::ClubRegistration::Event';
    is_deeply $event->races, [ 16002, 16003, 16004, 16005, 16006 ], 'test races';
}

sub getContent {
my $content =<<'EOF';
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Roster :: ClubRegistration.net</title>
        


		<meta name="robots" content="NOINDEX,NOFOLLOW">
		<meta name="format-detection" content="telephone=yes">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

        
        <link href="//clubregistration.net/events/roster.cfm" rel="canonical">
        <link href="/assets/css/clubreg.css" rel="stylesheet" type="text/css">
        <!--[if lt IE 9]>
            <script src="/assets/js/html5shiv.js?v=3.6.2"></script>
            <script src="/assets/js/respond.min.js?v=1.3.0"></script>
        <![endif]-->
		<script src="/assets/js/jquery.js?v=1.10.2"></script>
		
		<link href="/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="/assets/css/atc-style-blue.css" rel="stylesheet" type="text/css">
		
		
		<script src="/assets/js/jquery.collapser.min.js"></script>
		<script>
		$(document).ready(function(){
			$('.collapseChar').collapser({
				mode: 'chars',
				showText: '(EXPAND)',
				hideText: '(COLLAPSE)',
				truncate: 30
			});
			
			$('.collapseBlock').collapser({
				target: 'next',
				mode: 'block',
				showText: '(Expand)',
				hideText: '(Collapse)',
				changeText: 1
			});

			$('.collapseBlockShow').collapser({
				target: 'next',
				mode: 'block',
				showText: '(Expand)',
				hideText: '(Collapse)',
				changeText: 1,
				atStart: 'show'
			});

			$('.collapseBlockHide').collapser({
				target: 'next',
				mode: 'block',
				showText: '(Expand)',
				hideText: '(Collapse)',
				changeText: 1,
				atStart: 'hide'
			});

			$('.collapseBlockHideMembership').collapser({
				target: 'next',
				mode: 'block',
				showText: 'Show Membership',
				hideText: 'Hide Membership',
				changeText: 1,
				atStart: 'hide'
			});

			$('.collapseLineShow').collapser({
				mode: 'lines',
				showText: '...Show More',
				hideText: '...Show Less',
				changeText: 1,
				atStart: 'hide',
				truncate: 2
			});

			$('.collapseLineShowTall').collapser({
				mode: 'lines',
				showText: '...Show More',
				hideText: '...Show Less',
				changeText: 1,
				atStart: 'hide',
				truncate: 8
			});

			$('.collapseWords li').collapser({
				mode: 'words',
				truncate: 2,
			});
			
		});
		
		</script>	
		<style>
			.show-class{
				background: #f2f2f2;
			}
			.hide-class{
				background: #fff;
			}
		</style>
		
		<link href="/assets/ico/crnet-icon-iTunesArtwork.png" rel="apple-touch-icon-precomposed">
		<link href="/assets/ico/crnet-icon.ico" rel="shortcut icon">
		
	</head>
	
	
		<body>
	
	
        <noscript>
            <div class="wrapper">
                <div class="wrap three-quarter offset">
					
                </div>
            </div>
        </noscript>
        <span id="top"></span>
        <a class="sr-only" href="#content">Skip navigation</a>
        <header class="header" role="banner">
            <div class="wrapper">
                <div class="branding-lg">
                    <a class="brand-lg" href="/" title="ClubRegistration.net"><span>ClubRegistration.net</span></a>
                </div>
                <div class="branding-sm">
                    <a class="brand-sm" href="/" title="ClubRegistration.net"><span>ClubRegistration.net</span></a>
                </div>
            </div>
        </header>
		
		
    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav">
			
				
				
					<li><a href="/the-shop/index.cfm">ClubReg Store</a></li>
				
					<li>
						<li><a href="//ontrackinsurance.com/index6.aspx" rel="external">Track Insurance</a></li>
					</li>
					<li>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Classifieds and More... <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/classifieds/index.cfm">Classifieds</a></li>							
							<li><a href="/the-shop/trackMaps.cfm">Track Maps</a></li>
							<li><a href="https://www.youtube.com/watch?t=9&v=xsMMPHMEtL0" target="_blank">Track Day Guide (video)</a></li>
							<li><a href="/racing-quotes/">Racing Quotes</a></li>
							<li><a href="/events/photos/photo_gallery.cfm">Photo Gallery</a></li>
							<li><a href="/screen-saver">Screen Saver (Auto Refreshes)</a></li>
						</ul>
					</li>
					
					
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Membership <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/membership/index.cfm?seriesSelected=Chicago Region PCA">Chicago Region PCA</a></li>
								<li><a href="/membership/index.cfm?seriesSelected=Just Track It">Just Track It</a></li>
								<li><a href="/membership/index.cfm?seriesSelected=PCA">Porsche Club of America</a></li>
							</ul>
						</li>
					
						<li><a href="/contact-us/">Contact Us</a></li>
					
			</ul>

            
            
				
                
                <ul class="nav navbar-nav navbar-left">
                    <li class="dropdown">
                        <a href="/driver/menuRegistrant.cfm" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/driver/home.cfm">Dashboard</a></li>
							<li><a href="/driver/eventHistory.cfm">Event History</a></li>
							
							
								<li><a href="/driver/eventReminder.cfm">Event Reminders</a></li>
								<li><a href="/misc/reserved_numbers_check.cfm">Search Reserved #s</a></li>
								<li><a href="/events/photos/upload.cfm">My Photo Gallery</a></li>
								<li><a href="/driver/classifieds/index.cfm">Classifieds</a></li>								
								<li><a href="/misc/faq/">FAQs</a></li>
							
							
							<li class="divider"></li>
							<li><a href="/driver/registrant_profile.cfm">Edit Profile</a></li>
							<li><a href="/driver/vehicle/vehicle_edit.cfm">Edit Vehicles</a></li>
							
							
								<li><a href="/driver/membership/membership_edit.cfm">Edit Memberships</a></li>
							
						</ul>
                    </li>
                    <li class="dropdown">
                        <a href="/driver/event_sign_up.cfm" class="dropdown-toggle" data-toggle="dropdown">Search for Events <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        
                        	
								<li><a href="/events/event-search.cfm">Find Event</a></li>
							
								<li><a href="/events/rosterAll.cfm">View All Rosters</a></li>
								<li class="divider"></li>
								<li><a href="/the-shop/index.cfm">Search Products</a></li>
							
                        </ul>
                    </li>
					
					
					
                </ul>

            
            <ul class="nav navbar-nav navbar-right">
				
                    <li><a href="/logout/" title="Logout">Logout <i class="fa fa-sign-out"></i></a></li>
                
            </ul>
        </div>
    </nav>

        
        <section class="content" id="content">


<script language="JavaScript">
	
	function eventRegister()
		{
			
				self.location.href=("/events/signUp.cfm/event/" + 8500);
			
		}
</script>

<div class="wrapper">
    <div class="wrap full">
		<div class="wrapper">
			
			
			
				<div class="wrap three-quarter">
					<h1>Roster: Mardi Gras Region PCA</h1>
					<h2>Mardi Gras Cup 2017</h2>
				</div>
				
				
				<div class="wrap quarter">
					
			<div class="sponsors-image text-center">
			
				
					<small><em>ClubRegistration.net sponsor</em></small>
				
					<a href="http://bit.ly/conquerhelmet" target="_blank">
						
							<img src="https://clubregistration.net/assets/img/sponsors/conquer%2Epng" alt="Conquer Fitness Equipment" style="width: 350px;">
						
					</a>
				
			</div>
		
				</div>
			
		</div>
		
		
		
				<div class="alert alert-info">
					<strong>New feature!</strong> You can now upload a picture of your vehicle into your profile. Your picture will show up on this page.
				</div>

				<form id="frmRoster" name="frmRoster" method="post" action="roster.cfm">
					<label for="viewOption">Select Roster</label>
					<select id="viewOption" name="viewOption" size="1">
						
							<option value="0" selected>Main Roster</option>
						
								<option value="16063"
									
								
								>Primary Driver Weekend package</option>
							
								<option value="16071"
									
								
								>Enduro ONLY Co-Driver</option>
							
					</select>
					<button class="btn btn-alternate btn-sm btn-120" id="btn_login" name="btn_login" type="submit">View</button>
				
					
						<button id="btn-register" name="btn-register" type="button" class="btn btn-alternate btn-sm btn-120" onClick="eventRegister();">Register</button>
					
				</form>
				
			
			
			<h2><small>Main Roster</small></h2>
			
			
			

			
			<table id="roster" class="table table-bordered table-striped table-condensed">
				<thead>
					<tr>
						<th>Registrants (49) <i class="fa fa-sort"></i></th>
						
						
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			
			
			
			<script type="text/javascript">
				$(document).ready(function()
					{
						if($("#roster").length > 0)
							{
								$("#roster").dataTable(
									{
										"aoColumnDefs"    : [
											{"sWidth"     : "128px",  "aTargets" : [0]}
											
											
											
										],
										"bAutoWidth"      : false,
										"bDeferRender"    : true,
										"bFilter"         : true,
										"bLengthChange"   : false,
										"bPaginate"       : false,
										"bProcessing"     : false,
										"bScrollAutoCss"  : true,
										"bScrollCollapse" : false,
										"bSort"           : true,
										"bSortCellsTop"   : true,
										"sAjaxSource"     : "rosterMain.json.cfm",
										"sDom"            : '<"category-table-top"f>rt<"clearfix">'
									}
								);
							}
					}
				);
			</script>

		
		
	</div>
</div>



        </section>
		<footer class="footer" role="contentinfo">
			<div class="wrapper">
				
				
	<div class="text-center">
		
			<a href="/racing-quotes">
				<strong><em>You know you're a racer if&hellip;</em></strong>
			</a>
			<em>You always do a toe & heel downshift while whoever might be your passenger gives you a real funny look.</em>
		
	</div>
	<br>

	<div class="text-center" style="padding-bottom: 10px;">
		
			<table style="margin: 0 auto;">
				<tr>
					 
						<td style="text-align: center; vertical-align: top; padding-right: 10px;">
							
									<a href="//clubregistration.net/the-shop/index.cfm/productid/749">
										<img class="product-image" src="//clubregistration.net/assets/img/products/BellSport2011.jpg" alt="SPORT SA2010 HELMET RENTAL" style="width: 100px;">
									</a>
								
						</td>
					
					<td style="text-align: left; vertical-align: top; width: 600px;">
						
								<a href="https://clubregistration.net/the-shop/index.cfm/productid/749"><strong>SPORT SA2010 HELMET RENTAL</strong></a>&nbsp;($75.00)
								<br>
								<em>(Package includes helmet & neck support collar)<br>Sizes: S, M, L, XL.<br>Price includes Standard FedEx Ground Shipping</em>
							
					</td>
				</tr>
			</table>
		
	</div>

				
				<hr>
				
				<div class="legal">
					<ul>
						<li>Copyright &copy; 2017 ClubRegistration.net LLC. All rights reserved.</li>
						<li><a href="/privacy/" title="Privacy Policy">Privacy Policy</a></li>
						<li>Office: 512.273.5016</li>
					</ul>
				</div>
				<small class="facebook">
					<a href="//www.facebook.com/ClubRegistration" rel="external" title="Follow us on Facebook!"><i class="fa fa-facebook-square fa-3x"></i></a>
				</small>
			</div>
		</footer>
        <script src="/assets/js/bootstrap.min.js?v=3.0.0"></script>
        <script src="/assets/js/holder.js?v=2.0.0"></script>
        <script src="/assets/js/retina.js?v=0.0.2"></script>
        <script src="/assets/js/jquery.smooth-scroll.min.js?v=1.4.11"></script>
        <script src="/assets/js/scripts.js"></script>
        <script src="/assets/js/common.js"></script>
		<script src="/assets/js/libs/DataTables-1.9.4/media/js/jquery.dataTables.min.js?v=1.9.4"></script>
    </body>
</html>
EOF

return $content;
}

sub getContent2 {
my $content =<<'EOF';

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Roster :: ClubRegistration.net</title>
        


		<meta name="robots" content="NOINDEX,NOFOLLOW">
		<meta name="format-detection" content="telephone=yes">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

        
        <link href="//clubregistration.net/events/roster.cfm" rel="canonical">
        <link href="/assets/css/clubreg.css" rel="stylesheet" type="text/css">
        <!--[if lt IE 9]>
            <script src="/assets/js/html5shiv.js?v=3.6.2"></script>
            <script src="/assets/js/respond.min.js?v=1.3.0"></script>
        <![endif]-->
		<script src="/assets/js/jquery.js?v=1.10.2"></script>
		
		<link href="/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="/assets/css/atc-style-blue.css" rel="stylesheet" type="text/css">
		
		
		<script src="/assets/js/jquery.collapser.min.js"></script>
		<script>
		$(document).ready(function(){
			$('.collapseChar').collapser({
				mode: 'chars',
				showText: '(EXPAND)',
				hideText: '(COLLAPSE)',
				truncate: 30
			});
			
			$('.collapseBlock').collapser({
				target: 'next',
				mode: 'block',
				showText: '(Expand)',
				hideText: '(Collapse)',
				changeText: 1
			});

			$('.collapseBlockShow').collapser({
				target: 'next',
				mode: 'block',
				showText: '(Expand)',
				hideText: '(Collapse)',
				changeText: 1,
				atStart: 'show'
			});

			$('.collapseBlockHide').collapser({
				target: 'next',
				mode: 'block',
				showText: '(Expand)',
				hideText: '(Collapse)',
				changeText: 1,
				atStart: 'hide'
			});

			$('.collapseBlockHideMembership').collapser({
				target: 'next',
				mode: 'block',
				showText: 'Show Membership',
				hideText: 'Hide Membership',
				changeText: 1,
				atStart: 'hide'
			});

			$('.collapseLineShow').collapser({
				mode: 'lines',
				showText: '...Show More',
				hideText: '...Show Less',
				changeText: 1,
				atStart: 'hide',
				truncate: 2
			});

			$('.collapseLineShowTall').collapser({
				mode: 'lines',
				showText: '...Show More',
				hideText: '...Show Less',
				changeText: 1,
				atStart: 'hide',
				truncate: 8
			});

			$('.collapseWords li').collapser({
				mode: 'words',
				truncate: 2,
			});
			
		});
		
		</script>	
		<style>
			.show-class{
				background: #f2f2f2;
			}
			.hide-class{
				background: #fff;
			}
		</style>
		
		<link href="/assets/ico/crnet-icon-iTunesArtwork.png" rel="apple-touch-icon-precomposed">
		<link href="/assets/ico/crnet-icon.ico" rel="shortcut icon">
		
	</head>
	
	
		<body>
	
	
        <noscript>
            <div class="wrapper">
                <div class="wrap three-quarter offset">
					
                </div>
            </div>
        </noscript>
        <span id="top"></span>
        <a class="sr-only" href="#content">Skip navigation</a>
        <header class="header" role="banner">
            <div class="wrapper">
                <div class="branding-lg">
                    <a class="brand-lg" href="/" title="ClubRegistration.net"><span>ClubRegistration.net</span></a>
                </div>
                <div class="branding-sm">
                    <a class="brand-sm" href="/" title="ClubRegistration.net"><span>ClubRegistration.net</span></a>
                </div>
            </div>
        </header>
		
		
    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav">
			
				
				
					<li><a href="/the-shop/index.cfm">ClubReg Store</a></li>
				
					<li>
						<li><a href="//ontrackinsurance.com/index6.aspx" rel="external">Track Insurance</a></li>
					</li>
					<li>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Classifieds and More... <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/classifieds/index.cfm">Classifieds</a></li>							
							<li><a href="/the-shop/trackMaps.cfm">Track Maps</a></li>
							<li><a href="https://www.youtube.com/watch?t=9&v=xsMMPHMEtL0" target="_blank">Track Day Guide (video)</a></li>
							<li><a href="/racing-quotes/">Racing Quotes</a></li>
							<li><a href="/events/photos/photo_gallery.cfm">Photo Gallery</a></li>
							<li><a href="/screen-saver">Screen Saver (Auto Refreshes)</a></li>
						</ul>
					</li>
					
					
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Membership <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/membership/index.cfm?seriesSelected=Chicago Region PCA">Chicago Region PCA</a></li>
								<li><a href="/membership/index.cfm?seriesSelected=Just Track It">Just Track It</a></li>
								<li><a href="/membership/index.cfm?seriesSelected=PCA">Porsche Club of America</a></li>
							</ul>
						</li>
					
						<li><a href="/contact-us/">Contact Us</a></li>
					
			</ul>

            
            
				
                
                <ul class="nav navbar-nav navbar-left">
                    <li class="dropdown">
                        <a href="/driver/menuRegistrant.cfm" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/driver/home.cfm">Dashboard</a></li>
							<li><a href="/driver/eventHistory.cfm">Event History</a></li>
							
							
								<li><a href="/driver/eventReminder.cfm">Event Reminders</a></li>
								<li><a href="/misc/reserved_numbers_check.cfm">Search Reserved #s</a></li>
								<li><a href="/events/photos/upload.cfm">My Photo Gallery</a></li>
								<li><a href="/driver/classifieds/index.cfm">Classifieds</a></li>								
								<li><a href="/misc/faq/">FAQs</a></li>
							
							
							<li class="divider"></li>
							<li><a href="/driver/registrant_profile.cfm">Edit Profile</a></li>
							<li><a href="/driver/vehicle/vehicle_edit.cfm">Edit Vehicles</a></li>
							
							
								<li><a href="/driver/membership/membership_edit.cfm">Edit Memberships</a></li>
							
						</ul>
                    </li>
                    <li class="dropdown">
                        <a href="/driver/event_sign_up.cfm" class="dropdown-toggle" data-toggle="dropdown">Search for Events <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        
                        	
								<li><a href="/events/event-search.cfm">Find Event</a></li>
							
								<li><a href="/events/rosterAll.cfm">View All Rosters</a></li>
								<li class="divider"></li>
								<li><a href="/the-shop/index.cfm">Search Products</a></li>
							
                        </ul>
                    </li>
					
					
					
                </ul>

            
            <ul class="nav navbar-nav navbar-right">
				
                    <li><a href="/logout/" title="Logout">Logout <i class="fa fa-sign-out"></i></a></li>
                
            </ul>
        </div>
    </nav>

        
        <section class="content" id="content">


<script language="JavaScript">
	
	function eventRegister()
		{
			
				self.location.href=("/events/signUp.cfm/event/" + 8470);
			
		}
</script>

<div class="wrapper">
    <div class="wrap full">
		<div class="wrapper">
			
			
			
				<div class="wrap three-quarter">
					<h1>Roster: Schattenbaum Region PCA</h1>
					<h2>Schattenbaum Showdown 2017</h2>
				</div>
				
				
				<div class="wrap quarter">
					
			<div class="sponsors-image text-center">
			
				
					<small><em>ClubRegistration.net sponsor</em></small>
				
					<a href="http://www.competitionMotorsport.com" target="_blank">
						
							<img src="https://clubregistration.net/assets/img/sponsors/competitionMotorsport%2Epng" alt="Competition Motorsport" style="width: 350px;">
						
					</a>
				
					<p class="alert alert-info text-center" style="width: 312px;">All the top motorsport brands. The best service in the business. At the lowest prices in the nation.</p>
				
			</div>
		
				</div>
			
		</div>
		
		
		
				<div class="alert alert-info">
					<strong>New feature!</strong> You can now upload a picture of your vehicle into your profile. Your picture will show up on this page.
				</div>

				<form id="frmRoster" name="frmRoster" method="post" action="roster.cfm">
					<label for="viewOption">Select Roster</label>
					<select id="viewOption" name="viewOption" size="1">
						
							<option value="0" selected>Main Roster</option>
						
								<option value="16002"
									
								
								>Sprint PRIMARY Driver</option>
							
								<option value="16003"
									
								
								>Sprint CO-Driver</option>
							
								<option value="16004"
									
								
								>Enduro PRIMARY Driver</option>
							
								<option value="16005"
									
								
								>Enduro ONLY CO-Driver</option>
							
								<option value="16006"
									
								
								>Enduro CO-Driver</option>
							
					</select>
					<button class="btn btn-alternate btn-sm btn-120" id="btn_login" name="btn_login" type="submit">View</button>
				
					
						<button id="btn-register" name="btn-register" type="button" class="btn btn-alternate btn-sm btn-120" onClick="eventRegister();">Register</button>
					
				</form>
				
			
			
			<h2><small>Main Roster</small></h2>
			
			
			

			
			<table id="roster" class="table table-bordered table-striped table-condensed">
				<thead>
					<tr>
						<th>Registrants (112) <i class="fa fa-sort"></i></th>
						
						
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			
			
			
			<script type="text/javascript">
				$(document).ready(function()
					{
						if($("#roster").length > 0)
							{
								$("#roster").dataTable(
									{
										"aoColumnDefs"    : [
											{"sWidth"     : "128px",  "aTargets" : [0]}
											
											
											
										],
										"bAutoWidth"      : false,
										"bDeferRender"    : true,
										"bFilter"         : true,
										"bLengthChange"   : false,
										"bPaginate"       : false,
										"bProcessing"     : false,
										"bScrollAutoCss"  : true,
										"bScrollCollapse" : false,
										"bSort"           : true,
										"bSortCellsTop"   : true,
										"sAjaxSource"     : "rosterMain.json.cfm",
										"sDom"            : '<"category-table-top"f>rt<"clearfix">'
									}
								);
							}
					}
				);
			</script>

		
		
	</div>
</div>



        </section>
		<footer class="footer" role="contentinfo">
			<div class="wrapper">
				
				
	<div class="text-center">
		
			<a href="/racing-quotes">
				<strong><em>You know you're a racer if&hellip;</em></strong>
			</a>
			<em>You've ever been pulled over and considered losing the Cop on the next three turns.</em>
		
	</div>
	<br>

	<div class="text-center" style="padding-bottom: 10px;">
		
			<table style="margin: 0 auto;">
				<tr>
					 
						<td style="text-align: center; vertical-align: top; padding-right: 10px;">
							
									<a href="//clubregistration.net/the-shop/index.cfm/productid/791">
										<img class="product-image" src="//clubregistration.net/assets/img/products/fastCarFastDriver.png" alt="Fast Car/Fast Driver" style="width: 100px;">
									</a>
								
						</td>
					
					<td style="text-align: left; vertical-align: top; width: 600px;">
						
								<a href="https://clubregistration.net/the-shop/index.cfm/productid/791"><strong>Fast Car/Fast Driver</strong></a>&nbsp;($7.99)
								<br>
								<em>Tired of having the "What is your 1/4 mile time?" conversations? Settle it once and for all with this winshield sticker. Your choice of map. Measures 4.25" x 6"<br><br><a href="//clubregistration.net/the-shop/trackMaps.cfm">See maps</a></em>
							
					</td>
				</tr>
			</table>
		
	</div>

				
				<hr>
				
				<div class="legal">
					<ul>
						<li>Copyright &copy; 2017 ClubRegistration.net LLC. All rights reserved.</li>
						<li><a href="/privacy/" title="Privacy Policy">Privacy Policy</a></li>
						<li>Office: 512.273.5016</li>
					</ul>
				</div>
				<small class="facebook">
					<a href="//www.facebook.com/ClubRegistration" rel="external" title="Follow us on Facebook!"><i class="fa fa-facebook-square fa-3x"></i></a>
				</small>
			</div>
		</footer>
        <script src="/assets/js/bootstrap.min.js?v=3.0.0"></script>
        <script src="/assets/js/holder.js?v=2.0.0"></script>
        <script src="/assets/js/retina.js?v=0.0.2"></script>
        <script src="/assets/js/jquery.smooth-scroll.min.js?v=1.4.11"></script>
        <script src="/assets/js/scripts.js"></script>
        <script src="/assets/js/common.js"></script>
		<script src="/assets/js/libs/DataTables-1.9.4/media/js/jquery.dataTables.min.js?v=1.9.4"></script>
    </body>
</html>
EOF

return $content;
}

sub getRegistrationContent {
my $content =<<'EOF';
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Event Details :: ClubRegistration.net</title>
        


		<meta name="robots" content="NOINDEX,NOFOLLOW">
		<meta name="format-detection" content="telephone=yes">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

        
        <link href="//clubregistration.net/events/event-details.cfm" rel="canonical">
        <link href="/assets/css/clubreg.css" rel="stylesheet" type="text/css">
        <!--[if lt IE 9]>
            <script src="/assets/js/html5shiv.js?v=3.6.2"></script>
            <script src="/assets/js/respond.min.js?v=1.3.0"></script>
        <![endif]-->
		<script src="/assets/js/jquery.js?v=1.10.2"></script>
		
		<link href="/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="/assets/css/atc-style-blue.css" rel="stylesheet" type="text/css">
		
		
		<script src="/assets/js/jquery.collapser.min.js"></script>
		<script>
		$(document).ready(function(){
			$('.collapseChar').collapser({
				mode: 'chars',
				showText: '(EXPAND)',
				hideText: '(COLLAPSE)',
				truncate: 30
			});
			
			$('.collapseBlock').collapser({
				target: 'next',
				mode: 'block',
				showText: '(Expand)',
				hideText: '(Collapse)',
				changeText: 1
			});

			$('.collapseBlockShow').collapser({
				target: 'next',
				mode: 'block',
				showText: '(Expand)',
				hideText: '(Collapse)',
				changeText: 1,
				atStart: 'show'
			});

			$('.collapseBlockHide').collapser({
				target: 'next',
				mode: 'block',
				showText: '(Expand)',
				hideText: '(Collapse)',
				changeText: 1,
				atStart: 'hide'
			});

			$('.collapseBlockHideMembership').collapser({
				target: 'next',
				mode: 'block',
				showText: 'Show Membership',
				hideText: 'Hide Membership',
				changeText: 1,
				atStart: 'hide'
			});

			$('.collapseLineShow').collapser({
				mode: 'lines',
				showText: '...Show More',
				hideText: '...Show Less',
				changeText: 1,
				atStart: 'hide',
				truncate: 2
			});

			$('.collapseLineShowTall').collapser({
				mode: 'lines',
				showText: '...Show More',
				hideText: '...Show Less',
				changeText: 1,
				atStart: 'hide',
				truncate: 8
			});

			$('.collapseWords li').collapser({
				mode: 'words',
				truncate: 2,
			});
			
		});
		
		</script>	
		<style>
			.show-class{
				background: #f2f2f2;
			}
			.hide-class{
				background: #fff;
			}
		</style>
		
		<link href="/assets/ico/crnet-icon-iTunesArtwork.png" rel="apple-touch-icon-precomposed">
		<link href="/assets/ico/crnet-icon.ico" rel="shortcut icon">
		
	</head>
	
	
		<body>
	
	
        <noscript>
            <div class="wrapper">
                <div class="wrap three-quarter offset">
					
                </div>
            </div>
        </noscript>
        <span id="top"></span>
        <a class="sr-only" href="#content">Skip navigation</a>
        <header class="header" role="banner">
            <div class="wrapper">
                <div class="branding-lg">
                    <a class="brand-lg" href="/" title="ClubRegistration.net"><span>ClubRegistration.net</span></a>
                </div>
                <div class="branding-sm">
                    <a class="brand-sm" href="/" title="ClubRegistration.net"><span>ClubRegistration.net</span></a>
                </div>
            </div>
        </header>
		
		
    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav">
			
				
				
					<li><a href="/the-shop/index.cfm">ClubReg Store</a></li>
				
					<li>
						<li><a href="//ontrackinsurance.com/index6.aspx" rel="external">Track Insurance</a></li>
					</li>
					<li>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Classifieds and More... <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/classifieds/index.cfm">Classifieds</a></li>							
							<li><a href="/the-shop/trackMaps.cfm">Track Maps</a></li>
							<li><a href="https://www.youtube.com/watch?t=9&v=xsMMPHMEtL0" target="_blank">Track Day Guide (video)</a></li>
							<li><a href="/racing-quotes/">Racing Quotes</a></li>
							<li><a href="/events/photos/photo_gallery.cfm">Photo Gallery</a></li>
							<li><a href="/screen-saver">Screen Saver (Auto Refreshes)</a></li>
						</ul>
					</li>
					
					
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Membership <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/membership/index.cfm?seriesSelected=Chicago Region PCA">Chicago Region PCA</a></li>
								<li><a href="/membership/index.cfm?seriesSelected=Just Track It">Just Track It</a></li>
								<li><a href="/membership/index.cfm?seriesSelected=PCA">Porsche Club of America</a></li>
							</ul>
						</li>
					
						<li><a href="/contact-us/">Contact Us</a></li>
					
			</ul>

            
            
				
                
                <ul class="nav navbar-nav navbar-left">
                    <li class="dropdown">
                        <a href="/driver/menuRegistrant.cfm" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/driver/home.cfm">Dashboard</a></li>
							<li><a href="/driver/eventHistory.cfm">Event History</a></li>
							
							
								<li><a href="/driver/eventReminder.cfm">Event Reminders</a></li>
								<li><a href="/misc/reserved_numbers_check.cfm">Search Reserved #s</a></li>
								<li><a href="/events/photos/upload.cfm">My Photo Gallery</a></li>
								<li><a href="/driver/classifieds/index.cfm">Classifieds</a></li>								
								<li><a href="/misc/faq/">FAQs</a></li>
							
							
							<li class="divider"></li>
							<li><a href="/driver/registrant_profile.cfm">Edit Profile</a></li>
							<li><a href="/driver/vehicle/vehicle_edit.cfm">Edit Vehicles</a></li>
							
							
								<li><a href="/driver/membership/membership_edit.cfm">Edit Memberships</a></li>
							
						</ul>
                    </li>
                    <li class="dropdown">
                        <a href="/driver/event_sign_up.cfm" class="dropdown-toggle" data-toggle="dropdown">Search for Events <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        
                        	
								<li><a href="/events/event-search.cfm">Find Event</a></li>
							
								<li><a href="/events/rosterAll.cfm">View All Rosters</a></li>
								<li class="divider"></li>
								<li><a href="/the-shop/index.cfm">Search Products</a></li>
							
                        </ul>
                    </li>
					
					
					
                </ul>

            
            <ul class="nav navbar-nav navbar-right">
				
                    <li><a href="/logout/" title="Logout">Logout <i class="fa fa-sign-out"></i></a></li>
                
            </ul>
        </div>
    </nav>

        
        <section class="content" id="content">


<script language="javascript">
	function getMembership(parent_organization)
		{
			self.location.href=("/membership/index.cfm?seriesSelected=" + parent_organization);
		}
	function eventViewPaymentScreen(eventID)
		{
			self.location.href=("/events/registerPayment.cfm?event_id=" + eventID);
		}
	function eventRoster(eventID)
		{
			self.location.href=("/events/roster.cfm?event_id=" + eventID);
		}
	function eventRegister(eventID)
		{
			self.location.href=("/events/register.cfm?event_id=" + eventID);
		}
	function setReminderYes(eventID)
		{
			self.location.href=("/driver/eventReminderUpdate.cfm?insertEvent=true&eventID=" + eventID);
		}
</script>




<div class="wrapper">
	<div class="left-rail-nav">
		<nav class="affix" role="complementary">
			<ul class="nav">
				<li><a href="#event-information">Event Information</a></li>
				
					<li><a href="#event-options">Event Options</a></li>
				
					<li><a href="#event-files">Related Files</a></li>
				
			</ul>
		</nav>
		
		
		<div class="text-center">
			
						<img src="/assets/img/logos/mardigras.jpg" alt="" style="width: 120px;">
					
		</div>
	</div>
	
	<div class="content-rail" role="main">
		
		<h1>Event Details <small>Mardi Gras Cup 2017 (Club Race)</small></h1>
		<section class="section" id="schedule-of-broadcasts">
	
		
		<section class="section" id="event-information">
			<h2>Event Information</h2>
			
				<table class="table table-condensed">
					<tbody>
						<tr>
							<td class="labels">Host</td>
							<td>
								Mardi Gras Region PCA 
							</td>
							<td class="text-center" rowspan="8">
								
								
															<button id="btnRegister8500" name="btnRegister8500" type="button" onClick="eventRegister(8500);" class="btn btn-alternate btn-sm btn-block btn-120">Register</button>
														
									<button id="btnRoster8500" name="btnRoster8500" type="button" onClick="eventRoster(8500);" class="btn btn-alternate btn-sm btn-block btn-120">View Roster</button>
								
									<button id="btnMembership8500" name="btnMembership8500" type="button" onClick="getMembership('PCA');" class="btn btn-alternate btn-sm btn-block btn-120">Get Membership</button>
								
							</td>
						</tr>
									
						
						<tr>
							<td class="labels">Registrar</td>
							<td>
								
								
									<a href="mailto:pcaclubrace@aol.com">pcaclubrace@aol.com</a> / (847) 272-7764																
								
							</td>
						</tr>
						
						
						
							<tr>
								<td class="labels">Location</td>
								<td>
									
											<a href="http://www.nolamotor.com" target="_blank">NOLA Motorsports Park - New Orleans, LA</a>
										
								</td>
							</tr>
						
						
						<tr>
							<td class="labels">Event Dates</td>
							<td>
								09/15/17&nbsp;-&nbsp;09/17/17 
							</td>
						</tr>	
						<tr><td class="labels" style="white-space: nowrap;">Registration Dates</td>
							<td>
								07/31/17 09:00 PM (members)
									<div class="label label-info">(central time zone)</div><br>
								07/31/17 (all)<br>
								09/10/17 11:59 PM (closes)
									<div class="label label-info">(central time zone)</div>
								
							</td>
						</tr>

						
						
							<tr>
								<td class="labels">Description</td>
								<td>
									<p class="text-left collapseLineShow">
										The PCA Mardi Gras and Whiskey Bay Regions proudly present<br><br>Mardi Gras Cup 2017<br>Sponsored by:<br>Porsche of New Orleans<br>NOLA Sport Porsche Specialist<br><br>Club Race & Driver's Education at<br>NOLA Motorsports Park<br>in New Orleans<br> <br>The points races at this Club Race will earn points towards the 944 Cup South and SouthWest Chapters Racing Series as well as the PCA National Championship Series.This is a 3 day event with practice sessions on Friday, 2 sprint races on Saturday, and 1.5 hour enduros on Sunday. The original 2.75 circuit with the "esses" will be used. <br><br>This is the 7th event in the 2017 PCA Trophy East ClubSport Race Series.<br><br>Optional Thursday Test & Tune /  NOLA Test Day Open to licensed racers only including Enduro ONLY co-drivers and coaches who want to get some extra track time. For pricing and additional details go to: <a href="https://www.motorsportreg.com/events/test-tune-at-nola-sept-14th-2017-north-track-motorsports-park-709272" target="_blank">NOLA Test Day</a> This is NOT a PCA Event. <br> <br>Friday - Sunday: There will be a DE group all three days for solo drivers. Enduro ONLY co-drivers and coaches who want to get some extra track time may register for the DE. (If you are registered as a Primary or Co-driver for the Weekend you may NOT register for the DE.) A Friday only option is also available. Click here for the DE registration site: <a href="https://clubregistration.net/events/event-details.cfm?event_id=8464" target="_blank">Mardi Gras Cup DE</a> Operated under PCA DE Rules.<br><br>Tire support:<br><br>JX2: 866.325.5426 <a href="http://www.jx2pg.com/pre-order-2/"target="_blank">www.jx2pg.com/pre-order-2/</a>  or <a href="mailto:customer.service@jx2pg.com">customer.service@jx2pg.com</a> <br><br>Bob Woodman Tires will be providing trackside tire support. They carry Hoosier, Toyo, and Yokohama tires. Racers are encouraged to reserve tires ahead of time to ensure availability. There is no obligation to purchase tires that have been reserved. Orders can be placed by calling 843-524-8473, or via email to sales@bobwoodmantires.com. Orders must be received no later than Friday, September 15th.<br><br>Parade Laps – We will be doing parade laps of the 2.75 mile course from 12:00 to 12:30 each day. $20 per car covers all three days. You will take about 5 laps behind a pace car at normal highway speeds.  Passengers are allowed. See Event Options.<br><br>Be sure to keep your personal info up to date, especially your email address and ICE contact. Go to the Main Menu Tab and select Edit Profile. Also, when choosing a car number, please check the roster first to see if your number is already taken.<br><br>Cancellation policy:  Refund with a $25 cancellation fee if notified by email 2 weeks prior to the event. Within 2 weeks, no refund however fees will be credited to any future Mardi Gras Region event. There are no refunds or credits for no-shows or anyone canceling after on-line registration closes.<br><br>Friday Night Party hosted by NOLASport Porsche Specialist<br>Wine, Beer, Snacks, and Sandwiches. - Free! <br>RSVP in Event Options. <br><br>Saturday night awards dinner at the NOLA MP Events Center. One ticket is included with your entry. See Event Options for extras.  <br><br>We realize that there are many hotel choices in New Orleans. The French Quarter and downtown are only 20 minutes away from the track. If you are looking for close and cheap, we do have a room block under the name "Porsche Club" at the Best Western Bayou Inn. $109/night plus taxes. Includes breakfast. This is the closest hotel to the track. (About 2 miles.) The special rate expires 3 weeks prior to the event.<br><br>Best Western Bayou Inn<br>9008 Westbank Expressway<br>Westwego, La 70094<br>504.304.7980<br>www.neworleansbestwestern.com<br><br>We have another room block at:<br><br>Candlewood Suites Avondale-New Orleans<br>3079 Highway 90<br>Avondale, LA 70094<br>Phone: (504) 875-3500<br>3 miles from the track<br>$119/night plus taxes<br>Mention Porsche Club<br><br>If you would like to reserve an RV or Transporter space with 20-amp & 50-amp power and water, contact Reynell at 504-302-4875 x106 or email reynell@nolamotor.com. The cost is $40/night. Spaces are 30' x 80'. A transporter with an awning would require 2 side by side RV spaces. 2 transporters could share 3 spaces with the awnings facing each other. <br><br>The Pit Stop Cafe' will be open each day. See the schedule for the exact hours. Take out and catering is also available from the Cafe'. There is also an event option when you register to order box lunches each day. Click the link below for menus.<br><br>Additional details may be found at:  <a href="http://www.mgpca.org/race" target="_blank">www.mgpca.org/race</a> <br>
									</p>
								</td>
							</tr>
						
							<tr>
								<td class="labels">Agreement</td>
								<td class="collapseLineShow">
									
									<em>All drivers, guests, crew and volunteers are required to complete at-track registration (sign waivers) and receive admittance wristbands.&nbsp; Minor waivers are required for all attendees who are minors (anyone under the age of 18).&nbsp; Please review the event file: Minor Waivers - a reminder.&nbsp;<br><br>It is PCA Club Racing policy that an unpaid registration will not be approved, confirmed, or assigned to a Run Group until fee payment has been received by the registrar.&nbsp; Any 'special circumstances' regarding fee payment should be brought to the attention of the event registrar immediately.&nbsp;<br><br>This event is held under the current PCA Club Racing Rules.&nbsp;<br><br>All PCA Club Race entrants are required to have a current PCA Club Racing License (or approved New License Application), current Medical Forms (on-file in the PCA Club Racing Office), and a current PCA Membership.&nbsp; (New License Applications must be received by the Club Racing Program Coordinator three weeks prior to the event.&nbsp;)<br><br>I agree to abide by the PCA Club Racing Rules and the supplementary regulations of this event.&nbsp;<br><br>I agree to indemnify and hold harmless the organizers of this event and their agents, with respect to the condition and preparation of my registered car, or any subsequent failure or damage to my registered car or its occupants as a result of such failures.&nbsp;  <br><br>I understand that I am required to reimburse NOLA Motorsports Park for any fees or physical damage to the track or its facilities caused by myself, my crew, and my guests and that these are not covered in my registration fee.&nbsp;<br><br>I acknowledge that at all times I remain solely responsible for the safety and roadworthiness of my registered car.&nbsp;  <br><br>All Rookie Candidates and First Time Provisionals for whom this will be their first PCA Club Race MUST attend the Orientation Meeting.&nbsp; Others may be required to attend by invitation.&nbsp; Participants will be notified and information regarding time, place, and date may be obtained from the event registrar.&nbsp;<br><br>The points races at this Club Race will earn points towards the the 944 Cup South and SouthWest Chapter Racing Series as well as the PCA National Championship Points Series.&nbsp;<br><br>Cancellation policy:  Refund with a $25 cancellation fee if notified by email 2 weeks prior to the event.&nbsp; Within 2 weeks, no refund however fees will be credited to any future Mardi Gras Region event.&nbsp; There are no refunds or credits for no-shows or anyone canceling after on-line registration closes.&nbsp;<br></em>
								</td>
							</tr>
						
					</tbody>
				</table>
			
		</section>
		<div class="to-top all-media"><a href="#top">Back to Top</a></div>

		
		
			<section class="section" id="event-options">
				<h2>Event Options</h2>
				<table class="table table-bordered table-condensed">
					<thead>
						<tr>
							<th>Event Options</th>
							<th width="100">Fee</th>
						</tr>
					</thead>
					
					<tbody>
						
									<tr>
										<td>
											<strong>Primary Driver Weekend package</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>Includes 2 Sprint Races, Enduro Race, Saturday Dinner, and Event T-shirt.&nbsp;<br><br>If you will drive/share a different car in the Enduro please also complete the ENDURO CO-Driver option in order to desiginate your Enduro car and co-driver.&nbsp; </em></p>
										</td>
										<td class="text-right">$625.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>Co-Driver Weekend package</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>Includes 2 Sprint Races, Enduro Race, Saturday Dinner, and Event T-shirt.&nbsp;<br><br>Please use this option if you are the 2nd driver in shared car and will drive out of class.&nbsp;<br><br>If you will drive/share a different car in the Enduro please also complete the ENDURO CO-Driver option in order to desiginate your Enduro car and co-driver.&nbsp; </em></p>
										</td>
										<td class="text-right">$625.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>Enduro CO-Driver (Select if you answered YES to Question #1/I will share/co-drive the Enduro with...)</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>Use this option ONLY if you will co-drive the Enduro in a car different than the car registered in your Weekend  Package registration.&nbsp; Please select the name of the Enduro Primary Driver from the drop down box.&nbsp; This option requires a Weekend Package registration.&nbsp;<br><br>Enduro ONLY co-drivers should not use this option.&nbsp;</em></p>
										</td>
										<td class="text-right">$0.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>Enduro ONLY Co-Driver</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>90 minute Enduro.&nbsp; <br><br>Please use this option only if you are the 2nd driver in shared Enduro Race car AND you have not selected the Weekend Event Package.&nbsp;<br><br>Includes Saturday Dinner, and Event T-shirt.&nbsp;</em></p>
										</td>
										<td class="text-right">$150.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>Driver Event T-Shirt</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>Free shirt with entry - please select size here</em></p>
										</td>
										<td class="text-right">$0.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>EXTRA Event T-Shirt(s)</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>For family, friends, and crew!</em></p>
										</td>
										<td class="text-right">$20.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>EXTRA Saturday Night Dinner ticket</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>Sprint Race Awards Dinner Party at the NOLA Motorsports Park Event Center.&nbsp; - for family, friends, and crew!</em></p>
										</td>
										<td class="text-right">$40.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>Weekend Garage Rental</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>20’ x 25’ garage with overhead door that can be locked.&nbsp; Climate controlled, 110v/220v power, water, and compressed air.&nbsp; </em></p>
										</td>
										<td class="text-right">$250.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>Golf Cart Rental</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>Weekend golf cart rental.&nbsp; 4 seater, rear seat flips down to make a cargo deck.&nbsp;</em></p>
										</td>
										<td class="text-right">$350.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>Parade Laps (during the lunch hour)</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>Fee for 1 car all 3 days.&nbsp; Passengers are allowed.&nbsp;</em></p>
										</td>
										<td class="text-right">$20.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>Friday Box Lunches</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>Box Lunch description: Pre-order box lunches from the Pit Stop which will be delivered to the paddock.&nbsp; There will be an assortment to to chose from.&nbsp; A soft drink or water is included.&nbsp; </em></p>
										</td>
										<td class="text-right">$15.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>Saturday Box Lunches</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>Box Lunch description: Pre-order box lunches from the Pit Stop which will be delivered to the paddock.&nbsp; There will be an assortment to to chose from.&nbsp; A soft drink or water is included.&nbsp; </em></p>
										</td>
										<td class="text-right">$15.00</td>
									</tr>
								
									<tr>
										<td>
											<strong>Sunday Box Lunches</strong><br>
											
											
											
											<p class="text-left collapseLineShow"><em>Box Lunch description: Pre-order box lunches from the Pit Stop which will be delivered to the paddock.&nbsp; There will be an assortment to to chose from.&nbsp; A soft drink or water is included.&nbsp; </em></p>
										</td>
										<td class="text-right">$15.00</td>
									</tr>
								
					</tbody>
				</table>
			</section>
			<div class="to-top all-media"><a href="#top">Back to Top</a></div>
		
			<section class="section" id="event-files">
				<h2>Event Files</h2>
				
				
				<table class="table table-bordered table-condensed">
						<thead>
							<tr>
								<th>Click to view</th>
							</tr>
						</thead>
						
						<tbody>
							
									<tr>
										<td>
											<a href="/club_admin/files/Mardi Gras Region PCA/NOLApaddock.pdf" target="_blank">NOLApaddock.pdf</a>
										</td>
									</tr>
								
									<tr>
										<td>
											<a href="/club_admin/files/Mardi Gras Region PCA/NOLAtrackmap.pdf" target="_blank">NOLAtrackmap.pdf</a>
										</td>
									</tr>
								
									<tr>
										<td>
											<a href="/club_admin/files/Mardi Gras Region PCA/nolatrackrules.pdf" target="_blank">nolatrackrules.pdf</a>
										</td>
									</tr>
								
									<tr>
										<td>
											<a href="/club_admin/files/Mardi Gras Region PCA/PCA2017ScheduleV3.pdf" target="_blank">PCA2017ScheduleV3.pdf</a>
										</td>
									</tr>
									
						</tbody>
					</table>
			</section>
			<div class="to-top all-media"><a href="#top">Back to Top</a></div>
		

		
		<div class="wrap full text-center">
			
			<div class="sponsors-image text-center">
			
				
					<small><em>ClubRegistration.net sponsor</em></small>
				
					<a href="http://www.competitionMotorsport.com" target="_blank">
						
							<img src="https://clubregistration.net/assets/img/sponsors/competitionMotorsport%2Epng" alt="Competition Motorsport" style="width: 350px;">
						
					</a>
				
					<p class="alert alert-info text-center" style="width: 312px;">All the top motorsport brands. The best service in the business. At the lowest prices in the nation.</p>
				
			</div>
		
		</div>
	</div>
</div>



        </section>
		<footer class="footer" role="contentinfo">
			<div class="wrapper">
				
				
	<div class="text-center">
		
			<a href="/racing-quotes">
				<em>"Oh yes. It's not when you brake but when you take them off that counts." -Jackie Stewart</em>
			</a>
		
	</div>
	<br>

	<div class="text-center" style="padding-bottom: 10px;">
		
			<table style="margin: 0 auto;">
				<tr>
					 
						<td style="text-align: center; vertical-align: top; padding-right: 10px;">
							
									<a href="//clubregistration.net/the-shop/index.cfm/productid/998">
										<img class="product-image" src="//clubregistration.net/assets/img/products/motorphoriaCOTA.png" alt="Track Map Earrings" style="width: 100px;">
									</a>
								
						</td>
					
					<td style="text-align: left; vertical-align: top; width: 600px;">
						
								<a href="https://clubregistration.net/the-shop/index.cfm/productid/998"><strong>Track Map Earrings</strong></a>&nbsp;($28.00)
								<br>
								<em>Silver tone wire earrings hand bent into the shape of your favorite track. Faux diamond rhinestone marks the start/finish line.<br><br>The track dangles approximately 2.5" from the top of the hook. Available in Gold or Silver tone wire.<br><br>Only ships to United States from Marysville, Washington.</em>
							
					</td>
				</tr>
			</table>
		
	</div>

				
				<hr>
				
				<div class="legal">
					<ul>
						<li>Copyright &copy; 2017 ClubRegistration.net LLC. All rights reserved.</li>
						<li><a href="/privacy/" title="Privacy Policy">Privacy Policy</a></li>
						<li>Office: 512.273.5016</li>
					</ul>
				</div>
				<small class="facebook">
					<a href="//www.facebook.com/ClubRegistration" rel="external" title="Follow us on Facebook!"><i class="fa fa-facebook-square fa-3x"></i></a>
				</small>
			</div>
		</footer>
        <script src="/assets/js/bootstrap.min.js?v=3.0.0"></script>
        <script src="/assets/js/holder.js?v=2.0.0"></script>
        <script src="/assets/js/retina.js?v=0.0.2"></script>
        <script src="/assets/js/jquery.smooth-scroll.min.js?v=1.4.11"></script>
        <script src="/assets/js/scripts.js"></script>
        <script src="/assets/js/common.js"></script>
		<script src="/assets/js/libs/DataTables-1.9.4/media/js/jquery.dataTables.min.js?v=1.9.4"></script>
    </body>
</html>
EOF

return $content;
}

1;
