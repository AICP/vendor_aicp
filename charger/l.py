python3 - << 'EOF'
import os

os.makedirs("svg", exist_ok=True)

# Common SVG elements
CAP = '<rect x="130" y="24" width="40" height="12" rx="4" fill="#555555"/>'
BODY = '<rect x="85" y="38" width="130" height="236" rx="14" stroke="#555555" stroke-width="8" fill="none"/>'

# Colors from bottom to top across the 10 frames
COLORS = [
    "#e53935",  # Frame 0: Red
    "#e53935",  # Frame 1: Red
    "#fb8c00",  # Frame 2: Orange
    "#fb8c00",  # Frame 3: Orange
    "#fdd835",  # Frame 4: Yellow
    "#fdd835",  # Frame 5: Yellow
    "#7cb342",  # Frame 6: Light Green
    "#7cb342",  # Frame 7: Light Green
    "#43a047",  # Frame 8: Green
    "#43a047",  # Frame 9: Green
]

# Y coordinates from bottom to top
Y_POS = [246, 226, 206, 186, 166, 146, 126, 106, 86, 66]

# Generate battery_scale_00.svg through battery_scale_09.svg
for frame in range(10):
    bars = []
    color = COLORS[frame]
    for b in range(frame + 1):
        bars.append(f'  <rect x="97" y="{Y_POS[b]}" width="106" height="14" rx="4" fill="{color}"/>')
    bars_str = "\n".join(bars)
    
    svg_content = f"""<svg width="300" height="300" viewBox="0 0 300 300" fill="none" xmlns="http://www.w3.org/2000/svg">
  <rect width="300" height="300" fill="black"/>
  {CAP}
  {BODY}
{bars_str}
</svg>
"""
    with open(f"svg/battery_scale_{frame:02d}.svg", "w") as f:
        f.write(svg_content)

# Generate battery_fail.svg
fail_svg = f"""<svg width="300" height="300" viewBox="0 0 300 300" fill="none" xmlns="http://www.w3.org/2000/svg">
  <rect width="300" height="300" fill="black"/>
  {CAP}
  <rect x="85" y="38" width="130" height="236" rx="14" stroke="#e53935" stroke-width="8" fill="none"/>
  <path d="M150 90 L150 170" stroke="#e53935" stroke-width="12" stroke-linecap="round"/>
  <circle cx="150" cy="205" r="7" fill="#e53935"/>
</svg>
"""
with open("svg/battery_fail.svg", "w") as f:
    f.write(fail_svg)

print("Generated 11 SVGs successfully in svg/")
EOF
