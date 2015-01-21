<p align="center">
<img src="http://www.thespeckledpalate.com/wp-content/uploads/2014/09/12-1666-post/TheSpeckledPalate_BoudinEggBreakfastSandwiches_005_small.jpg">
</p>

Boudin \bü-ˈdan, -ˈdaⁿ\
==============

This is a webapp and webapi that fronts the pulled pork sandwich application. It also provides a tunning aspect that allows other services to adjust confidence levels.

This sinatra app relies on the [threshold](https://github.com/shadowbq/snort-thresholds) gem for ORM to the Snort Threshold configurations.

## Installation

```ruby
bundle install
```

## Running 

`rackup`

You should now be able to view the application at [localhost:9292](http://localhost:9292).

`shotgun config.ru`

More complex shotgun launch example

`RACK_ENV=production shotgun -o 10.4.1.150 config.ru`

You can also run it with shotgun at [localhost:9393](http://localhost:9393).

## User Authentication

Rack-based authentication (default login)

```ruby
  @user.username = "admin"
  @user.password = "password"
  @user.email = "admin@domain.org"
```
## Notice:

Check out *The Speckled Palate* because she has some awesome photos and food ideas! [1](http://www.thespeckledpalate.com/2014/09/12/its-football-season-friday-boudin-breakfast-sandwiches/)
