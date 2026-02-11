#!/bin/bash
# Monitor Gmail for internship opportunities
echo "📧 Checking for new internship emails..."
gog gmail messages search "newer_than:1d from:jobs@linkedin.com OR from:alerts@indeed.com OR from:jobs@wayup.com" --max 20
echo "Done!"
