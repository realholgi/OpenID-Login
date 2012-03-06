package Net::OpenIdLogin::Types;
# ABSTRACT: Types for Net-OpenIdLogin.

use Moose::Util::TypeConstraints;
use Net::OpenIdLogin::Extension;

subtype 'Extension_List',
    as 'HashRef[Net::OpenIdLogin::Extension]';

coerce 'Extension_List',
    from 'ArrayRef',
    via {my $ret = {map {($_->{uri} => Net::OpenIdLogin::Extension->new($_))} @$_};};

no Moose::Util::TypeConstraints;
1;

__END__
=pod

=cut

