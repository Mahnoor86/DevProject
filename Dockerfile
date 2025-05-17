# Use official Node image to build the app
FROM node:18

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the app code
COPY . .

# Build the app for production
RUN npm run build

# Use Node.js to serve the static files simply
RUN npm install -g serve

# Expose port 3000 and run app
EXPOSE 3000
CMD ["serve", "-s", "build", "-l", "3000"]
