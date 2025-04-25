# Step 1: Build the Flutter web app
FROM dart:stable AS build

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN flutter doctor

# Enable web support
RUN flutter config --enable-web

# Create app directory and copy project
WORKDIR /app
COPY . .

# Get dependencies and build
RUN flutter pub get
RUN flutter build web

# Step 2: Serve with nginx
FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy built Flutter web app
COPY --from=build /app/build/web /usr/share/nginx/html

# Copy custom nginx config (optional)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
