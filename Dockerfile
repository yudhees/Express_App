# Use the official Node.js image
FROM node:23-alpine

# Create a non-root user with a specific UID between 10000 and 20000
# RUN addgroup -S appgroup && adduser -S appuser -G appgroup -u 10001

# Set the working directory
WORKDIR /app/fistExpress

# Copy package.json and application files
COPY package.json ./ 
COPY src ./src

# Adjust permissions for the non-root user
# RUN chown -R appuser:appgroup /app

# Create a user with a known UID/GID within range 10000-20000.
# This is required by Choreo to run the container as a non-root user.
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    "choreo"
# Use the above created unprivileged user
USER 10014

# Explicitly set the user with UID between 10000 and 20000
# USER appuser

# Install dependencies
RUN npm install

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
