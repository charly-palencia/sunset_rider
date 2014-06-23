Sunset Rider
====

![](http://www.aspeb.com.ar/main/images/stories/Afro/Sunset/Sunset_Riders_01.jpg)

Sunset rider score managment. Easy way to test my hexagonal architecture ideas based in **Jim Weirich (RIP)**, **Uncle Bob** and others authors.

Install
--

###Prerequisites###
*****

Postgresql:

    brew install postgresql

###Install Project###
***
    git clone git@github.com:charly-palencia/sunset_rider.git
    cd sunset_rider
    bundle install
    
Config database
    
    rake db:create
    rake db:setup

Rails server

We are using **Rails 4.x**. The server could be started with:
    
    rails s

Test
---

Sunset rider managment use **rspec 3.0** and we create three task to run each kind of test:

Unit Test

    rake utest
    
Integration Test

    rake itest
    
Run all the suite test

    rake test

Design 
---

![](public/design.png)

