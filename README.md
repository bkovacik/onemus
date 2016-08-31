This is the website for the Onemus card/board game.

# Installing dependencies
Its gem requirements should be similar to a standard Rails application and can be installed with
```
bundle install
```
It might be the case that you have to native extensions for something like the pg gem manually.

Other dependencies include a running postgresql database. By default, the app searches for onemus, which has create table privileges.

Production requires a running redis server for websocket support.
