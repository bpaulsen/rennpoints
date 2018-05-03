package TestsFor::RennPoints::ClubRacing::Event;
use Test::Class::Moose;
use RennPoints::ClubRacing::Event;

# methods that begin with test_ are test methods.
sub test_parse_races {
    my $test = shift;

    isa_ok my $event = RennPoints::ClubRacing::Event->new( content => getContent() ), 'RennPoints::ClubRacing::Event';
    is @{$event->races}, 6, "Testing number of races that were parsed";
    is $event->races->[0], 'http://turbo.pcaclubracing.org/wp-content/uploads/results/current/COTA/RedSprint1.html', 'Check name of first race';

    isa_ok $event = RennPoints::ClubRacing::Event->new( content => getContent2() ), 'RennPoints::ClubRacing::Event';
    is @{$event->races}, 11, "Testing number of races that were parsed";
    is $event->races->[10], 'http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/PinkEnduro.html', 'Check name of first race';
}

sub getContent {
    return <<'EOF';
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row --><div class=" et_pb_row et_pb_row_4">
<div class="et_pb_column et_pb_column_1_3  et_pb_column_6 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_module et_pb_toggle et_pb_toggle_close  et_pb_toggle_0 et_pb_toggle_item">


<h5 class="et_pb_toggle_title">Sprint 1</h5>
<div class="et_pb_toggle_content clearfix">
 <a href="http://turbo.pcaclubracing.org/wp-content/uploads/results/current/COTA/RedSprint1.html" target="_blank" rel="noopener">Group 1 &#8211; Red</a><br />
<a href="http://turbo.pcaclubracing.org/wp-content/uploads/results/current/COTA/BlueSprint1.html" target="_blank" rel="noopener">Group 4 &#8211; Blue</a>
</div> <!-- .et_pb_toggle_content -->
</div> <!-- .et_pb_toggle -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_3  et_pb_column_7 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_module et_pb_toggle et_pb_toggle_close  et_pb_toggle_1 et_pb_toggle_item">


<h5 class="et_pb_toggle_title">Sprint 2</h5>
<div class="et_pb_toggle_content clearfix">
 <a href="http://turbo.pcaclubracing.org/wp-content/uploads/results/current/COTA/RedSprint2.html" target="_blank" rel="noopener">Group 1 &#8211; Red</a><br />
<a href="http://turbo.pcaclubracing.org/wp-content/uploads/results/current/COTA/BlueSprint2.html" target="_blank" rel="noopener">Group 4 &#8211; Blue</a>
</div> <!-- .et_pb_toggle_content -->
</div> <!-- .et_pb_toggle -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_3  et_pb_column_8 et_pb_css_mix_blend_mode_passthrough et-last-child">


<div class="et_pb_module et_pb_toggle et_pb_toggle_close  et_pb_toggle_2 et_pb_toggle_item">


<h5 class="et_pb_toggle_title">Enduro</h5>
<div class="et_pb_toggle_content clearfix">
 <a href="http://turbo.pcaclubracing.org/wp-content/uploads/results/current/COTA/RedEnduro.html" target="_blank" rel="noopener">Group 1 &#8211; Red</a><br />
<a href="http://turbo.pcaclubracing.org/wp-content/uploads/results/current/COTA/BlueEnduro.html" target="_blank" rel="noopener">Group 4 &#8211; Blue</a>
</div> <!-- .et_pb_toggle_content -->
</div> <!-- .et_pb_toggle -->
</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row -->
EOF
}

sub getContent2 {
    return <<'EOF';
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row --><div class=" et_pb_row et_pb_row_6">
<div class="et_pb_column et_pb_column_1_3  et_pb_column_10 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_module et_pb_toggle et_pb_toggle_close  et_pb_toggle_3 et_pb_toggle_item">


<h5 class="et_pb_toggle_title">Sprint 1</h5>
<div class="et_pb_toggle_content clearfix">
 <a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/OrangeSprint1.html" target="_blank" rel="noopener noreferrer">Group 1 &#8211; Orange</a><br />
<a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/GreenSprint1.html" target="_blank" rel="noopener noreferrer"> Group 2 &#8211; Green</a><br />
<a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/RedSprint1.html" target="_blank" rel="noopener">Group 3 &#8211; Red</a><br />
<a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/BlueSprint1.html" target="_blank" rel="noopener">Group 4 &#8211; Blue</a>
</div> <!-- .et_pb_toggle_content -->
</div> <!-- .et_pb_toggle -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_3  et_pb_column_11 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_module et_pb_toggle et_pb_toggle_close  et_pb_toggle_4 et_pb_toggle_item">


<h5 class="et_pb_toggle_title">Sprint 2</h5>
<div class="et_pb_toggle_content clearfix">
 <a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/OrangeSprint2.html" target="_blank" rel="noopener">Group 1 &#8211; Orange</a><br />
<a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/GreenSprint2.html" target="_blank" rel="noopener">Group 2 &#8211; Green</a><br />
<a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/RedSprint2.html" target="_blank" rel="noopener">Group 3 &#8211; Red</a><br />
<a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/BlueSprint2.html" target="_blank" rel="noopener">Group 4 &#8211; Blue</a>
</div> <!-- .et_pb_toggle_content -->
</div> <!-- .et_pb_toggle -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_3  et_pb_column_12 et_pb_css_mix_blend_mode_passthrough et-last-child">


<div class="et_pb_module et_pb_toggle et_pb_toggle_close  et_pb_toggle_5 et_pb_toggle_item">


<h5 class="et_pb_toggle_title">Enduro</h5>
<div class="et_pb_toggle_content clearfix">
 <a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/BlackEnduro.html" target="_blank" rel="noopener">Group 1 &#8211; Black</a><br />
<a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/PurpleEnduro.html" target="_blank" rel="noopener">Group 2 &#8211; Purple</a><br />
<a href="http://pcaclubracing.org/wp-content/uploads/results/current/Sebring/PinkEnduro.html" target="_blank" rel="noopener">Group 4 &#8211; Pink</a>
</div> <!-- .et_pb_toggle_content -->
</div> <!-- .et_pb_toggle -->
</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row -->


</div> <!-- .et_pb_section --><div class="et_pb_section et_pb_section_5 et_pb_with_background et_section_regular">




<div class=" et_pb_row et_pb_row_7">
<div class="et_pb_column et_pb_column_4_4  et_pb_column_13 et_pb_css_mix_blend_mode_passthrough et-last-child">


<div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_center  et_pb_text_4">


<div class="et_pb_text_inner">
<h1 style="text-align: center;"><span style="color: #000000;"><strong>National Championship Standings</strong></span></h1>
<p style="text-align: center;">&nbsp;Follow your favorite driver or see how you stand.</p>
<p style="text-align: center;"><strong><a href="http://turbo.pcaclubracing.org/standings/"><span style="color: #990000;">View 2018 Standings</span></a></strong></p>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row -->


</div> <!-- .et_pb_section --><div class="et_pb_section et_pb_section_7 et_pb_with_background et_section_regular">




<div class=" et_pb_row et_pb_row_8">
<div class="et_pb_column et_pb_column_4_4  et_pb_column_14 et_pb_css_mix_blend_mode_passthrough et-last-child">


<div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_5">


<div class="et_pb_text_inner">
<h1 style="text-align: center;"><strong>Upcoming Events</strong></h1>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row --><div class=" et_pb_row et_pb_row_9">
<div class="et_pb_column et_pb_column_1_3  et_pb_column_15 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_module et_pb_image et_pb_image_1 et_always_center_on_mobile">


<span class="et_pb_image_wrap"><img src="http://pcaclubracing.org/wp-content/uploads/2018/01/COTA.jpg" alt="" /></span>
</div><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_6">


<div class="et_pb_text_inner">
<h6 id="COTA" style="text-align: center;"><strong>Carrera of the Americas</strong><br /> March 02-04</h6>
<p>One of the most challenging tracks in the U.S. and the only Formula 1 venue in the U.S, this year’s race will be one of&nbsp;the best ever ... <a href="http://cota.clubregistration.net/" target="_blank" rel="noopener">Read More</a></p>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_3  et_pb_column_16 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_module et_pb_image et_pb_image_2 et_always_center_on_mobile">


<span class="et_pb_image_wrap"><img src="http://pcaclubracing.org/wp-content/uploads/2018/01/NOLA.jpg" alt="" /></span>
</div><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_7">


<div class="et_pb_text_inner">
<h6 style="text-align: center;"><strong>Mardi Gras Cup 2018</strong><br /> March 23-25</h6>
<p>This event will be shared with PCA and NASA on the 2.75 mile configuration with the "esses".&nbsp; <a href="http://www.mgpca.org/race/" target="_blank" rel="noopener">Read More</a></p>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_3  et_pb_column_17 et_pb_css_mix_blend_mode_passthrough et-last-child">


<div class="et_pb_module et_pb_image et_pb_image_3 et_always_center_on_mobile">


<span class="et_pb_image_wrap"><img src="http://pcaclubracing.org/wp-content/uploads/2017/06/Thunderhill.jpg" alt="" /></span>
</div><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_8">


<div class="et_pb_text_inner">
<h6 style="text-align: center;"><strong>GGR Spring Classic</strong><br /> March 24-25</h6>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row --><div class=" et_pb_row et_pb_row_10">
<div class="et_pb_column et_pb_column_1_3  et_pb_column_18 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_module et_pb_image et_pb_image_4 et_always_center_on_mobile">


<span class="et_pb_image_wrap"><img src="http://pcaclubracing.org/wp-content/uploads/2017/06/RoadAtlanta.jpg" alt="" /></span>
</div><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_9">


<div class="et_pb_text_inner">
<h6 style="text-align: center;"><strong>PeachState 225</strong><br /> April 06-08</h6>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_3  et_pb_column_19 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_module et_pb_image et_pb_image_5 et_always_center_on_mobile">


<span class="et_pb_image_wrap"><img src="http://pcaclubracing.org/wp-content/uploads/2017/06/Gateway.jpg" alt="" /></span>
</div><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_10">


<div class="et_pb_text_inner">
<h6 style="text-align: center;"><strong>Gateway Carrera Classic</strong><br /> April 14-15</h6>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_3  et_pb_column_20 et_pb_css_mix_blend_mode_passthrough et-last-child">


<div class="et_pb_module et_pb_image et_pb_image_6 et_always_center_on_mobile">


<a href="https://clubregistration.net/events/event-details.cfm?event_id=8685" target="_blank"><span class="et_pb_image_wrap"><img src="http://pcaclubracing.org/wp-content/uploads/2017/06/LimeRock.jpg" alt="" /></span></a>
</div><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_11">


<div class="et_pb_text_inner">
<h6 style="text-align: center;"><strong>Twin Sprint Rumble</strong><br /> April 20-21</h6>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row --><div class=" et_pb_row et_pb_row_11">
<div class="et_pb_column et_pb_column_1_3  et_pb_column_21 et_pb_column_empty et_pb_css_mix_blend_mode_passthrough">



</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_3  et_pb_column_22 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_12">


<div class="et_pb_text_inner">
<h2 style="text-align: center;"><span style="font-size: 52px; font-weight: bold;">More Upcoming Events</span></h2>
</div>
</div> <!-- .et_pb_text --><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_13">


<div class="et_pb_text_inner">
<p style="text-align: center;">The 2018 racing schedule has been posted!</p>
</div>
</div> <!-- .et_pb_text --><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_14">


<div class="et_pb_text_inner">
<p style="text-align: center;">&nbsp;<a href="http://turbo.pcaclubracing.org/schedule/"><strong><span style="color: #990000;">Learn More</span></strong></a></p>
<p>&nbsp;</p>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_3  et_pb_column_23 et_pb_column_empty et_pb_css_mix_blend_mode_passthrough et-last-child">



</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row -->


</div> <!-- .et_pb_section --><div class="et_pb_section et_pb_section_9 et_pb_with_background et_section_regular">




<div class=" et_pb_row et_pb_row_12 et_pb_gutters2">
<div class="et_pb_column et_pb_column_1_4  et_pb_column_24 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_module et_pb_image et_pb_image_7 et_always_center_on_mobile">


<a href="http://turbo.pcaclubracing.org/"><span class="et_pb_image_wrap"><img src="http://turbo.pcaclubracing.org/wp-content/uploads/2017/06/ClubRacingTransparent8.png" alt="" /></span></a>
</div><ul class="et_pb_social_media_follow et_pb_module et_pb_bg_layout_light  et_pb_social_media_follow_0 clearfix">


<li class="et_pb_social_icon et_pb_social_network_link et-social-facebook et_pb_social_media_follow_network_0">
<a href="https://www.facebook.com/porscheclubofamerica" class="icon et_pb_with_border" title="Facebook" target="_blank"><span class="et_pb_social_media_follow_network_name">Facebook</span></a>

</li><li class="et_pb_social_icon et_pb_social_network_link et-social-twitter et_pb_social_media_follow_network_1">
<a href="https://twitter.com/PCANational" class="icon et_pb_with_border" title="Twitter" target="_blank"><span class="et_pb_social_media_follow_network_name">Twitter</span></a>

</li>
</ul> <!-- .et_pb_counters -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_4  et_pb_column_25 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_15">


<div class="et_pb_text_inner">
<h5><span style="color: #990000;"><strong>Info</strong></span></h5>
</div>
</div> <!-- .et_pb_text --><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_16">


<div class="et_pb_text_inner">
<p><a href="http://turbo.pcaclubracing.org/rules/"><span style="color: #000000; font-size: 11px; font-weight: bold;">Rules</span></a><br /> <a href="http://turbo.pcaclubracing.org/licensing/"><span style="color: #000000; font-size: 11px; font-weight: bold;">Licensing</span></a><br /> <a href="http://turbo.pcaclubracing.org/forms/"><span style="color: #000000; font-size: 11px; font-weight: bold;">Forms</span></a></p>
</div>
</div> <!-- .et_pb_text --><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_17">


<div class="et_pb_text_inner">
<h5><span style="color: #990000;"><strong>Contacts</strong></span></h5>
</div>
</div> <!-- .et_pb_text --><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_18">


<div class="et_pb_text_inner">
<p><a href="http://turbo.pcaclubracing.org/contacts/"><span style="color: #000000; font-size: 11px; font-weight: bold;">National Team</span></a><br /> <a href="http://www.pca.org" target="_blank" rel="noopener"><span style="color: #000000; font-size: 11px; font-weight: bold;">Porsche Club of America</span></a></p>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_4  et_pb_column_26 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_19">


<div class="et_pb_text_inner">
<h5><span style="color: #990000;"><strong>Racing</strong></span></h5>
</div>
</div> <!-- .et_pb_text --><div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_20">


<div class="et_pb_text_inner">
<p style="text-align: left;"><a href="http://turbo.pcaclubracing.org/schedule/"><span style="color: #000000; font-size: 11px; font-weight: bold;">Schedule</span></a><br /> <a href="http://turbo.pcaclubracing.org/tiresupport/"><span style="color: #000000; font-size: 11px; font-weight: bold;">Tire Support</span></a><br /> <a href="http://turbo.pcaclubracing.org/standings/"><span style="color: #000000; font-size: 11px; font-weight: bold;">Championship Standings</span></a><br /> <a href="http://turbo.pcaclubracing.org/results/"><span style="color: #000000; font-size: 11px; font-weight: bold;">Race Results</span></a><br /> <a href="http://turbo.pcaclubracing.org/tripletrofeo/"><span style="color: #000000; font-size: 11px; font-weight: bold;">Pirelli Triple Trofeo Championship</span></a><br /> <a href="http://turbo.pcaclubracing.org/westcoastseries/"><span style="color: #000000; font-size: 11px; font-weight: bold;">West Coast Series</span></a><br /> <a href="http://turbo.pcaclubracing.org/vintage/"><span style="color: #000000; font-size: 11px; font-weight: bold;">Vintage Racing</span></a><br /> <a href="http://turbo.pcaclubracing.org/contingency/"><span style="color: #000000; font-size: 11px; font-weight: bold;">Sponsor Contingency Programs</span></a></p>
</div>
</div> <!-- .et_pb_text -->
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_4  et_pb_column_27 et_pb_css_mix_blend_mode_passthrough et-last-child">


<div class="et_pb_module et_pb_image et_pb_image_8 et_always_center_on_mobile">


<a href="https://www.pca.org/"><span class="et_pb_image_wrap"><img src="http://turbo.pcaclubracing.org/wp-content/uploads/2017/09/PCA-3D-Transparent.png" alt="" /></span></a>
</div><div class="et_pb_module et_pb_image et_pb_image_9 et_always_center_on_mobile">


<a href="http://clubregistration.net" target="_blank"><span class="et_pb_image_wrap"><img src="http://turbo.pcaclubracing.org/wp-content/uploads/2017/06/club-reg.png" alt="" /></span></a>
</div><div class="et_pb_module et_pb_image et_pb_image_10 et_always_center_on_mobile et_pb_image_sticky">


<a href="https://www.race-monitor.com/live" target="_blank"><span class="et_pb_image_wrap"><img src="http://turbo.pcaclubracing.org/wp-content/uploads/2017/06/racemonitor-px260.jpg" alt="" /></span></a>
</div><div class="et_pb_module et_pb_image et_pb_image_11 et_always_center_on_mobile">


<a href="http://www.racehero.io" target="_blank"><span class="et_pb_image_wrap"><img src="http://turbo.pcaclubracing.org/wp-content/uploads/2017/06/racehero-px260.jpg" alt="" /></span></a>
</div>
</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row --><div class=" et_pb_row et_pb_row_13 et_pb_gutters2">
<div class="et_pb_column et_pb_column_1_6  et_pb_column_28 et_pb_column_empty et_pb_css_mix_blend_mode_passthrough">



</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_2_3  et_pb_column_29 et_pb_css_mix_blend_mode_passthrough">


<div class="et_pb_module et_pb_image et_pb_image_12 et_always_center_on_mobile">


<a href="http://turbo.pcaclubracing.org/"><span class="et_pb_image_wrap"><img src="http://turbo.pcaclubracing.org/wp-content/uploads/2017/06/ClubRacingTransparent8.png" alt="" /></span></a>
</div><ul class="et_pb_social_media_follow et_pb_module et_pb_bg_layout_light  et_pb_social_media_follow_1 clearfix">


<li class="et_pb_social_icon et_pb_social_network_link et-social-facebook et_pb_social_media_follow_network_2">
<a href="#" class="icon et_pb_with_border" title="facebook &nbsp;"><span class="et_pb_social_media_follow_network_name">facebook &nbsp;</span></a>

</li><li class="et_pb_social_icon et_pb_social_network_link et-social-twitter et_pb_social_media_follow_network_3">
<a href="#" class="icon et_pb_with_border" title="Twitter &nbsp;"><span class="et_pb_social_media_follow_network_name">Twitter &nbsp;</span></a>

</li>
</ul> <!-- .et_pb_counters --><div class="et_pb_module et_pb_image et_pb_image_13 et_always_center_on_mobile">


<a href="https://www.pca.org/"><span class="et_pb_image_wrap"><img src="http://turbo.pcaclubracing.org/wp-content/uploads/2017/09/PCA-3D-Transparent.png" alt="" /></span></a>
</div><div class="et_pb_module et_pb_image et_pb_image_14 et_always_center_on_mobile">


<a href="http://clubregistration.net" target="_blank"><span class="et_pb_image_wrap"><img src="http://turbo.pcaclubracing.org/wp-content/uploads/2017/06/club-reg.png" alt="" /></span></a>
</div><div class="et_pb_module et_pb_image et_pb_image_15 et_always_center_on_mobile et_pb_image_sticky">


<a href="https://www.race-monitor.com/live" target="_blank"><span class="et_pb_image_wrap"><img src="http://turbo.pcaclubracing.org/wp-content/uploads/2017/06/racemonitor-px260.jpg" alt="" /></span></a>
</div><div class="et_pb_module et_pb_image et_pb_image_16 et_always_center_on_mobile">


<a href="http://www.racehero.io" target="_blank"><span class="et_pb_image_wrap"><img src="http://turbo.pcaclubracing.org/wp-content/uploads/2017/06/racehero-px260.jpg" alt="" /></span></a>
</div>
</div> <!-- .et_pb_column --><div class="et_pb_column et_pb_column_1_6  et_pb_column_30 et_pb_column_empty et_pb_css_mix_blend_mode_passthrough">



</div> <!-- .et_pb_column -->


</div> <!-- .et_pb_row -->


</div> <!-- .et_pb_section --></div> <!-- .entry-content -->


</article> <!-- .et_pb_post -->



</div> <!-- #main-content -->


<span class="et_pb_scroll_top et-pb-icon"></span>


<footer id="main-footer">



<div id="footer-bottom">
<div class="container clearfix">
<ul class="et-social-icons">

<li class="et-social-icon et-social-facebook">
<a href="https://www.facebook.com/porscheclubofamerica" class="icon">
<span>Facebook</span>
</a>
</li>
<li class="et-social-icon et-social-twitter">
<a href="https://twitter.com/PCANational" class="icon">
<span>Twitter</span>
</a>
</li>

</ul><div id="footer-info">&copy; 2017 PCA Club Racing of America
| Terms &amp; Conditions | Privacy Policy</div></div><!-- .container -->
</div>
</footer> <!-- #main-footer -->
</div> <!-- #et-main-area -->


</div> <!-- #page-container -->

<!-- ngg_resource_manager_marker --><script type='text/javascript'>
/* <![CDATA[ */
var wpcf7 = {"apiSettings":{"root":"http:\/\/pcaclubracing.org\/wp-json\/contact-form-7\/v1","namespace":"contact-form-7\/v1"},"recaptcha":{"messages":{"empty":"Please verify that you are not a robot."}}};
/* ]]> */
</script>
<script type='text/javascript' src='http://pcaclubracing.org/wp-content/plugins/contact-form-7/includes/js/scripts.js?ver=5.0.1'></script>
<script type='text/javascript'>
var renderInvisibleReCaptcha = function() {

    for (var i = 0; i < document.forms.length; ++i) {
        var form = document.forms[i];
        var holder = form.querySelector('.inv-recaptcha-holder');

        if (null === holder) continue;
        holder.innerHTML = '';

         (function(frm){
                  var cf7SubmitElm = frm.querySelector('.wpcf7-submit');
            var holderId = grecaptcha.render(holder,{
                'sitekey': '6Le-EUgUAAAAAJGaFjsxbtNnBZWMkMUS_w7olcOl', 'size': 'invisible', 'badge' : 'bottomright',
                'callback' : function (recaptchaToken) {
                if((null !== cf7SubmitElm) && (typeof jQuery != 'undefined')){jQuery(frm).submit();grecaptcha.reset(holderId);return;}
                 HTMLFormElement.prototype.submit.call(frm);
                },
                'expired-callback' : function(){grecaptcha.reset(holderId);}
            });

            if(null !== cf7SubmitElm && (typeof jQuery != 'undefined') ){
            jQuery(cf7SubmitElm).off('click').on('click', function(clickEvt){
                                                          clickEvt.preventDefault();
                                                          grecaptcha.execute(holderId);
                                                          });
            }
            else
            {
            frm.onsubmit = function (evt){evt.preventDefault();grecaptcha.execute(holderId);};
            }


        })(form);
    }
};
</script>
<script type='text/javascript' async defer src='https://www.google.com/recaptcha/api.js?onload=renderInvisibleReCaptcha&#038;render=explicit'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var et_shortcodes_strings = {"previous":"Previous","next":"Next"};
var et_pb_custom = {"ajaxurl":"http:\/\/pcaclubracing.org\/wp-admin\/admin-ajax.php","images_uri":"http:\/\/pcaclubracing.org\/wp-content\/themes\/Divi\/images","builder_images_uri":"http:\/\/pcaclubracing.org\/wp-content\/themes\/Divi\/includes\/builder\/images","et_frontend_nonce":"7676f6caa4","subscription_failed":"Please, check the fields below to make sure you entered the correct information.","et_ab_log_nonce":"1b3f803b93","fill_message":"Please, fill in the following fields:","contact_error_message":"Please, fix the following errors:","invalid":"Invalid email","captcha":"Captcha","prev":"Prev","previous":"Previous","next":"Next","wrong_captcha":"You entered the wrong number in captcha.","is_builder_plugin_used":"","ignore_waypoints":"no","is_divi_theme_used":"1","widget_search_selector":".widget_search","is_ab_testing_active":"","page_id":"4410","unique_test_id":"","ab_bounce_rate":"5","is_cache_plugin_active":"no","is_shortcode_tracking":""};
var et_pb_box_shadow_elements = [];
/* ]]> */
</script>
<script type='text/javascript' src='http://pcaclubracing.org/wp-content/themes/Divi/js/custom.min.js?ver=3.0.105'></script>
<script type='text/javascript' src='http://pcaclubracing.org/wp-content/plugins/divi-builder/core/admin/js/common.js?ver=3.0.105'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var SlimStatParams = {"ajaxurl":"http:\/\/pcaclubracing.org\/wp-admin\/admin-ajax.php","extensions_to_track":"pdf,doc,xls,zip","outbound_classes_rel_href_to_not_track":"noslimstat,ab-item","ci":"YTozOntzOjEyOiJjb250ZW50X3R5cGUiO3M6NDoicGFnZSI7czoxMDoiY29udGVudF9pZCI7aTo0NDEwO3M6NjoiYXV0aG9yIjtzOjk6ImRhbmRlcnNvbiI7fQ==.4a0ac16103952bf87ea3be6965f88e5b"};
/* ]]> */
</script>
<script type='text/javascript' src='http://cdn.jsdelivr.net/wp/wp-slimstat/tags/4.7.6/wp-slimstat.min.js'></script>
<script type='text/javascript' src='http://pcaclubracing.org/wp-includes/js/wp-embed.min.js?ver=4.8.5'></script>
<script type="text/javascript">
var et_animation_data = [];
</script>
<style id="et-builder-module-design-cached-inline-styles">.et_pb_section_0{padding-top:0px;padding-right:0px;padding-bottom:23px;padding-left:0px}.et_pb_row_12.et_pb_row{padding-top:4px;padding-bottom:0px}.et_pb_text_16{font-weight:700;font-size:11px;line-height:1.4em;margin-top:-10px!important;width:214px;height:160px;font-family:'Sentinel SSm';line-height:1.82;text-align:left;color:#221f20;color:var(--black)}.et_pb_text_16 p{line-height:1.4em}.et_pb_text_16.et_pb_text{color:#666666!important}.et_pb_text_15{font-family:'Source Sans Pro',Helvetica,Arial,Lucida,sans-serif;font-weight:700;font-size:13px;line-height:1.2em;margin-bottom:8px!important}.et_pb_text_15 p{line-height:1.2em}.et_pb_text_15.et_pb_text{color:#666666!important}.et_pb_image_7{text-align:center}.et_pb_section_9.et_pb_section{background-color:#f8f8f8!important}.et_pb_text_17 p{line-height:1.2em}.et_pb_section_9{padding-top:60px;padding-bottom:0px}.et_pb_section_8{padding-top:60px;padding-bottom:0px}.et_pb_text_13.et_pb_text{color:#221f20!important}.et_pb_text_12{font-weight:700;font-size:1.7em;line-height:1.1em;margin-top:50px!important;font-family:"Tungsten Bold",Oswald,sans-serif}.et_pb_text_12 p{line-height:1.1em}.et_pb_text_12.et_pb_text{color:#221f20!important}.et_pb_row_11.et_pb_row{padding-top:8px;padding-right:0px;padding-bottom:0px;padding-left:0px}.et_pb_image_6{text-align:center}.et_pb_text_17.et_pb_text{color:#666666!important}.et_pb_text_17{font-weight:700;font-size:13px;line-height:1.2em;margin-top:-72px!important;margin-bottom:8px!important}.et_pb_image_4{text-align:center}.et_pb_image_9{text-align:center}.et_pb_image_15{max-width:55%;text-align:center}.et_pb_image_14{text-align:center}.et_pb_image_13{max-width:50%;text-align:center}.et_pb_image_12{text-align:center}.et_pb_row_13.et_pb_row{padding-top:4px;padding-bottom:50px}.et_pb_image_11{max-width:35%;text-align:center}.et_pb_image_10{max-width:55%;text-align:center}.et_pb_image_8{max-width:50%;text-align:center}.et_pb_text_18.et_pb_text{color:#666666!important}.et_pb_text_20{font-weight:700;font-size:11px;line-height:1.3em;margin-top:-10px!important;margin-bottom:8px!important;width:214px;height:160px;font-family:'Sentinel SSm';line-height:1.82;text-align:left;color:#221f20;color:var(--black)}.et_pb_text_20 p{line-height:1.3em}.et_pb_text_20.et_pb_text{color:#666666!important}.et_pb_text_19{font-family:'Source Sans Pro',Helvetica,Arial,Lucida,sans-serif;font-weight:700;font-size:13px;line-height:1.2em;margin-bottom:8px!important}.et_pb_text_19 p{line-height:1.2em}.et_pb_text_19.et_pb_text{color:#666666!important}.et_pb_text_18{font-weight:700;font-size:11px;line-height:1.4em;margin-top:-10px!important;width:214px;height:160px;font-family:'Sentinel SSm';font-weight:bold;line-height:1.82;text-align:left;color:#221f20;color:var(--black)}.et_pb_text_18 p{line-height:1.4em}.et_pb_row_0.et_pb_row{padding-top:0px;padding-right:0px;padding-bottom:17px;padding-left:0px}.et_pb_image_5{text-align:center}.et_pb_row_10.et_pb_row{padding-top:8px;padding-right:0px;padding-bottom:0px;padding-left:0px}.et_pb_cta_0.et_pb_promo .et_pb_button_wrapper{text-align:center}.et_pb_row_3.et_pb_row{padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px}.et_pb_section_2{padding-top:25px;padding-right:0px;padding-bottom:25px;padding-left:0px}.et_pb_text_1{max-width:87%}.et_pb_row_2.et_pb_row{padding-top:22px;padding-right:0px;padding-bottom:0px;padding-left:0px}.et_pb_section_1{padding-top:34px;padding-right:0px;padding-bottom:5px;padding-left:0px}.et_pb_cta_0 .et_pb_button{box-shadow:inset 0px 2px 18px 0px rgba(0,0,0,0.3)}body #page-container .et_pb_cta_0.et_pb_promo .et_pb_button{border-radius:20px}.et_pb_cta_0{max-width:66%;margin:0 auto;box-shadow:0px 12px 18px -6px rgba(0,0,0,0.3)}.et_pb_row_4.et_pb_row{padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px}.et_pb_cta_0.et_pb_promo{border-radius:20px 20px 20px 20px;overflow:hidden;padding-top:10px!important;padding-bottom:10px!important}.et_pb_cta_0.et_pb_promo .et_pb_button{text-shadow:0em 0.1em 0.1em rgba(0,0,0,0.4)}.et_pb_cta_0.et_pb_promo h2,.et_pb_cta_0.et_pb_promo h1.et_pb_module_header,.et_pb_cta_0.et_pb_promo h3.et_pb_module_header,.et_pb_cta_0.et_pb_promo h4.et_pb_module_header,.et_pb_cta_0.et_pb_promo h5.et_pb_module_header,.et_pb_cta_0.et_pb_promo h6.et_pb_module_header{text-align:center!important}.et_pb_row_1.et_pb_row{padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px}.et_pb_text_0{margin-top:-5%!important}.et_pb_text_0 h1{font-weight:700}.et_pb_image_0 .et_pb_image_wrap,.et_pb_image_0 img{width:100%}.et_pb_image_0{margin-top:0px!important;margin-right:0px!important;margin-bottom:0px!important;margin-left:0px!important;max-width:100%!important;text-align:center}.et_pb_image_3{text-align:center}.et_pb_text_2{box-shadow:0px 2px 18px 0px rgba(0,0,0,0.3)}.et_pb_section_3{padding-top:25px;padding-right:0px;padding-bottom:50px;padding-left:0px}.et_pb_row_5.et_pb_row{padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px}.et_pb_image_2{text-align:center}.et_pb_image_1{text-align:center}.et_pb_row_9.et_pb_row{padding-top:8px;padding-right:0px;padding-bottom:0px;padding-left:0px}.et_pb_text_5 h1{font-size:48px;color:#221f20!important}.et_pb_row_8.et_pb_row{padding-top:2px;padding-right:0px;padding-bottom:1px;padding-left:0px}.et_pb_section_7.et_pb_section{background-color:#f8f8f8!important}.et_pb_section_7{padding-top:17px;padding-right:0px;padding-bottom:58px;padding-left:0px}.et_pb_section_6{padding-top:17px;padding-right:0px;padding-bottom:58px;padding-left:0px}.et_pb_text_4{background-color:#ffffff;padding-top:75px!important;padding-bottom:75px!important}.et_pb_image_16{max-width:35%;text-align:center}.et_pb_row_7{max-width:1000px!important}.et_pb_row_7.et_pb_row{padding-top:0px;padding-right:0px;padding-bottom:22px;padding-left:0px}.et_pb_section_5.et_pb_section{background-color:#f8f8f8!important}.et_pb_section_5{padding-top:38px;padding-right:0px;padding-bottom:20px;padding-left:0px}.et_pb_section_4{padding-top:38px;padding-right:0px;padding-bottom:20px;padding-left:0px}.et_pb_row_6.et_pb_row{padding-top:0px;padding-right:0px;padding-bottom:3px;padding-left:0px}.et_pb_text_3{box-shadow:0px 2px 18px 0px rgba(0,0,0,0.3)}.et_pb_social_media_follow_network_0 a.icon{background-color:#3b5998!important}.et_pb_social_media_follow_network_1 a.icon{background-color:#00aced!important}.et_pb_social_media_follow_network_2 a.icon{background-color:#3b5998!important}.et_pb_social_media_follow_network_3 a.icon{background-color:#00aced!important}.et_pb_text_1.et_pb_module{margin-left:auto!important;margin-right:auto!important}.et_pb_cta_0.et_pb_promo.et_pb_module{margin-left:auto!important;margin-right:auto!important}@media only screen and (min-width:981px){.et_pb_row_13{display:none!important}}@media only screen and (min-width:768px) and (max-width:980px){.et_pb_row_12{display:none!important}}@media only screen and (max-width:767px){.et_pb_row_12{display:none!important}}</style></body>
</html>
EOF
}

1;
