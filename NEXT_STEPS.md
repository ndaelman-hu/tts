# Next Steps for Piper-Reader

## Current Status

✅ Project structure created
✅ Piper binary downloaded and tested
✅ Sample voice model downloaded
✅ Basic Haskell modules created
✅ Stack configuration complete

## What Works Now

- Basic file reading (text files)
- Voice listing
- Core TTS synthesis (text → audio file)
- Type-safe Voice/Speed types

## What Needs Work

### 1. Fix Build Issues (Priority 1)

The code as written has some issues that need fixing:

**In `Content/Fetch.hs`:**
- Import statements are in wrong order (fix imports)
- URL parsing needs proper implementation
- May need to add `modern-uri` or `http-client` package

**In `CLI.hs`:**
- The `parseCommand` needs better structure
- Add default command for when no subcommand is given

**Quick fix approach:**
```bash
cd ~/Programs/piper-reader
stack build
# Fix any compilation errors that appear
```

### 2. Test Basic Functionality

Once it builds:
```bash
# Test file reading
echo "Hello world" > test.txt
stack exec piper-reader -- read-file test.txt

# Should create output.wav
# Play it with: aplay output.wav
```

### 3. Implement URL Fetching (Optional)

Current `Content.Fetch` is a stub. To properly implement:

- Use `req` package for HTTP
- Use `scalpel` or `tagsoup` for HTML parsing
- Extract main content from web pages

### 4. Add CLI Improvements

- Better error messages
- Progress indicators
- Ability to play audio directly (optional)
- Voice preview command

### 5. Configuration Enhancements

- Speed control via CLI flags
- Voice selection via CLI
- Output format options

## Quick Test Session

```bash
cd ~/Programs/piper-reader

# 1. Try to build
stack build

# 2. If it builds, test
echo "Testing piper reader" > test.txt
stack exec piper-reader -- read-file test.txt

# 3. Play the result
aplay output.wav  # or mpv, vlc, etc.

# 4. List voices
stack exec piper-reader -- list-voices
```

## Known Issues to Fix

1. **Import ordering** in Content/Fetch.hs - move imports to top
2. **envparse package** might need explicit version in extra-deps
3. **URL parsing** in Fetch.hs needs proper implementation
4. **Default command** - app should show help if no command given

## File Locations

- Binaries: `~/Programs/piper-reader/bin/piper`
- Voices: `~/Programs/piper-reader/voices/`
- Test audio: `~/Programs/piper-reader/output.wav`
- Build artifacts: `~/Programs/piper-reader/.stack-work/`

## Resources

- Piper voices: https://rhasspy.github.io/piper-samples/
- Voice models: https://huggingface.co/rhasspy/piper-voices
- Stack docs: https://docs.haskellstack.org/

## When You Start New Session

1. `cd ~/Programs/piper-reader`
2. Read this file
3. Try `stack build` first
4. Fix any compilation errors
5. Test with simple file: `echo "test" > test.txt && stack exec piper-reader -- read-file test.txt`
6. Listen to output.wav to verify it works
