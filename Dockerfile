# Use the official Node.js image
FROM node:23-alpine

# Set the working directory
WORKDIR /app/fistExpress

# Copy package.json and application files
COPY package.json ./ 
COPY src ./src

# Install dependencies
RUN npm install

RUN addgroup -g 10014 choreo && \
    adduser --disabled-password --no-create-home --uid 10014 --ingroup choreo choreouser

USER 10014

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
