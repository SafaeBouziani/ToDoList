#!/bin/sh

echo "window._env_ = {" > /tmp/config.js
echo "  REACT_APP_BACKEND_URL: \"${REACT_APP_BACKEND_URL}\"," >> /tmp/config.js
echo "  NODE_ENV: \"production\"" >> /tmp/config.js
echo "};" >> /tmp/config.js

# Start nginx
nginx -g "daemon off;"
