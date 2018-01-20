# Jungle

A mini e-commerce application built with Rails 4.2, completed as a course requirement for LightHouse Labs.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s` to start the server

## Screenshots

Home Page
!["Jungle Home Page"](https://github.com/derrickpersson/jungle-rails/blob/master/public/screenshots/Jungle_home_page.png?raw=true)

Empty Cart - added conditional logic
!["Empty Cart - added conditional logic"](https://github.com/derrickpersson/jungle-rails/blob/master/public/screenshots/Jungle_empty_cart.png?raw=true)

Product page - added reviews for individual product. Form hides upon logout.
!["Product page - added reviews for individual product. Form hides upon logout."](https://github.com/derrickpersson/jungle-rails/blob/master/public/screenshots/Jungle_product_page.png?raw=true)

Admin page - added categories
!["Admin page - added categories"](https://github.com/derrickpersson/jungle-rails/blob/master/public/screenshots/Jungle_add_category_page.png?raw=true)


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Bcrypt
