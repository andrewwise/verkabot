# Use the official Ruby image as the base image
FROM ruby:2.7

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the dependencies
RUN bundle install

# Copy the application code into the container
COPY . .

# Set the default command to run the application
CMD ["ruby", "lib/bot.rb"]
