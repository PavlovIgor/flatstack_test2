FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /auctions
WORKDIR /auctions
ADD Gemfile /auctions/Gemfile
ADD Gemfile.lock /auctions/Gemfile.lock
RUN bundle
ADD . /auctions