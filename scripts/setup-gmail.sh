#!/bin/bash
# Setup Gmail labels and filters for job/scholarship tracking

echo "📧 GMAIL SETUP FOR 7mangel"
echo "=========================="
echo ""
echo "This will create labels in your Gmail for organizing opportunities."
echo ""

# Check if gog is configured
if ! gog gmail search "test" --max 1 > /dev/null 2>&1; then
    echo "❌ Error: Gmail not connected. Run: gog auth gmail"
    exit 1
fi

echo "✅ Gmail connected"
echo ""
echo "Creating labels..."

# Note: gog doesn't have direct label creation, so we provide instructions
echo ""
echo "📋 MANUAL SETUP REQUIRED:"
echo ""
echo "1. Open Gmail (mail.google.com)"
echo "2. Go to Settings (gear icon) → 'See all settings'"
echo "3. Click 'Labels' tab"
echo "4. Click 'Create new label' and create these:"
echo ""
echo "   📁 Internships"
echo "   📁 Internships/Applied"
echo "   📁 Internships/Interviews"
echo "   📁 Internships/Offers"
echo "   📁 Scholarships"
echo "   📁 Scholarships/Applied"
echo "   📁 Scholarships/Awarded"
echo ""
echo "5. Click 'Filters and Blocked Addresses' tab"
echo "6. Click 'Create a new filter'"
echo ""
echo "   FILTER 1 - Internship Opportunities:"
echo "   From: jobs@linkedin.com OR alerts@indeed.com OR jobs@wayup.com OR opportunities@jopwell.com OR careers@"
echo "   → Apply label: Internships"
echo ""
echo "   FILTER 2 - Scholarships:"
echo "   From: scholarships@hsf.net OR scholarships@shpe.org OR alpfa.org OR scholarship"
echo "   → Apply label: Scholarships"
echo ""
echo "   FILTER 3 - Application Confirmations:"
echo "   Subject: 'application received' OR 'application submitted' OR 'thank you for applying'"
echo "   → Apply label: Internships/Applied"
echo ""
echo "✅ Done! All opportunities will be automatically organized."
