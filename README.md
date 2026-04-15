# Piper-Reader

Privacy-focused local text-to-speech reader using Piper TTS and Haskell.

## Features

- 100% local processing (no cloud APIs)
- Type-safe Haskell implementation
- Read text files
- Read from URLs (planned)
- Multiple voice support
- Speed control

## Setup

### 1. Piper Binary (Already Done)
The Piper binary is already downloaded in `bin/`.

### 2. Voice Models (Already Done)
A sample voice is in `voices/en_US-lessac-medium.onnx`.

Download more voices from: https://huggingface.co/rhasspy/piper-voices/tree/main

### 3. Build

```bash
cd ~/Programs/piper-reader
cabal build
```

## Usage

### Read a text file
```bash
cabal run piper-reader -- read-file myfile.txt
```

### List available voices
```bash
cabal run piper-reader -- list-voices
```

### Interactive mode
```bash
cabal run piper-reader -- interactive
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

## Next Steps (TODOs)

See NEXT_STEPS.md for what needs to be implemented.

## License

MIT
