#!/bin/bash
cd "$(dirname "$0")/ui"
echo "🎯 Starting Job Search UI..."
echo "🔗 Open: http://localhost:8080"
python3 -m http.server 8080
