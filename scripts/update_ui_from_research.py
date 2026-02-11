#!/usr/bin/env python3
"""
Update UI with overnight research results
Reads JSON and generates HTML for the dashboard
"""

import json
from datetime import datetime

RESEARCH_FILE = "/tmp/job-tracker/data/overnight_research_results.json"
UI_OUTPUT = "/tmp/job-tracker/ui/opportunities_from_research.html"

def load_research():
    with open(RESEARCH_FILE, 'r') as f:
        return json.load(f)

def generate_html(data):
    urgent = data['by_urgency']['urgent']
    warning = data['by_urgency']['warning']
    safe = data['by_urgency']['safe']
    
    html = f"""<!-- AUTO-GENERATED FROM OVERNIGHT RESEARCH -->
<!-- Generated: {datetime.now().isoformat()} -->

<h3>🌙 Overnight Research Results (Top 73 Companies)</h3>
<div class="legend" style="margin-bottom: 20px;">
    <div class="legend-item"><div class="legend-dot" style="background: #e74c3c; width: 12px; height: 12px; border-radius: 50%;"></div><span>Less than 2 weeks ({len(urgent)})</span></div>
    <div class="legend-item"><div class="legend-dot" style="background: #f39c12; width: 12px; height: 12px; border-radius: 50%;"></div><span>2-4 weeks ({len(warning)})</span></div>
    <div class="legend-item"><div class="legend-dot" style="background: #27ae60; width: 12px; height: 12px; border-radius: 50%;"></div><span>More than 4 weeks ({len(safe)})</span></div>
</div>

<div id="overnight-opportunities">
"""
    
    # Add Priority 1 companies first
    priority_1 = data['by_priority']['priority_1']
    html += f"<h4>⭐ Priority 1 Companies ({len(priority_1)})</h4>"
    
    for company in priority_1:
        deadline = company.get('deadline', 'TBD')
        location = company.get('location', '')
        roles = ', '.join(company.get('roles', ['SWE']))
        
        # Determine urgency class
        html += f"""
    <div class="job-item warning">
        <div class="job-header">
            <div class="job-company">{company['name']}</div>
            <div class="deadline warning">📅 Due: {deadline}</div>
        </div>
        <div class="job-role">{roles}</div>
        <div class="job-tags">
            <span class="tag">💼 Internship</span>
            <span class="tag">⭐ Priority 1</span>
            {f'<span class="tag dallas">📍 {location}</span>' if location else ''}
        </div>
        <div class="actions">
            <button class="btn btn-apply" onclick="approveJob('{company['name']}', '{roles.split(',')[0]}')">✓ ADD TO QUEUE</button>
            <button class="btn btn-info" onclick="window.open('https://{company['url']}', '_blank')">🔗 VISIT SITE</button>
        </div>
    </div>
"""
    
    # Add Priority 2 companies
    priority_2 = data['by_priority']['priority_2']
    html += f"<h4>🎯 Priority 2 Companies ({len(priority_2)})</h4>"
    
    for company in priority_2[:15]:  # Show first 15
        deadline = company.get('deadline', 'TBD')
        location = company.get('location', '')
        roles = ', '.join(company.get('roles', ['SWE']))
        
        html += f"""
    <div class="job-item safe">
        <div class="job-header">
            <div class="job-company">{company['name']}</div>
            <div class="deadline safe">📅 Due: {deadline}</div>
        </div>
        <div class="job-role">{roles}</div>
        <div class="job-tags">
            <span class="tag">💼 Internship</span>
            <span class="tag">🎯 Priority 2</span>
            {f'<span class="tag dallas">📍 {location}</span>' if location else ''}
        </div>
        <div class="actions">
            <button class="btn btn-apply" onclick="approveJob('{company['name']}', '{roles.split(',')[0]}')">✓ ADD TO QUEUE</button>
            <button class="btn btn-info" onclick="window.open('https://{company['url']}', '_blank')">🔗 VISIT SITE</button>
        </div>
    </div>
"""
    
    html += f"<p style='text-align: center; margin-top: 20px; color: #666;'>+ {len(priority_2) - 15} more Priority 2 companies...</p>"
    
    html += "</div>"
    
    with open(UI_OUTPUT, 'w') as f:
        f.write(html)
    
    print(f"✅ Updated UI with {len(priority_1)} Priority 1 and {len(priority_2)} Priority 2 companies")
    print(f"💾 Saved to: {UI_OUTPUT}")

if __name__ == "__main__":
    data = load_research()
    generate_html(data)
