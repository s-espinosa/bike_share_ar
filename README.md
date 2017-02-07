# Bike Share AR

## ActiveRecord Practice

This repository is intended to be a place to practice ActiveRecord methods. Lessons start at the very basic and move up from there. In order to use this repository:

* Fork the repo and clone your new repository to your machine.
* `bundle`
* `rake db:create db:migrate db:seed`
* Open a file in the spec folder, uncomment a test and make the specs pass.

## Current Status

Currently, this project is in development. Ultimately the plan is to cover the following topics:

* Finding Things
    * find_by
    * find
    * where
    * where.not
* Organizing Results
    * order
    * limit/offset
    * group
    * having
    * pluck
* Calculations
    * average
    * minimum
    * maximum
    * sum
* Working With Multiple Tables
    * joins
    * left_outer_joins
    * merge
* Other Considerations
    * includes
    * find_or_create_by

Currently spec files are being developed to double as lessons. In the future there may be additional spec files to provide practice. Ideally these will be further split by difficulty. At some point, it may be beneficial for advanced topics to be solved not *in* the test, but using methods on the models.

Pull requests accepted and any additional tests would be greatly appreciated.
