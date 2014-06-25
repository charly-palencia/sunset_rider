Sunset Rider
====

![](http://www.aspeb.com.ar/main/images/stories/Afro/Sunset/Sunset_Riders_01.jpg)

Sunset rider score managment. Easy way to test my hexagonal architecture into rails ideas based in **Jim Weirich (RIP)**, **Uncle Bob** and others authors.

FAQ [here](http://www.gamefaqs.com/snes/588706-sunset-riders/faqs/42124)

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

###Hexagonal Architecture Intent###

#### Separation of Concerns####
Separated the business logic model and the persistence model. Create specific elements (example Score Calculator) to manage the business logic, leaving the biz models only  relations and the attributes value.

### Code easier to understand###
Model names have been created with business definitions (ex.  score, bosses etc). The runner manage all the method according with the use case or user stories names (ex. create new score)

### We can easily replace Pieces of Infrastucture ###

The controllers and repository are only a port (interface) implementation of context and repo respectively. If we need replace the rails service for other framework like (ex. [Lotus Framework](http://lotusrb.org/) ) the only thing is send the new repository object and the context element for the new one (obviously, with  the accorded  protocol) . so, the core application can be move into another frameworks or tools

## Our tests can run faster test without rails##
Separate the core application of our toolbox/external services give us a great opportunity to create unit test faster than never. 

The unit tests should be for our core app. Some points bellow:

- Only the border elements are mocked.
- Knows nothing about where the data come from.
- Not use any external services inside the unit test. only mock 

The integration test must go through the application since begining to the end. Some points bellow:

- No mocks
- Use data Factories
- Create black box tests(we should not know what is happend into the core application)
- Test  only what concern for each element (If we are testing controllers , receive some params, get a list of elements o success process or failed etc)

## Our real Architecture design ##
we can create our design independently of any framework or tools. WE have a core application who talks with that services without lose its independence. thus, we can remove rails and our core application maintain its independence

