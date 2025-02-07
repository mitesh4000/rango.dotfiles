
#!/bin/bash

# Get current brightness value
current_brightness=$(brightnessctl g)

# Get maximum brightness value
max_brightness=$(brightnessctl m)

# Calculate percentage
percentage=$((100 * current_brightness / max_brightness))

# Output the brightness with a brightness icon
echo "   $percentage%"
