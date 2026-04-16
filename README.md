# Piper-Reader

Privacy-focused local text-to-speech reader using Piper TTS and Haskell.

## Features

- 100% local processing (no cloud APIs)
- Type-safe Haskell implementation
- Read text files
- Read from URLs (planned)
- **Multilingual support** (35+ languages via Piper)
- **Language-based voice selection** with `--lang` flag
- Multiple voice support
- Speed control (0.5x - 2.0x)

## Setup

### 1. Piper Binary (Already Done)
The Piper binary is already downloaded in `bin/`.

### 2. Voice Models

#### Installed Voices
- `en_US-lessac-medium.onnx` (English - US)
- `en_US-bryce-medium.onnx` (English - US)
- `es_ES-davefx-medium.onnx` (Spanish - Spain)
- `es_MX-claude-high.onnx` (Spanish - Mexico)

#### Preview & Download More Voices

**Preview voices:** https://rhasspy.github.io/piper-samples/
- Listen to samples of all available voices
- Find voices in 35+ languages (Arabic, Chinese, French, German, Italian, Portuguese, Russian, etc.)

**Download voices:**
```bash
# Example: Download German voice
cd voices
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/medium/de_DE-thorsten-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/medium/de_DE-thorsten-medium.onnx.json
```

**URL structure:**
```
https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/{language}/{locale}/{voice}/{quality}/{filename}
```

Examples:
- French: `fr/fr_FR/siwis/medium/fr_FR-siwis-medium.onnx`
- Italian: `it/it_IT/riccardo/x_low/it_IT-riccardo-x_low.onnx`
- Portuguese: `pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx`

**Note:** Always download both `.onnx` and `.onnx.json` files!

### 3. Build

```bash
cd ~/Programs/piper-reader
cabal build
```

## Usage

### List available voices
```bash
cabal run piper-reader -- list-voices
# Shows: voice name (Language: code)
```

### Read a text file
```bash
# Use default voice
cabal run piper-reader -- read-file myfile.txt --play

# Use specific language (auto-selects first matching voice)
cabal run piper-reader -- read-file spanish.txt --lang es --play

# Use specific voice file
cabal run piper-reader -- read-file myfile.txt --voice voices/en_US-bryce-medium.onnx --play
```

### Interactive mode
```bash
# English (automatic voice selection)
echo "Hello world" | cabal run piper-reader -- interactive --lang en --play

# Spanish (automatic voice selection)
echo "Hola mundo" | cabal run piper-reader -- interactive --lang es --play

# With custom speed
cabal run piper-reader -- interactive --lang en --speed 1.5 --play
# Type or paste text, then Ctrl+D
```

## Project Structure

```
piper-reader/
├── bin/           # Piper binary (gitignored)
├── voices/        # Voice models (gitignored)
├── src/           # Haskell source
│   ├── Config.hs
│   ├── CLI.hs
│   ├── TTS/
│   │   ├── Types.hs
│   │   └── Piper.hs
│   └── Content/
│       ├── File.hs
│       ├── Fetch.hs
│       └── Parser.hs
└── app/
    └── Main.hs
```

## Documentation

- **USAGE.md** - Complete usage guide with examples
- **VOICES.md** - Voice preview, download instructions, and language reference
- **NEXT_STEPS.md** - Future enhancements and TODOs

## License

MIT
