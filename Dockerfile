# Use the official Node.js image
FROM node:23-alpine

# Set the working directory
WORKDIR /app/fistExpress

# Copy package.json and application files
COPY package.json ./ 
COPY src ./src

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    "choreo"
# Use the above created unprivileged user
# Adjust permissions for the application directory so that the user can access it
RUN chown -R choreo:choreo /app

# Set npm cache directory to a writable location
ENV npm_config_cache=/tmp/.npm

# Use the created unprivileged user
USER choreo

# USER 10014

# Install dependencies
RUN npm install

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
