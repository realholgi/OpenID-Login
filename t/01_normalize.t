use Test::More tests => 7;

use Net::OpenIdLogin;

is( Net::OpenIdLogin::normalize('example.com'),              'http://example.com/' );
is( Net::OpenIdLogin::normalize('http://example.com'),       'http://example.com/' );
is( Net::OpenIdLogin::normalize('https://example.com'),      'https://example.com/' );
is( Net::OpenIdLogin::normalize('https://example.com/'),     'https://example.com/' );
is( Net::OpenIdLogin::normalize('http://example.com/user'),  'http://example.com/user' );
is( Net::OpenIdLogin::normalize('http://example.com/user/'), 'http://example.com/user/' );
is( Net::OpenIdLogin::normalize('http://example.com/'),      'http://example.com/' );

