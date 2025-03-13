import json
import os

# Paths to pywal colors and starship configuration
wal_colors_path = os.path.expanduser("~/.cache/wal/colors.json")
starship_config_path = os.path.expanduser("~/.config/starship.toml")

# Read pywal colors
with open(wal_colors_path, 'r') as f:
    colors = json.load(f)

# Extract colors
bg_color = colors['colors']['color0']
fg_color = colors['colors']['color7']
accent_color1 = colors['colors']['color1']
accent_color2 = colors['colors']['color2']

# Define the new starship configuration
starship_config = f"""
format="$directory$git_branch$character"

# Prompt symbols 
[character]
success_symbol = "[🞈]({fg_color} bold)"
error_symbol = "[🞈]({accent_color1})"
vicmd_symbol = "[🞈]({accent_color2})"

[directory]
format = "[]($style)[(bg:{accent_color1} fg:{accent_color2})$path](bg:{accent_color1} fg:{fg_color})[ ]($style)"
style = "fg:{accent_color1}"

[git_branch]
format = "[]($style)[[ ](bg:{accent_color1} fg:{fg_color} bold)$branch](bg:{accent_color1} fg:{accent_color2})[ ]($style)"
style = "fg:{accent_color1}"
"""

# Write the new configuration to starship.toml
with open(starship_config_path, 'w') as f:
    f.write(starship_config)
