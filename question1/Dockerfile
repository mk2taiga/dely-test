FROM ruby:2.7.0

WORKDIR /usr/src/app
COPY . /usr/src/app
RUN bundle install

CMD ["ruby", "script/dely_script.rb"]
