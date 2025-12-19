#!/bin/bash
# fact_check.sh — Guide manual fact-checking with primary-source suggestions
CLAIM="${1:-General claim}"
echo "=== Manual Fact-Check Guidance for: $CLAIM ==="
echo ""
echo "Always do this work yourself — no automation."
echo ""
echo "Suggested tools and order:"
echo "1. Primary sources first (official site, books, transcripts)"
echo "2. Internet Archive Wayback Machine: https://web.archive.org/web/*/URL"
echo "3. Archive.today (manual snapshot): https://archive.is or https://archive.ph"
echo "4. Memento Time Travel aggregator: https://timetravel.mementoweb.org"
echo "5. Perma.cc for permanent citations (if creating your own archive)"
echo ""
echo "Tips:"
echo "- Use quotes for exact phrases"
echo "- site:domain.com to restrict searches"
echo "- Cross-check opposing viewpoints manually"
echo "- Note any ideological or cultural framing you observe"
echo ""
read -p "Enter your findings (copy-paste links, quotes, timestamps): " FINDINGS
read -p "Ideological/cultural notes (or 'none'): " IDEO_NOTES
echo ""
echo "Logging to work/_active/facts.md when post is active..."
echo "Suggested draft integration:"
echo '[fact-checked: details in facts.md] or inline summary with links.'
