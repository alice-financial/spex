Spex: Code Coverage Setup
===========================

A quick and simple branch showing how to setup code coverage metrics for your app. The trick here is in ensuring the results from running tests in your Guest VM are visible on the host. For performance reasons, we've been using rsync, which is a one-way sync proceess, but now we want to push things back to the host.
We do this by setting up the `/coverage` folder to be excluded from rsync but included as a separate shared folder.

For more details, read my post about the process [on my blog] (http://eyefodder.com/2014/09/code-coverage-setup-rails.html)




