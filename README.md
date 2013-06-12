Amber Wave
==========

Use social-media data to highlight great communication.

## What it does

Amber Wave is a web application that summarizes metrics about government tweets (collected by an [Estuary server](https://github.com/measuredvoice/estuary)) and highlights tweets that have performed well.

Tweets are scored using mission-driven metrics for reach, kudos, and engagement. A baseline metric for each tweet (the tweeting account's follower count) allows tweets to be compared apples-to-apples over time and across accounts.

A few exceptional tweets are featured each week, and congratulatory tweets are sent to the accounts that wrote them.

## Quick Start



## How it works

Amber Wave is web application software written in Ruby on Rails, designed to be deployed to cloud infrastructure like Heroku or Amazon Web Services. 
 
A separate Estuary server collects and indexes information about government social-media messages daily. After a standard 48-hour period, it collects and stores mission-driven metrics about those messages. (See the [Estuary server](https://github.com/measuredvoice/estuary) documentation for more details.)

Using the Estuary API, Amber Wave retrieves the completed metrics for government Twitter accounts. Once those metrics are collected, Amber Wave summarizes and normalizes them at a few levels and stores the summaries.

Once a week, Amber Wave generates reports about the previous week's tweets by account, by segment (agency, sector, or other tag), and by tweet. Exceptional tweets are uncovered by generating percentile ranks for each metric, as compared to previous tweets on the same account and (normalized) tweets across all accounts.

The reports can be stored indefinitely. They are generated as static files in HTML and JSON (data) format. The HTML files can be regenerated from the JSON data using a republisher.

## Installation

### On Heroku

### In an existing Rails environment

## Caveats

Amber Wave is designed to combine public data sources to produce another public data source. Data is not stored securely or hidden behind access controls. 

Amber Wave doesn't access the Twitter API directly, and it does not return metrics or summaries in real-time. Tweet metrics might not appear for a week or more after adding an account to a source registry.

The data store isn't a complete archive of all tweets. It relies on Estuary, which trades 100% coverage for better performance and API friendliness. Use an archiving service or download from Twitter itself if a complete archive is needed.


## Contact

Amber Wave is a Measured Voice project. We're developing it to help government social-media writers.

Questions? Love this software? Email us at hi@measuredvoice.com.
