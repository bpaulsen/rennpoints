package CGIBase;

use strict;
use warnings;

use base 'CGI::Application';
use RennPoints::DBI qw( getDBConnection );
use File::Basename qw(dirname);
use CGI::Application::Plugin::TT;
use CGI::Application::Plugin::AutoRunmode;
use CGI::Application::Plugin::DBH qw( dbh_config dbh );

sub error_page : ErrorRunmode {
    my $self = shift;
    my $msg = shift;

    $self->tt_config( TEMPLATE_OPTIONS => { ABSOLUTE => 1,
					    INCLUDE_PATH => "/var/www/html/rennpoints2/templates",

		      } );

    return $self->tt_process('error.html',
			     { msg => $msg }
	);
}

sub cgiapp_prerun {
    my $self = shift;
    
    # Configure the template
    $self->tt_config( TEMPLATE_OPTIONS => { RELATIVE => 1,
					    INCLUDE_PATH => "/var/www/html/rennpoints2/templates",
		      } );

    my $is_admin_dir = $ENV{SCRIPT_FILENAME} =~ m{/pcaadmin/} ? 1 :0;
    $self->dbh_config(sub { getDBConnection($is_admin_dir); } );

    return;
}

1;
