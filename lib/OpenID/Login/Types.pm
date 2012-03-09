package OpenID::Login::Types;

# ABSTRACT: Types for Net-OpenIdLogin.

use Moose::Util::TypeConstraints;
use OpenID::Login::Extension;

subtype 'Extension_List', as 'HashRef[OpenID::Login::Extension]';

coerce 'Extension_List', from 'ArrayRef', via {
    my $ret = { map { ( $_->{uri} => OpenID::Login::Extension->new($_) ) } @$_ };
};

no Moose::Util::TypeConstraints;
1;

__END__

