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
/home | 90
/index | 80

Unique page views:

Page | Number of views
--- | ---
/about/2 | 8
/index | 5

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
- There are few Open/Closed violations because entities from log file entries, e.g., Path and IP Address, are represented as string literals instead of value objects. At the moment, it seems like a reasonable tradeoff.
- I decided not to wrap every parsed line in a class but instead provide aggregates for Visits and Views. That would be better than passing around a data structure for a few reasons: better communication of intent (second rule of Simple Design) and better encapsulation of domain knowledge (better than having a Formatter massaging hashes).
-  Initially, I considered log entry valid if it contains at least a path on the premise that it should be displayed in summary if a visit to it was recorded. But exploring an alternative option without `StatsRepository` led me to a better design where it's not needed at all. Also, I got rid of most of the code smells, including SRP violation in `StatsRepository` when it knows the difference between a Visit and a View. The code is here https://github.com/lessless/weblog/pull/1
