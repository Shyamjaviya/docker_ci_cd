# Use Ruby base image
FROM ruby:3.1.6

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set working directory
WORKDIR /app

# Copy Gemfiles
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy app code
COPY . .

# Expose port
EXPOSE 3000

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]