#!/bin/bash
# Script to sign up for top internship boards
# Run this to open all sign-up pages

echo "🎯 Opening Top 5 Internship Board Sign-ups..."
echo ""

# Priority 1: LinkedIn Job Alerts
echo "1. LinkedIn Job Alerts"
echo "   URL: https://www.linkedin.com/jobs/search/?keywords=internship&location=Dallas%2C%20Texas"
open "https://www.linkedin.com/jobs/search/?keywords=internship&location=Dallas%2C%20Texas"
sleep 2

# Priority 2: Handshake
echo "2. Handshake (College-focused)"
echo "   URL: https://joinhandshake.com"
open "https://joinhandshake.com"
sleep 2

# Priority 3: Jopwell (Diversity)
echo "3. Jopwell (Black/Latinx/Native American)"
echo "   URL: https://jopwell.com"
open "https://jopwell.com"
sleep 2

# Priority 4: WayUp
echo "4. WayUp (Entry-level & Internships)"
echo "   URL: https://wayup.com"
open "https://wayup.com"
sleep 2

# Priority 5: Wall Street Oasis (Finance)
echo "5. Wall Street Oasis (Finance-focused)"
echo "   URL: https://wallstreetoasis.com"
open "https://wallstreetoasis.com"

echo ""
echo "✅ Opened all 5 sign-up pages!"
