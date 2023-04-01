# Dockerfile
# gets the docker parent image
FROM ruby:3.2.1-bullseye

RUN apt-get update && apt-get install -y npm && npm install -g yarn

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN gem install bundler
RUN gem install nokogiri -v 1.6.2.1 -- --use-system-libraries 
# --platform=ruby
RUN bundle install


CMD rails s -b 0.0.0.0