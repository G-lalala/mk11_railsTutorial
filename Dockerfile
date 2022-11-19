FROM ruby:latest

ENV LANG C.UTF-8

RUN gem install rails

RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src

# install bundler.
RUN apt-get update
RUN gem install bundler

ADD src $WORKSPACE
RUN bundle install

EXPOSE  3000
CMD ["rails", "server", "-b", "0.0.0.0"]
