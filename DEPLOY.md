Initializing a New Production Database
====================================
The correct order to setup database in production, with all the rake task 
available within db namespace is as below
 
```
$rake db:create RAILS_ENV=production
$rake db:migrate RAILS_ENV=production
$ rake db:seed RAILS_ENV=production
```

Stylesheets and Image Assets
============================
To get assets such as images, stylesheets served, may need to set these
in `production.rb`.

```
config.assets.compress = true
config.assets.compile = true
config.assets.digest = true
config.assets.initialize_on_precompile = false
```

Will_Paginate in Production Mode
================================
For some reason, Will_Paginate does not read its default PER_PAGE from the
`config/environment.rb` file. Had to put

```
WillPaginate.per_page = 10
```

in the `config/environments/production.rb` file to get it to work.
