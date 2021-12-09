[![CircleCI](https://circleci.com/gh/nejdetkadir/rails-currency-conversion/tree/master.svg?style=svg)](https://circleci.com/gh/nejdetkadir/rails-currency-conversion/tree/master)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
![Ruby Version](https://img.shields.io/badge/ruby%20v-3.0.0-blue.svg)
![Rails Version](https://img.shields.io/badge/rails%20v-6.1.4-blue.svg)

# Rails Currency Conversion
Currency conversion application with Ruby on Rails

# Installation
## Prerequisites
- [Ruby](https://rvm.io/)
- [NodeJS (>=10.x)](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
- [Yarn](https://yarnpkg.com/lang/en/docs/install/#debian-stable)
- [PostgreSQL](https://www.postgresql.org/download/)

## For Running
- Install GEM dependencies:
  ```bash
  bundle install
  ```
- Install asset dependencies:
  ```bash
  yarn install
  ```
- Create database, migrate tables and run the seed data:
  ```bash
  rails db:create
  rails db:migrate
  rails db:seed
  ```
- If you are setting up again, when you already have previous databases:
  ```bash
  rails db:reset
  ```
- For dropping database
  ```bash
  rails db:drop
  ``` 