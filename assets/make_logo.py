"""IberisUI CurseForge logo generator. Run from any cwd."""
from PIL import Image, ImageDraw, ImageFont, ImageFilter
from pathlib import Path

SRC = Path(r"C:/Users/hrsrh/Downloads/쫑이.png")
OUT_DIR = Path(__file__).parent
OUT_2048 = OUT_DIR / "logo.png"
OUT_512 = OUT_DIR / "logo_512.png"

base = Image.open(SRC).convert("RGBA")
W, H = base.size

font = ImageFont.truetype("C:/Windows/Fonts/ariblk.ttf", 380)
text = "iberis"

probe = ImageDraw.Draw(base)
bbox = probe.textbbox((0, 0), text, font=font, stroke_width=8)
tw = bbox[2] - bbox[0]
th = bbox[3] - bbox[1]

x = (W - tw) // 2 - bbox[0]
y = int(H * 0.74) - bbox[1]

shadow = Image.new("RGBA", (W, H), (0, 0, 0, 0))
sd = ImageDraw.Draw(shadow)
sd.text((x + 10, y + 14), text, font=font, fill=(0, 0, 0, 230))
shadow = shadow.filter(ImageFilter.GaussianBlur(radius=12))
base = Image.alpha_composite(base, shadow)

draw = ImageDraw.Draw(base)
draw.text((x, y), text, font=font,
          fill=(255, 255, 255, 255),
          stroke_width=8, stroke_fill=(0, 0, 0, 255))

base.convert("RGB").save(OUT_2048, "PNG", optimize=True)
base.resize((512, 512), Image.LANCZOS).convert("RGB").save(OUT_512, "PNG", optimize=True)
print(f"saved: {OUT_2048}")
print(f"saved: {OUT_512}")
