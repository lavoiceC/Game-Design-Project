import os
from PIL import Image
import numpy as np

# 1. Load your image (make sure it's in the same folder as this script)
input_filename = "Icon-Base HardLine.png"
img = Image.open(input_filename).convert("RGBA")

# 2. Find where the "empty" (transparent) rows and columns are
data = np.array(img)
mask = data[:, :, 3] > 0  # Look for pixels with color (alpha > 0)

def find_ranges(arr):
    ranges = []
    start = None
    for i, val in enumerate(arr):
        if val and start is None:
            start = i
        elif not val and start is not None:
            ranges.append((start, i))
            start = None
    if start is not None:
        ranges.append((start, len(arr)))
    return ranges

# Create output folder
output_dir = "separated_sprites"
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# 3. Detect and Save Sprites
row_mask = np.any(mask, axis=1)
row_ranges = find_ranges(row_mask)

count = 0
for r_start, r_end in row_ranges:
    row_slice = mask[r_start:r_end, :]
    col_mask = np.any(row_slice, axis=0)
    col_ranges = find_ranges(col_mask)
    
    for c_start, c_end in col_ranges:
        # Tight crop to remove any extra transparent padding
        sprite_img = img.crop((c_start, r_start, c_end, r_end))
        sprite_img.save(f"{output_dir}/sprite_{count:03d}.png")
        count += 1

print(f"Done! {count} sprites saved to the '{output_dir}' folder.")