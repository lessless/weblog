# Log Parser

## Problem description - Log Parsing

Create a script with the following features:

- print list of visited pages sorted in descending order by the number of page views
- print list of unique page views sorted in descending order by the number of views
Acceptance criteria

## Acceptance Criteria

Script output should produce two tables in the following format:

Page visits:

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

The script is located inside the `bin` folder and expects a path to a log file as a single argument, e.g. `./bin/parser data/webserver.log`.
Make sure it's executable before running it - `chmod +x bin/parser`

## Running tests

Before running tests:

- Make sure that script is executable - `chmod +x bin/parser`. That is required for acceptance tests to pass.
- Install dependencies with  `bundle install`.

Run tests with `bundle exec rspec`.

### Structure

Acceptance tests located in `spec/feature` dir

## Implementation details

- I intentionally didn't take any extra steps to optimize how data is stored for performance and left it as open to new scenarios as possible. The reasons are: optimizations are not free - most of the time, they come at the cost of code readability, and second - it's best to optimize for the known scenarios when impact can be measured with load tests.
- I decided to name log file reader just `Reader` instead of `LogFileReader` just because there are no other input sources yet, and in case there would be other, I believe, it might make sense to group them under `Reader::*`
- `Parser::Reader` violates SRP as it knows both how to read a file and about a log file format. That's toleratable until there will be a requirement to read from a source other than a local file.
- There is an implicit contract between `Reader` and `StatsRepository` and `StatsRepository` and `Formatter` that a visit is described by the pair of values a `path` and an `ip`. That might be seen both as a Primitive Obsession code smell and violating the second rule of Simple Design. On the other side, something inside me is against wrapping every line in a log file in an object, and so far, it wins.
