#!/bin/bash
# Take a screenshot
scrot /tmp/lockscreen.png

# Apply Gaussian blur using 'magick' (faster and more efficient on Debian 12+)
magick /tmp/lockscreen.png -blur 0x5 /tmp/lockscreen_blur.png

# Lock with the blurred image
i3lock -i /tmp/lockscreen_blur.png

# Clean up
rm /tmp/lockscreen.png /tmp/lockscreen_blur.png