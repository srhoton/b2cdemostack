FROM ruby:3.2.0 

ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . . 
CMD ["rails", "server", "-b", "0.0.0.0"]
