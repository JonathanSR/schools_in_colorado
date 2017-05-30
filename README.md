# Service For Dreamers

Service for Dreamers is a Rails app that provides graduation data from post-secondary institutions in Colorado.
You can use the live site at http://service-for-dreamers.herokuapp.com/

## Installing / Getting Started

```shell
git clone git@github.com:JonathanSR/schools_in_colorado.git #clones the application into your machine.
cd schools_in_colorado/ #accesses the root folder of the application.
bundle #installs all dependencies needed to run the application.
rake db:create #creates the database.
rake db:migrate #runs migrations that make changes to the database.
rake db:seed #seeds the database.
```

## Usage

To run the tests:
```shell
rspec
```

To run the server(runs on port 3000):
```shell
rails s
```

To access the database:
```shell
rails c
```

## Third_Party APIs

Service for Dreamers uses the Colorado Marketplace API(https://data.colorado.gov/) to get the graduation data.
