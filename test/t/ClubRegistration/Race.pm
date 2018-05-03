package TestsFor::RennPoints::ClubRegistration::Race;
use Test::Class::Moose;
use RennPoints::ClubRegistration::Race;
use Data::Dumper;

sub test_participants {
    my $test = shift;

    isa_ok my $event = RennPoints::ClubRegistration::Race->new( content => getContent(), id => 0 ), 'RennPoints::ClubRegistration::Race';
    is @{$event->participants}, 106, 'test number of participants';
    is_deeply $event->participants->[0], { 'number' => '98',
					   'race' => 'BLUE Sprint',
					   'car' => 'Boxster (1997 White)',
					   'name' => 'Hoeh, Henry',
					   'class' => 'SPB'
    }, 'test structure of first participant';
}

sub getContent {
my $content =<<'EOF';
{
	"aaData": 
	[

		
		
			[
				
						"Hoeh, Henry "
					
						
							,"Porsche Boxster (1997 White)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"98"
							
			]
			, 
			[
				
						"Lepore, Antonio "
					
						
							,"Porsche SPB (1999 Black)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"043"
							
			]
			, 
			[
				
						"Haile, Alexander "
					
						
							,"930 Porsche (1986 Gray)"
						
						
						,"Modified - GT3","RED Sprint"
						
								,"776"
							
			]
			, 
			[
				
						"Crook, Andy "
					
						
							,"Porsche Spec Boxster (1999 Blue)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=92060' data-target='#vehicleImage14058'><img src='/assets/img/eventPhotosSet05/IMG_0129.JPG' style='height: 20px;'></a><div class='modal fade' id='vehicleImage14058' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"68"
							
			]
			, 
			[
				
						"Giannone, Andrew "
					
						
							,"Porsche 996 (2003 Silver)"
						
						
						,"Modified - GTB1","RED Sprint"
						
								,"024"
							
			]
			, 
			[
				
						"Calhoon, Brian "
					
						
							,"Porsche Boxster (1997 Arena red)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"302"
							
			]
			, 
			[
				
						"Hirsch, Ben "
					
						
							,"Porsche Spec Boxster (1999 Blue)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"64"
							
			]
			, 
			[
				
						"Kaempf, Claudio "
					
						
							,"Porsche 911 (1970 Blue)"
						
						
						,"Modified - GT4","RED Sprint"
						
								,"66"
							
			]
			, 
			[
				
						"Asplundh, Brent "
					
						
							,"Porsche 997 GT3 Cup (2011 White & Black)"
						
						
						,"Spec - GTC5","RED Sprint"
						
								,"44"
							
			]
			, 
			[
				
						"Brown, Anthony "
					
						
							,"Porsche Cayman (2009 Silver)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=130466' data-target='#vehicleImage15931'><img src='/assets/img/eventPhotosSet06/IMG_0073.JPG.jpeg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage15931' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Stock - G","YELLOW Sprint"
						
								,"55"
							
			]
			, 
			[
				
						"Tallardy, Carl "
					
						
							,"Porsche 911 Fabcar (1995 blue)"
						
						
						,"Modified - GTP2","RED Sprint"
						
								,"96"
							
			]
			, 
			[
				
						"Coulter, Bill "
					
						
							,"Porsche 996 (1999 Black)"
						
						
						,"Prepared - I","YELLOW Sprint"
						
								,"412"
							
			]
			, 
			[
				
						"Fero, Doug "
					
						
							,"Porsche Cayman S (2008 Black)"
						
						
						,"Modified - GTB1","RED Sprint"
						
								,"31"
							
			]
			, 
			[
				
						"Fahy, Christopher "
					
						
							,"Porsche 944 Turbo (1986 Black)"
						
						
						,"Stock - E","YELLOW Sprint"
						
								,"353"
							
			]
			, 
			[
				
						"Nagele, Chris "
					
						
							,"Cayman Porsche (2012 Black)"
						
						
						,"Stock - I","YELLOW Sprint"
						
								,"871"
							
			]
			, 
			[
				
						"Landstra, Elaine "
					
						
							,"Porsche Boxster (1998 Blue, Yellow, Red stripes)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=116104' data-target='#vehicleImage14321'><img src='/assets/img/eventPhotosSet05/NJMP_Showdown_Aug2016.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage14321' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"431"
							
			]
			, 
			[
				
						"Dunigan, David "
					
						
							,"Porsche Boxster (1997 Silver)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"400"
							
			]
			, 
			[
				
						"Mansfield, Joseph "
					
						
							,"Porsche GT 3 Cup (2007 White)"
						
						
						,"Spec - GTC4","RED Sprint"
						
								,"32"
							
			]
			, 
			[
				
						"Mills, Christopher "
					
						
							,"Boxster Porsche (1997 Black)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"622"
							
			]
			, 
			[
				
						"Dabell, Dave "
					
						
							,"Porsche Boxster (1998 silver)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"189"
							
			]
			, 
			[
				
						"Felker, David "
					
						
							,"Porsche Boxster (1999 Yellow)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"45"
							
			]
			, 
			[
				
						"Belluardo, Charles "
					
						
							,"Porsche Cayman (2010 White/Green)"
						
						
						,"Modified - GTB1","RED Sprint"
						
								,"37"
							
			]
			, 
			[
				
						"McFadden, Corey "
					
						
							,"Porsche Cayman S (2006 Black)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=125873' data-target='#vehicleImage14643'><img src='/assets/img/eventPhotosSet05/carsmallIMG_4925.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage14643' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPC","RED Sprint"
						
								,"80"
							
			]
			, 
			[
				
						"Mazzola, Colin "
					
						
							,"Porsche 964 Cup (1992 Rubystone)"
						
						
						,"Spec - GTC1","YELLOW Sprint"
						
								,"119"
							
			]
			, 
			[
				
						"Troutman, Doug "
					
						
							,"Porsche 996 GT3 Cup (2005 White)"
						
						
						,"Spec - GTC3","RED Sprint"
						
								,"427"
							
			]
			, 
			[
				
						"Evringham, Keith "
					
						
							,"Porsche 944 (1987 red)"
						
						
						,"Spec - SP1","BLUE Sprint"
						
								,"444"
							
			]
			, 
			[
				
						"Drake, Chris "
					
						
							,"Porsche Boxster (1999 White / Blue / Martini)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=87036' data-target='#vehicleImage10279'><img src='/assets/img/eventPhotosSet03/10362804_395182983993117_843103147943100313_o.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage10279' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"750"
							
			]
			, 
			[
				
						"Covert, Jeff "
					
						
							,"Porsche Spec Boxster (1999 silver/blue)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"413"
							
			]
			, 
			[
				
						"Roque, Jose "
					
						
							,"Porsche gt3 cup (2004 white)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=106316' data-target='#vehicleImage14392'><img src='/assets/img/eventPhotosSet05/_WOL3255.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage14392' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - GTC3","RED Sprint"
						
								,"104"
							
			]
			, 
			[
				
						"Martin, Jimmy "
					
						
							,"Porsche Carrera (2009 White/Blue)"
						
						
						,"Stock - I","YELLOW Sprint"
						
								,"57"
							
			]
			, 
			[
				
						"Clickner, Shawn "
					
						
							,"Porsche Boxster S (2000 black)"
						
						
						,"Stock - F","YELLOW Sprint"
						
								,"437"
							
			]
			, 
			[
				
						"Frank, John "
					
						
							,"Porsche Carrera S (2009 Black)"
						
						
						,"Modified - GT3","RED Sprint"
						
								,"707"
							
			]
			, 
			[
				
						"Bednarsh, Jonathan "
					
						
							,"Porsche Boxster (1997 White)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"61"
							
			]
			, 
			[
				
						"Barna, John "
					
						
							,"Porsche Boxster (1999 Silver)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"581"
							
			]
			, 
			[
				
						"Nikic, Jason "
					
						
							,"Porsche 911 (1978 Blue)"
						
						
						,"Prepared - E","YELLOW Sprint"
						
								,"27"
							
			]
			, 
			[
				
						"Weining, Mark "
					
						
							,"Porsche 911SC Euro (1982 Slvr, Red)"
						
						
						,"Stock - E","YELLOW Sprint"
						
								,"7"
							
			]
			, 
			[
				
						"Raymondi, Gene "
					
						
							,"Porsche Boxster (2004 Black)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=66110' data-target='#vehicleImage10148'><img src='/assets/img/eventPhotosSet03/raindancer.JPG' style='height: 20px;'></a><div class='modal fade' id='vehicleImage10148' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Stock - E","YELLOW Sprint"
						
								,"77"
							
			]
			, 
			[
				
						"Lee, Jason "
					
						
							,"991 Porsche (2014 Black)"
						
						
						,"Modified - GTA3","RED Sprint"
						
								,"26"
							
			]
			, 
			[
				
						"Kane, Henry "
					
						
							,"Porsche 944 Turbo (1988 Burgandy)"
						
						
						,"Spec - SP3","BLUE Sprint"
						
								,"103"
							
			]
			, 
			[
				
						"Adams, Jeffrey "
					
						
							,"cayman s porsche (2006 gray)"
						
						
						,"Stock - H","YELLOW Sprint"
						
								,"123"
							
			]
			, 
			[
				
						"Houston, John "
					
						
							,"SPEC Boxster 986 (1997 Silver)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"830"
							
			]
			, 
			[
				
						"Mann, J. David "
					
						
							,"Porsche 944 (1986 Dark Blue)"
						
						
						,"Spec - SP2 Stock","BLUE Sprint"
						
								,"72"
							
			]
			, 
			[
				
						"Vieira, Joshua "
					
						
							,"Porsche 944 (1987 Red)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=106551' data-target='#vehicleImage10703'><img src='/assets/img/eventPhotosSet03/IMG_0700.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage10703' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SP2 Stock","BLUE Sprint"
						
								,"75"
							
			]
			, 
			[
				
						"Agena, Ken "
					
						
							,"Porsche 996 GT3 (2004 White)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=74240' data-target='#vehicleImage14255'><img src='/assets/img/eventPhotosSet05/NJMP Trophy.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage14255' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Prepared - J","YELLOW Sprint"
						
								,"371"
							
			]
			, 
			[
				
						"Muller, Jeffrey "
					
						
							,"Porsche 944S2 (1989 Black)"
						
						
						,"Spec - SP3","BLUE Sprint"
						
								,"124"
							
			]
			, 
			[
				
						"Beidler, John "
					
						
							,"Porsche Boxster (1998 silver)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"410"
							
			]
			, 
			[
				
						"Kintzi, Harry "
					
						
							,"Porsche Boxster S (2001 Silver)"
						
						
						,"Prepared - F","YELLOW Sprint"
						
								,"986"
							
			]
			, 
			[
				
						"Pray, Franklin "
					
						
							,"Porsche Cayman S (2012 White)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=122736' data-target='#vehicleImage12767'><img src='/assets/img/eventPhotosSet04/Screen Shot 2016-10-12 at 1.16.16 PM.png' style='height: 20px;'></a><div class='modal fade' id='vehicleImage12767' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Modified - GTB1","RED Sprint"
						
								,"777"
							
			]
			, 
			[
				
						"Gralton, John "
					
						
							,"Porsche 996 GT3 (2004 Black)"
						
						
						,"Stock - J","YELLOW Sprint"
						
								,"540"
							
			]
			, 
			[
				
						"Pugliano, Lorenzo "
					
						
							,"Porsche Boxster (2001 Orange)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=116766' data-target='#vehicleImage14993'><img src='/assets/img/eventPhotosSet06/_DSC3633-L.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage14993' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Stock - F","YELLOW Sprint"
						
								,"861"
							
			]
			, 
			[
				
						"Distefano, Matt "
					
						
							,"Porsche Cayman S (2007 Black)"
						
						
						,"Spec - SPC","RED Sprint"
						
								,"93"
							
			]
			, 
			[
				
						"Poor, John "
					
						
							,"Porsche 914-6 (1970 Tangerine)"
						
						
						,"Modified - GT4","RED Sprint"
						
								,"170"
							
			]
			, 
			[
				
						"Pryor, Kenneth "
					
						
							,"Porsche 996 gt3 (2004 black)"
						
						
						,"Stock - J","YELLOW Sprint"
						
								,"818"
							
			]
			, 
			[
				
						"Ammidon, Hoyt "
					
						
							,"Porsche Boxster (1999 White)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"83"
							
			]
			, 
			[
				
						"Altman, Howard "
					
						
							,"Porsche Cayman S (2011 White)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=116301' data-target='#vehicleImage14745'><img src='/assets/img/eventPhotosSet03/Munster_Cars_002.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage14745' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Modified - GTB1","RED Sprint"
						
								,"416"
							
			]
			, 
			[
				
						"Emro, Michael "
					
						
							,"Porsche Boxster (1999 silver)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"192"
							
			]
			, 
			[
				
						"Gibbons, Sean "
					
						
							,"Porsche Boxster (1997 Silver)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=120078' data-target='#vehicleImage15265'><img src='/assets/img/eventPhotosSet06/AMB_4844.JPG' style='height: 20px;'></a><div class='modal fade' id='vehicleImage15265' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"1"
							
			]
			, 
			[
				
						"Goldman, Steven "
					
						
							,"Porsche Boxster S (2005 Silver)"
						
						
						,"Stock - G","YELLOW Sprint"
						
								,"599"
							
			]
			, 
			[
				
						"Pajonas, Todd "
					
						
							,"Porsche Cayman S (2006 White Martini)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=96967' data-target='#vehicleImage14986'><img src='/assets/img/eventPhotosSet06/IMG_20151023_094546092_HDR.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage14986' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPC","RED Sprint"
						
								,"806"
							
			]
			, 
			[
				
						"Katz, Steve "
					
						
							,"Porsche 996 Cup (2005 white)"
						
						
						,"Spec - GTC3","RED Sprint"
						
								,"113"
							
			]
			, 
			[
				
						"Giuliante, Robert "
					
						
							,"Porsche Boxster (1997 black)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"25"
							
			]
			, 
			[
				
						"Kuchrawy, Dave "
					
						
							,"Porsche Cayman (2009 Black)"
						
						
						,"Modified - GTB1","RED Sprint"
						
								,"225"
							
			]
			, 
			[
				
						"Wilson, Robbie "
					
						
							,"Porsche 944 (1986 Black)"
						
						
						,"Spec - SP2 Stock","BLUE Sprint"
						
								,"171"
							
			]
			, 
			[
				
						"Holmes, Michael "
					
						
							,"Porsche Boxster (1997 Silver)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"311"
							
			]
			, 
			[
				
						"Debusmann, Peter "
					
						
							,"Porsche 996 (1999 Silver)"
						
						
						,"Stock - H","YELLOW Sprint"
						
								,"125"
							
			]
			, 
			[
				
						"Schindler, Steve "
					
						
							,"Porsche boxster s (2003 red)"
						
						
						,"Stock - F","YELLOW Sprint"
						
								,"992"
							
			]
			, 
			[
				
						"Winne, Rich "
					
						
							,"Porsche 911 (1990 white)"
						
						
						,"Stock - G","YELLOW Sprint"
						
								,"28"
							
			]
			, 
			[
				
						"Bresnahan, Scott "
					
						
							,"Porsche 911 (1988 red)"
						
						
						,"Stock - E","YELLOW Sprint"
						
								,"09"
							
			]
			, 
			[
				
						"Simon, Jordan "
					
						
							,"Porsche Boxster S (2004 Red)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=124688' data-target='#vehicleImage13351'><img src='/assets/img/eventPhotosSet04/IMG953599.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage13351' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Stock - F","YELLOW Sprint"
						
								,"54"
							
			]
			, 
			[
				
						"Azierski, Mark "
					
						
							,"Porsche Cayman (2007 silver)"
						
						
						,"Prepared - I","YELLOW Sprint"
						
								,"42"
							
			]
			, 
			[
				
						"Rothenberger, James "
					
						
							,"Porsche 944 (1985 Orange/Gray)"
						
						
						,"Spec - SP2 Prep","BLUE Sprint"
						
								,"183"
							
			]
			, 
			[
				
						"DeCastro, Damon "
					
						
							,"Porsche 951s (1987 Red)"
						
						
						,"Spec - SP3","BLUE Sprint"
						
								,"525"
							
			]
			, 
			[
				
						"Devany, Paul "
					
						
							,"Porsche Boxster (1999 Polar Silver)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=42389' data-target='#vehicleImage10690'><img src='/assets/img/eventPhotosSet03/Spec Box LRP.JPG' style='height: 20px;'></a><div class='modal fade' id='vehicleImage10690' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"603"
							
			]
			, 
			[
				
						"Solk, Paul "
					
						
							,"Porsche Boxster S (2009 Grey Goose)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=120646' data-target='#vehicleImage11222'><img src='/assets/img/eventPhotosSet02/IMG50235.JPG' style='height: 20px;'></a><div class='modal fade' id='vehicleImage11222' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Stock - I","YELLOW Sprint"
						
								,"8"
							
			]
			, 
			[
				
						"Martinez, Jr., Manny "
					
						
							,"Porsche Cayman S (2006 Black)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=120552' data-target='#vehicleImage14652'><img src='/assets/img/eventPhotosSet05/IMG_5653.JPG' style='height: 20px;'></a><div class='modal fade' id='vehicleImage14652' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPC","RED Sprint"
						
								,"700"
							
			]
			, 
			[
				
						"Daiger, Scott "
					
						
							,"Porsche 911GT3 cup (2015 Silver)"
						
						
						,"Modified - GTA3","RED Sprint"
						
								,"009"
							
			]
			, 
			[
				
						"Tremper, Pete "
					
						
							,"Porsche 964 (1990 BLACK)"
						
						
						,"Prepared - H","YELLOW Sprint"
						
								,"63"
							
			]
			, 
			[
				
						"Smotrich, Steven "
					
						
							,"Porsche 911 SC (1978 red)"
						
						
						,"Stock - D","YELLOW Sprint"
						
								,"78"
							
			]
			, 
			[
				
						"McMahon, Hunt "
					
						
							,"Porsche 986 (1999 Arena Red/White)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=121279' data-target='#vehicleImage15418'><img src='/assets/img/eventPhotosSet06/_23a2787c copy 2.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage15418' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"611"
							
			]
			, 
			[
				
						"Kohler, Thomas "
					
						
							,"Porsche 911 (1995 Red)"
						
						
						,"Modified - GT4","RED Sprint"
						
								,"43"
							
			]
			, 
			[
				
						"Belles, Scott "
					
						
							,"Porsche Boxster (1999 Red)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"19"
							
			]
			, 
			[
				
						"Shrem, Leslie "
					
						
							,"Porsche GT2 (2003 Blue)"
						
						
						,"Modified - GT1","RED Sprint"
						
								,"172"
							
			]
			, 
			[
				
						"Embler, Michael "
					
						
							,"Porsche Cayman S (2012 White+Brown)"
						
						
						,"Modified - GTB1","RED Sprint"
						
								,"87"
							
			]
			, 
			[
				
						"Pensabene, Marc "
					
						
							,"Porsche Boxster (1999 Silver)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=112422' data-target='#vehicleImage10696'><img src='/assets/img/eventPhotosSet03/20160603_WGI_GRN_JC Leder (clean).jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage10696' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"10"
							
			]
			, 
			[
				
						"Stenko, Michael "
					
						
							,"Porsche Boxster (2003 White)"
						
						
						,"Stock - F","YELLOW Sprint"
						
								,"73"
							
			]
			, 
			[
				
						"Asplundh, Scott "
					
						
							,"Cayman R Porsche (2012 White, Orange, Black)"
						
						
						,"Modified - GTB1","RED Sprint"
						
								,"033"
							
			]
			, 
			[
				
						"Osborn, Frank "
					
						
							,"Porsche Boxster (2004 White)"
						
						
						,"Stock - E","YELLOW Sprint"
						
								,"313"
							
			]
			, 
			[
				
						"Provost, Robert "
					
						
							,"Porsche Boxster (1999 silver)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"109"
							
			]
			, 
			[
				
						"Rudtner, Bill "
					
						
							,"Porsche Boxster (1997 blue)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"2"
							
			]
			, 
			[
				
						"Stephen, Tom "
					
						
							,"Porsche Boxster (99 Blue)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=125207' data-target='#vehicleImage15751'><img src='/assets/img/eventPhotosSet06/Toms I Phone 922.JPG' style='height: 20px;'></a><div class='modal fade' id='vehicleImage15751' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"314"
							
			]
			, 
			[
				
						"Cohen, Steven "
					
						
							,"Porsche Boxster (1998 Blue)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"318"
							
			]
			, 
			[
				
						"Kalra, Sudhir "
					
						
							,"Boxster Porsche (1997 Orange)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"216"
							
			]
			, 
			[
				
						"Yanni, Nahel "
					
						
							,"Porsche Cayman S (2008 Black)"
						
						
						,"Stock - H","YELLOW Sprint"
						
								,"23"
							
			]
			, 
			[
				
						"Hargesheimer, Bob "
					
						
							,"Porsche 997 Cup (2007 White)"
						
						
						,"Spec - GTC4","RED Sprint"
						
								,"51"
							
			]
			, 
			[
				
						"Linz, Steve "
					
						
							,"Porsche 968 (1995 Black)"
						
						
						,"Spec - SP3","BLUE Sprint"
						
								,"46"
							
			]
			, 
			[
				
						"Nielsen, Kenneth "
					
						
							,"Porsche Cayman (2012 White)"
						
						
						,"Modified - GTB1","RED Sprint"
						
								,"12"
							
			]
			, 
			[
				
						"Vogelsong, Adam "
					
						
							,"Porsche Boxster (1999 Army Green)"
						
						
						,"Spec - SPB","BLUE Sprint"
						
								,"49"
							
			]
			, 
			[
				
						"Lefco, Terry "
					
						
							,"Porsche GT3 (2007 white)&nbsp;<a data-toggle='modal' href='/misc/vehicleImages/incDetails.cfm?vehicleID=59441' data-target='#vehicleImage15467'><img src='/assets/img/eventPhotosSet06/3167B.jpg' style='height: 20px;'></a><div class='modal fade' id='vehicleImage15467' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'></div>"
						
						
						,"Modified - GT2","RED Sprint"
						
								,"11"
							
			]
			, 
			[
				
						"Holt Jr., T. "
					
						
							,"Porsche 997 Cup (2007 Black)"
						
						
						,"Spec - GTC4","RED Sprint"
						
								,"333"
							
			]
			, 
			[
				
						"Branthover, Rob "
					
						
							,"Porsche 968 (1995 Black)"
						
						
						,"Spec - SP3","BLUE Sprint"
						
								,"71"
							
			]
			, 
			[
				
						"Sherman, Jim "
					
						
							,"Porsche 944 Turbo (1986 Yellow)"
						
						
						,"Spec - SP3","BLUE Sprint"
						
								,"177"
							
			]
			, 
			[
				
						"Holt, Timothy "
					
						
							,"GT3 RS Porsche (2001 White)"
						
						
						,"Modified - GTA1","RED Sprint"
						
								,"33"
							
			]
			, 
			[
				
						"Cheng, Lester "
					
						
							,"Porsche Cayman (2006 Black)"
						
						
						,"Spec - SPC","RED Sprint"
						
								,"168"
							
			]
			, 
			[
				
						"Criscito, Michael "
					
						
							,"Porsche Cayman R (2012 Black)"
						
						
						,"Stock - I","YELLOW Sprint"
						
								,"878"
							
			]
			, 
			[
				
						"Okun, Martin "
					
						
							,"Porsche 944 (1986 Red)"
						
						
						,"Spec - SP2 Prep","Unassigned"
						
								,"504"
							
			]
			, 
			[
				
						"Basha, Eugen "
					
						
							,"Porsche 911 (1986 White)"
						
						
						,"Stock - E","YELLOW Sprint"
						
								,"122"
							
			]
			
	]
}
EOF

return $content;
}

1;
