#!/bin/bash
# Open Gmail filter settings

echo "📧 Opening Gmail filter settings..."
open "https://mail.google.com/mail/u/0/#settings/filters"

# Also open the main Gmail
sleep 1
open "https://mail.google.com/mail/u/0/"

echo "✅ Gmail opened!"
echo ""
echo "Next steps:"
echo "1. Go to Settings → 'See all settings'"
echo "2. Click 'Filters and Blocked Addresses'"
echo "3. Create filters for:"
echo "   • Internships: from:linkedin.com OR indeed.com OR wayup.com"
echo "   • Scholarships: from:hsf.net OR shpe.org OR alpfa.org"
