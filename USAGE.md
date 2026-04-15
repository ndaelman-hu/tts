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
```

### Use a Specific Voice

```bash
cabal run piper-reader -- read-file test.txt \
  --voice voices/en_US-lessac-medium.onnx \
  --play
```

### Download More Voices

Browse available voices: https://rhasspy.github.io/piper-samples/

Download example:
```bash
cd voices
wget https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/amy/medium/en_US-amy-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/amy/medium/en_US-amy-medium.onnx.json
```

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
  --voice voices/en_US-lessac-medium.onnx \
  --speed 1.4 \
  --play
```

## Command-Line Flags Reference

| Flag | Short | Description | Example |
|------|-------|-------------|---------|
| `--voice` | `-v` | Voice model file | `--voice voices/en_US-amy-medium.onnx` |
| `--speed` | `-s` | Speech speed (0.5-2.0) | `--speed 1.5` |
| `--play` | `-p` | Play directly (no file) | `--play` |
| `--output` | `-o` | Output WAV file | `--output audio.wav` |

## Examples

### 1. Quick Test with Default Settings

```bash
echo "Testing piper reader" > test.txt
cabal run piper-reader -- read-file test.txt --play
```

### 2. Slow Reading for Learning

```bash
cabal run piper-reader -- read-file language_lesson.txt \
  --speed 0.7 \
  --play
```

### 3. Fast Reading for Skimming

```bash
cabal run piper-reader -- read-file news_article.txt \
  --speed 1.8 \
  --play
```

### 4. Save Multiple Versions

```bash
# Normal speed
cabal run piper-reader -- read-file poem.txt -o poem_normal.wav

# Slow for emphasis
cabal run piper-reader -- read-file poem.txt --speed 0.6 -o poem_slow.wav

# Fast version
cabal run piper-reader -- read-file poem.txt --speed 1.5 -o poem_fast.wav
```

## Tips

1. **Play vs Save**: Use `--play` for immediate feedback, save to file for reuse or archiving

2. **Finding the Right Speed**:
   - 1.0 = normal conversational pace
   - 0.7-0.9 = good for learning/comprehension
   - 1.2-1.5 = good for news/articles
   - 1.6-2.0 = very fast, for experienced listeners

3. **Voice Quality**:
   - `medium` models are the best balance of quality/speed
   - `high` models have better quality but are slower
   - `low` models are faster but lower quality

4. **Piping Text**:
   ```bash
   cat article.txt | cabal run piper-reader -- interactive --play
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

### Speed Out of Range

Speed must be between 0.5 and 2.0:
```bash
# This will error:
cabal run piper-reader -- read-file test.txt --speed 3.0

# Use valid range:
cabal run piper-reader -- read-file test.txt --speed 2.0
```
