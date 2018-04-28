# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Screenshots

![Homepage With Soldout Item](https://github.com/Elyott/jungle-rails/blob/master/docs/Screen%20Shot%202018-04-27%20at%206.29.27%20PM.png?raw=true)

![Checkout Time](https://github.com/Elyott/jungle-rails/blob/master/docs/Screen%20Shot%202018-04-27%20at%206.32.22%20PM.png?raw=true)

![Cool Products Page](https://github.com/Elyott/jungle-rails/blob/master/docs/Screen%20Shot%202018-04-27%20at%206.32.53%20PM.png?raw=true)


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:migrate` to create database tables
6. Run `bin/rake db:reset` to create, load and seed db
7. Create `.env` by copying `.env.example`
8. Sign up for a Stripe account
9. Put Stripe (test) keys into appropriate .env vars
10. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit  Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
