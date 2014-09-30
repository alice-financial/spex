Spex: Basic Protection
===========================

We all need basic protection, right? This is a simple strategy for protecting an
app from casual access. It slots in HTTP basic authentication into your [Rack middleware] (https://github.com/rack/rack/blob/master/lib/rack/auth/basic.rb). To use it, you set the following environment variables:

* protected: 'true' to secure the sire
* protected_name
* protected_password

For more details, read my post about the app [on my blog] (http://www.eyefodder.com/2014/08/building-pristine-rails-virtual-machine.html)
