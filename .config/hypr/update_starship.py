import json
import os
import re

wal_colors_path = os.path.expanduser("~/.cache/wal/colors.json")
starship_config_path = os.path.expanduser("~/.config/starship.toml")

with open(wal_colors_path, "r") as f:
    colors = json.load(f)

bg_color = colors["colors"]["color0"]
fg_color = colors["colors"]["color7"]
accent_color1 = colors["colors"]["color1"]
accent_color2 = colors["colors"]["color2"]

with open(starship_config_path, "r") as f:
    config = f.read()

config = re.sub(
    r'(success_symbol\s*=\s*".*?)\)\(.*?(")', f"\\1)({fg_color} bold)\\2", config
)
config = re.sub(
    r'(error_symbol\s*=\s*".*?)\)\(.*?(")', f"\\1)({accent_color1})\\2", config
)
config = re.sub(
    r'(vimcmd_symbol\s*=\s*".*?)\)\(.*?(")', f"\\1)({accent_color2})\\2", config
)

config = re.sub(
    r'(\[directory\]\s*.*?style\s*=\s*").*?(")',
    f"\\1fg:{accent_color1}\\2",
    config,
    flags=re.DOTALL,
)

config = re.sub(
    r'(\[git_branch\]\s*.*?style\s*=\s*").*?(")',
    f"\\1fg:{accent_color2}\\2",
    config,
    flags=re.DOTALL,
)

config = re.sub(
    r'(\[time\]\s*.*?style\s*=\s*").*?(")',
    f"\\1fg:{fg_color}\\2",
    config,
    flags=re.DOTALL,
)

config = re.sub(
    r'(\[battery\]\s*.*?style\s*=\s*").*?(")',
    f"\\1fg:{accent_color1}\\2",
    config,
    flags=re.DOTALL,
)

with open(starship_config_path, "w") as f:
    f.write(config)

print("Starship colors updated successfully!")
