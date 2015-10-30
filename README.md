## hubot-yelp

Enables hubot to give wisdom from Jaden Smith

See [`src/jaden.coffee`](src/jaden.coffee) for full documentation.

## Build and Static Analysis

[![Build Status](https://travis-ci.org/pcarn/hubot-jaden.svg)](https://travis-ci.org/pcarn/hubot-jaden)
[![Codacy Badge](https://api.codacy.com/project/badge/6a56acb4d30644a3993e44199033c029)](https://www.codacy.com/app/pcarn/hubot-jaden)

## Installation

In hubot project repo, run:

`npm install hubot-jaden --save`

Then add **hubot-jaden** to your `external-scripts.json`:

```json
[
  "hubot-jaden"
]
```

## Configuration

The following configuration is required in order to run the yelp script:

```coffeescript
HUBOT_TWITTER_CONSUMER_KEY         # The Twitter API consumer key
HUBOT_TWITTER_CONSUMER_SECRET      # The Twitter API consumer secret
HUBOT_TWITTER_ACCESS_TOKEN         # The Twitter API access token
HUBOT_TWITTER_ACCESS_TOKEN_SECRET  # The Twitter API access token secret
```

All of these should be configured using the API keys given to you when you signed up for a Twitter Developer API account.

## Sample Interaction

The hubot-jaden script will allow your hubot to give you wisdom in quotes from Jaden Smith.
By using `hubot jaden me`, hubot will give you a random quote.

```
<You> hubot jaden me
<hubot> I Should Just Stop Tweeting, The Human Consciousness Must Raise Before I Speak My Juvenile Philosophy.
```

By using `hubot jaden latest`, hubot will show you Jaden's latest tweet.

```
<You> hubot jaden latest
<hubot> HardWork Dedication Until There's Peace And Non Poverty In Every Nation, And I Isn't Patient. ||
```

## Powered by

[![Twit]](https://github.com/ttezel/twit)

[![Jaden Smith]](http://twitter.com/officialjaden)

[![CoffeeScript](http://coffeescript.org/documentation/images/logo.png)](http://coffeescript.org/)

[Hubot](https://hubot.github.com/)
