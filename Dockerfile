FROM ruby:2.4.4
RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /myapp
WORKDIR /myapp

# download all dependencies for project
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
# also need to install sqllite.  probably from apt-get
# also need to instal 

# Copies everything in current directory (source code, etc.)
COPY . /myapp

# start what we need to run application
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
