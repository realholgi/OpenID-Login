package OpenID::Login::Discover;

# ABSTRACT: Find an endpoint for generic OpenID identifiers

use Moose;

has claimed_id => (
    is       => 'rw',
    isa      => 'Str',
    required => 1,
);

has ua => (
    is       => 'rw',
    isa      => 'LWP::UserAgent',
    required => 1,
);

=method perform_discovery

Performs OpenID endpoint discovery for generic OpenID indentifiers

=cut

sub perform_discovery {
    my $self = shift;

    my $claimed_id = $self->claimed_id;
    my $server = $self->_get_xrds_location($claimed_id) || $self->claimed_id;
    my $open_id_endpoint;
    if ($server) {
        my $xrds = $self->_get($server)->decoded_content;
        if ( $xrds =~ m{<URI>([^<>]+)</URI>} ) {
            $open_id_endpoint = $1;
        }
    }

    return $open_id_endpoint;
}

sub _get {
    my ( $self, $url ) = @_;

    my $ua  = $self->ua;
    my $res = $ua->get($url);
    $res->is_success or return;
    $res;
}

sub _get_xrds_location {
    my ( $self, $entry_point ) = @_;

    my $res = $self->_get( $entry_point, Accept => 'application/xrds+xml' );
    return unless $res;
    my $xrds_location = $res->header('X-XRDS-Location') or return;
    return $xrds_location;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1;

__END__


