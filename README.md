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

## Code Quality

After installing dependencies with `bundle exec rspec` following commands will be available:
  - `bundle exec rubocop` for code linting
  - `bundle exec reek` for code smells detection

Test coverage is available at `coverage/index.html` (effective after running full test suite with `bundle exec rspec`)

## Implementation details

- I intentionally didn't take any extra steps to optimize how data is stored for performance and left it as open to new scenarios as possible. The reasons are: optimizations are not free - most of the time, they come at the cost of code readability, and second - it's best to optimize for the known scenarios when impact can be measured with load tests.
- `Parser::LogFileReader` violates SRP as it knows both how to read a file and about a log file format. That's toleratable until there will be a requirement to read from a source other than a local file.
- I decided not to wrap every parsed line in a class but instead provide aggregates for Visits and Views. That would be better than passing around a data structure for a few reasons: better communication of intent (second rule of Simple Design) and better encapsulation of domain knowledge (better than having a Formatter massaging hashes).
- I considered log entry valid if it contains at least a path on the premise that it should be displayed in summary if a visit to it was recorded. Missing or invalid IP I considered as a possible infrastructural problem that shouldn't affect statistics. Of course, in a real-world situation, this kind of question should be resolved by business. Invalid entries will be recorded as 'Invalid IP' instead of their original values
