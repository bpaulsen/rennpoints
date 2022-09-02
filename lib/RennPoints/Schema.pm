package RennPoints::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use namespace::autoclean;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-29 22:49:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SNmlzXl1kfYnlm0Aeryjkw

# You can replace this text with custom code or comments, and it will be preserved on regeneration
sub connection {
    my $self = shift;
    return $self->SUPER::connection("DBI:mysql:database=clubrace;host=localhost;", "race_admin", "race_admin");
};

__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
