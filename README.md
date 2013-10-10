## student workflow

* This repo provides a framework for the student workflow of the bootcamp.
Students are expected to:

    * fork the repo on github.
    * clone the fork on their local machine.
    * optional: add the bin/ directory to their PATH.
    * create a new subdir under acts/ for each activity.
    * create tests for each script.
    * add the subdir, commit, and push it to github.
    * set up their jenkins instance to run tests on checkin.

* Shell script tests are to be done with shunit2 (`gen_test_results.sh`)
<http://code.google.com/p/shunit2/> ,
and/or shiot (`shiot-xunit`).
<https://github.com/dfong/shiot/blob/master/shiot.md>
For your convenience, shunit2 and shiot are included
in this repo's bin directory.
shunit2 is free software from google covered by the GNU Lesser GPL.
<http://www.gnu.org/licenses/lgpl.html>
* python tests are to be created using the unittest module,
and run with nose (`nosetests`).
<http://pythontesting.net/framework/nose/nose-introduction/>
You may need to install nosetests with `sudo easy_install nose`.
* ruby tests are to be created using rspec.
<http://betterspecs.org/>
You may need to install rspec with `sudo gem install rspec`.
