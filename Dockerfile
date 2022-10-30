# syntax=docker/dockerfile:1
FROM ruby:2.7
RUN apt-get update -qq \
  && curl -sL https://deb.nodesource.com/setup_18.x | bash \
  && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY package.json /myapp/package.json
COPY package-lock.json /myapp/package-lock.json
RUN bundle install
RUN npm install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
EXPOSE 3036

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
