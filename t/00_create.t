use Test::More tests => 2;
BEGIN {use_ok ('Net::OpenIdLogin')};

my $o = Net::OpenIdLogin->new();
isa_ok($o, 'Net::OpenIdLogin');
