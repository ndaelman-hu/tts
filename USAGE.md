# Piper-Reader Usage Guide

## Basic Usage

### 1. Read a Text File (Save to WAV)

```bash
echo "Hello from Haskell TTS" > test.txt
cabal run piper-reader -- read-file test.txt
# Creates: output.wav
```

### 2. Read and Play Directly (No File)

```bash
cabal run piper-reader -- read-file test.txt --play
# Plays immediately using aplay
```

### 3. Custom Output File

```bash
cabal run piper-reader -- read-file test.txt -o myaudio.wav
```

## Voice Selection

### List Available Voices

```bash
cabal run piper-reader -- list-voices
# Output shows: voice-name (Language: code)
# Example:
#   - en_US-bryce-medium (Language: en)
#   - es_ES-davefx-medium (Language: es)
```

### Use Language-Based Selection (Recommended)

The `--lang` flag automatically selects the first matching voice for that language:

```bash
# English
cabal run piper-reader -- read-file test.txt --lang en --play

# Spanish
cabal run piper-reader -- read-file spanish.txt --lang es --play

# German (after downloading a German voice)
cabal run piper-reader -- read-file german.txt --lang de --play
```

**Supported languages:** 35+ including Arabic (ar), Chinese (zh), German (de), Spanish (es), French (fr), Italian (it), Japanese (ja), Portuguese (pt), Russian (ru), and more.

### Use a Specific Voice File

For precise control, specify the exact voice file:

```bash
cabal run piper-reader -- read-file test.txt \
  --voice voices/en_US-bryce-medium.onnx \
  --play
```

### Preview & Download More Voices

#### 1. Preview Voices Online

**Visit:** https://rhasspy.github.io/piper-samples/

- Listen to samples of all available voices
- Compare different speakers and accents
- Each voice plays the same text so you can easily compare

#### 2. Download Voices

**URL Pattern:**
```
https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/{lang}/{locale}/{voice}/{quality}/{filename}
```

**Examples:**

```bash
cd voices

# Spanish (Spain) - Medium Quality
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/davefx/medium/es_ES-davefx-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/davefx/medium/es_ES-davefx-medium.onnx.json

# French (France) - Medium Quality
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/medium/fr_FR-siwis-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/medium/fr_FR-siwis-medium.onnx.json

# German (Germany) - Medium Quality
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/medium/de_DE-thorsten-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/medium/de_DE-thorsten-medium.onnx.json
```

**Important:** Always download BOTH files (`.onnx` and `.onnx.json`)!

#### 3. Browse All Voices

Full catalog: https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0

**Quality Levels:**
- `x_low` - Fastest, lowest quality (~10-20MB)
- `low` - Fast, decent quality (~20-40MB)
- `medium` - **Best balance** (~60MB) ⭐
- `high` - Highest quality, slower (~80-100MB)

## Speed Control

### Normal Speed (1.0)

```bash
cabal run piper-reader -- read-file test.txt --play
```

### Faster (1.5x)

```bash
cabal run piper-reader -- read-file test.txt --speed 1.5 --play
```

### Slower (0.5x)

```bash
cabal run piper-reader -- read-file test.txt --speed 0.5 --play
```

**Speed range:** 0.5 (half speed) to 2.0 (double speed)

## Interactive Mode

Read from stdin:

```bash
cabal run piper-reader -- interactive --play
# Type or paste text
# Press Ctrl+D to synthesize and play
```

With custom voice and speed:

```bash
cabal run piper-reader -- interactive \
  --voice voices/en_US-amy-medium.onnx \
  --speed 1.2 \
  --play
```

## Combining Options

### Read with Custom Voice, Speed, and Save to File

```bash
cabal run piper-reader -- read-file article.txt \
  --voice voices/en_US-amy-medium.onnx \
  --speed 1.3 \
  --output my_article.wav
```

### Read and Play with All Options

```bash
cabal run piper-reader -- read-file book_chapter.txt \
  --voice voices/en_US-bryce-medium.onnx \
  --speed 1.4 \
  --play
```

## Command-Line Flags Reference

| Flag | Short | Description | Example |
|------|-------|-------------|---------|
| `--lang` | `-l` | Language code (auto-selects voice) | `--lang es` |
| `--voice` | `-v` | Specific voice model file | `--voice voices/en_US-bryce-medium.onnx` |
| `--speed` | `-s` | Speech speed (0.5-2.0) | `--speed 1.5` |
| `--play` | `-p` | Play directly (no file) | `--play` |
| `--output` | `-o` | Output WAV file | `--output audio.wav` |

**Note:** `--lang` and `--voice` are mutually exclusive. If both provided, `--voice` takes precedence.

## Examples

### 1. Quick Test with Default Settings

```bash
echo "Testing piper reader" > test.txt
cabal run piper-reader -- read-file test.txt --play
```

### 2. Multilingual Reading

```bash
# English
echo "Hello world" | cabal run piper-reader -- interactive --lang en --play

# Spanish
echo "Hola mundo" | cabal run piper-reader -- interactive --lang es --play

# Read a Spanish text file
cabal run piper-reader -- read-file spanish_article.txt --lang es --play
```

### 3. Slow Reading for Learning

```bash
# Slow Spanish for language learning
cabal run piper-reader -- read-file spanish_lesson.txt \
  --lang es \
  --speed 0.7 \
  --play
```

### 4. Fast Reading for Skimming

```bash
cabal run piper-reader -- read-file news_article.txt \
  --lang en \
  --speed 1.8 \
  --play
```

### 5. Save Multiple Versions

```bash
# Normal speed
cabal run piper-reader -- read-file poem.txt --lang en -o poem_normal.wav

# Slow for emphasis
cabal run piper-reader -- read-file poem.txt --lang en --speed 0.6 -o poem_slow.wav

# Fast version
cabal run piper-reader -- read-file poem.txt --lang en --speed 1.5 -o poem_fast.wav
```

### 6. Specific Voice Selection

```bash
# Use Mexican Spanish instead of Spain Spanish
cabal run piper-reader -- read-file spanish.txt \
  --voice voices/es_MX-claude-high.onnx \
  --play

# Test different English voice
cabal run piper-reader -- read-file test.txt --voice voices/en_US-bryce-medium.onnx --play
```

## Multilingual Usage

### Automatic Language Selection

Use `--lang` to automatically select a voice for the language:

```bash
# If you have multiple Spanish voices installed, it picks the first one
cabal run piper-reader -- read-file document.txt --lang es --play
```

### Language Codes

Common language codes:
- `en` - English
- `es` - Spanish (Español)
- `fr` - French (Français)
- `de` - German (Deutsch)
- `it` - Italian (Italiano)
- `pt` - Portuguese (Português)
- `ru` - Russian (Русский)
- `zh` - Chinese (中文)
- `ja` - Japanese (日本語)
- `ar` - Arabic (العربية)

Full list: https://rhasspy.github.io/piper-samples/

### Regional Variants

Some languages have multiple regional variants:
- `en_US` vs `en_GB` - American vs British English
- `es_ES` vs `es_MX` vs `es_AR` - Spain vs Mexico vs Argentina Spanish
- `pt_BR` vs `pt_PT` - Brazilian vs European Portuguese

When using `--lang es`, it will select any Spanish voice (es_ES, es_MX, etc.).
For specific variants, use `--voice` with the full filename.

## Tips

1. **Play vs Save**: Use `--play` for immediate feedback, save to file for reuse or archiving

2. **Language Selection**:
   - Use `--lang` for convenience (auto-selects first matching voice)
   - Use `--voice` for precise control over which voice/accent to use
   - Run `list-voices` to see what languages you have installed

3. **Finding the Right Speed**:
   - 1.0 = normal conversational pace
   - 0.7-0.9 = good for learning/comprehension
   - 1.2-1.5 = good for news/articles
   - 1.6-2.0 = very fast, for experienced listeners

4. **Voice Quality**:
   - `x_low` - fastest, lowest quality (~10-20MB)
   - `low` - fast, decent quality (~20-40MB)
   - `medium` - **best balance** (~60MB) ⭐ Recommended!
   - `high` - highest quality, slower (~80-100MB)

5. **Disk Space**: Each voice is approximately 61MB (medium quality). Plan accordingly if downloading many voices.

6. **Piping Text**:
   ```bash
   cat article.txt | cabal run piper-reader -- interactive --lang en --play
   ```

## Troubleshooting

### No Audio Output

Check if `aplay` is installed:
```bash
which aplay
# If not found: sudo apt install alsa-utils
```

### Voice Not Found

Ensure voice file exists:
```bash
ls -lh voices/
```

### No Voice Found for Language

If you get an error like "No voice found for language: es":

```bash
# Check what voices you have installed
cabal run piper-reader -- list-voices

# Download a voice for that language (see "Download More Voices" section above)
# Then try again
```

### Speed Out of Range

Speed must be between 0.5 and 2.0:
```bash
# This will error:
cabal run piper-reader -- read-file test.txt --speed 3.0

# Use valid range:
cabal run piper-reader -- read-file test.txt --speed 2.0
```

### Missing .json Config File

Each voice needs both `.onnx` and `.onnx.json` files:

```bash
# If you get an error about missing config, download the .json file:
cd voices
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/davefx/medium/es_ES-davefx-medium.onnx.json
```
