# Custom Fonts Directory

## TiketOdysseyText Font

This app uses the **TiketOdysseyText** font family.

### How to add the font files:

1. **Download or convert the font files:**
   - The web fonts are available at:
     - https://storage.tiket.com/shared-components/fonts/TiketOdysseyText-Regular.woff2
     - https://storage.tiket.com/shared-components/fonts/TiketOdysseyText-Regular.woff
   
2. **Convert WOFF/WOFF2 to TTF format:**
   - Flutter mobile apps require TTF or OTF format (not WOFF/WOFF2)
   - You can convert using online tools like:
     - https://convertio.co/woff2-ttf/
     - https://cloudconvert.com/woff2-to-ttf
     - https://onlinefontconverter.com/

3. **Place the converted files here:**
   - `TiketOdysseyText-Regular.ttf` (weight: 400)
   - `TiketOdysseyText-Bold.ttf` (weight: 700 - if available)

4. **Run Flutter commands:**
   ```bash
   flutter clean
   flutter pub get
   ```

### Temporary Fallback:
If the font files are not available, the app will fall back to the default system font.

### Alternative:
If you don't have access to TiketOdysseyText, you can use similar fonts like:
- Poppins
- Inter
- Roboto
- San Francisco (iOS default)

To change to another font, update the `fontFamily` in both:
- `lib/main.dart` (ThemeData)
- `pubspec.yaml` (fonts section)
