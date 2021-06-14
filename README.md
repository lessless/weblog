### Log Parser

## Problem description - Log Parsing

Create a script with the following features:

- print list of visited pages sorted in descending order by the number of page views
- print list of unique page views sorted in descending order by the number of views
Acceptance criteria

## Acceptance Criteria
Script output should produce two tables in the following format:

Page views:

Page | Number of visits
--- | ---
/home | 90 visits
/index | 80 visits

Unique page views:

Page | Number of views
--- | ---
/about/2 | 8 unique views
/index | 5 unique views

## Running script


## Running tests

Run `bundle install` followed by `bundle exec rspec`

### Structure

Acceptance tests located in `spec/feature` dir

## Implementation details
