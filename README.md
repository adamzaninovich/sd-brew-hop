# SD Brew Hop

A web application to track the breweries you've been to in San Diego.
Can you **hop** them all?

### Why?

As of 11/12/13, there are 80 breweries in San Diego County. We wanted to
create a way for people to keep track of the ones they have been to and
get suggestions for new ones to visit. Also, with over 30 more breweries
currently in the process of opening, we wanted to provide a place to
keep track of all the breweries in the county.

### Screenshots

![brewery show page](http://i.imgur.com/FJ6Yav6.png)
![breweries index page](http://i.imgur.com/XdQU39H.png)

### Getting Started:
1. `bundle install`
2. `rake db:create`
3. `rake db:migrate`
4. `rake db:seed`
5. create a .env file with the following variables:

		FACEBOOK_ID
		FACEBOOK_SECRET
		S3_ID
		S3_SECRET
		S3_BUCKET

6. `foreman start`
7. app will be running at `http://localhost:5000`

### How to Contribute
##### Submitting breweries:
...

##### Adding a feature:
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##### Keep up-to-date:
1. Add upstream (`git remote add upstream git@github.com:adamzaninovich/sd-brew-hop.git`)
2. Fetch lastest upstream master (`git pull upstream`)
3. Checkout master (`git checkout master`)
4. Merge upstream into master (`git merge upstream/master`)

