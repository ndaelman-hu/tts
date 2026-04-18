# Voice Models Reference

Complete guide to previewing, downloading, and using voice models with Piper-Reader.

## Quick Links

- **Preview all voices:** https://rhasspy.github.io/piper-samples/
- **Browse catalog:** https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0
- **Piper documentation:** https://github.com/rhasspy/piper

## Currently Installed Voices

Check what voices you have:
```bash
cabal run piper-reader -- list-voices
```

Default installation includes:
- `en_US-bryce-medium` (English - US)
- `es_ES-davefx-medium` (Spanish - Spain)
- `es_MX-claude-high` (Spanish - Mexico)

## How to Preview Voices

Visit https://rhasspy.github.io/piper-samples/ to:
- Listen to audio samples of all available voices
- Compare different speakers, accents, and languages
- All samples read the same text for easy comparison

## Popular Voice Downloads

Copy-paste these commands to download popular voices. All commands assume you're in the project root.

### English

#### United States
```bash
# en_US-amy-medium (Female)
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/medium/en_US-amy-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/amy/medium/en_US-amy-medium.onnx.json

# en_US-ryan-high (Male)
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/high/en_US-ryan-high.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/ryan/high/en_US-ryan-high.onnx.json
```

#### British English
```bash
# en_GB-alan-medium (Male)
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/medium/en_GB-alan-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/medium/en_GB-alan-medium.onnx.json
```

### Spanish

#### Spain
```bash
# es_ES-sharvard-medium
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/sharvard/medium/es_ES-sharvard-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/sharvard/medium/es_ES-sharvard-medium.onnx.json
```

#### Mexico
```bash
# es_MX-ald-medium
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_MX/ald/medium/es_MX-ald-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_MX/ald/medium/es_MX-ald-medium.onnx.json
```

### French
```bash
# fr_FR-siwis-medium
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/medium/fr_FR-siwis-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/siwis/medium/fr_FR-siwis-medium.onnx.json

# fr_FR-upmc-medium
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/upmc/medium/fr_FR-upmc-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/fr/fr_FR/upmc/medium/fr_FR-upmc-medium.onnx.json
```

### German
```bash
# de_DE-thorsten-medium (Male)
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/medium/de_DE-thorsten-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/thorsten/medium/de_DE-thorsten-medium.onnx.json

# de_DE-eva_k-x_low (Female)
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/eva_k/x_low/de_DE-eva_k-x_low.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/de/de_DE/eva_k/x_low/de_DE-eva_k-x_low.onnx.json
```

### Italian
```bash
# it_IT-riccardo-x_low
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/it/it_IT/riccardo/x_low/it_IT-riccardo-x_low.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/it/it_IT/riccardo/x_low/it_IT-riccardo-x_low.onnx.json
```

### Portuguese

#### Brazil
```bash
# pt_BR-faber-medium
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/pt/pt_BR/faber/medium/pt_BR-faber-medium.onnx.json
```

### Russian
```bash
# ru_RU-dmitri-medium
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/dmitri/medium/ru_RU-dmitri-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ru/ru_RU/dmitri/medium/ru_RU-dmitri-medium.onnx.json
```

### Chinese
```bash
# zh_CN-huayan-medium
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/medium/zh_CN-huayan-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/zh/zh_CN/huayan/medium/zh_CN-huayan-medium.onnx.json
```

### Japanese
```bash
# ja_JP-hikari-medium
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ja/ja_JP/hikari/medium/ja_JP-hikari-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ja/ja_JP/hikari/medium/ja_JP-hikari-medium.onnx.json
```

### Arabic
```bash
# ar_JO-kareem-medium
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ar/ar_JO/kareem/medium/ar_JO-kareem-medium.onnx
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/ar/ar_JO/kareem/medium/ar_JO-kareem-medium.onnx.json
```

## Voice Naming Convention

Voice filenames follow this pattern:
```
{language}_{region}-{voice_name}-{quality}.onnx
```

Examples:
- `en_US-bryce-medium.onnx` - English (US), speaker "Bryce", medium quality
- `es_MX-claude-high.onnx` - Spanish (Mexico), speaker "Claude", high quality
- `fr_FR-siwis-medium.onnx` - French (France), speaker "Siwis", medium quality

## Quality Levels

| Quality | File Size | Speed | Use Case |
|---------|-----------|-------|----------|
| `x_low` | ~10-20MB | Fastest | Testing, prototyping |
| `low` | ~20-40MB | Fast | Quick playback |
| `medium` | ~60MB | ⭐ Balanced | **Recommended for most uses** |
| `high` | ~80-100MB | Slower | Best audio quality |

## Using Downloaded Voices

### With Language Code
```bash
# Automatically uses first matching voice for that language
cabal run piper-reader -- read-file document.txt --lang fr --play
```

### With Specific Voice
```bash
# Use exact voice file
cabal run piper-reader -- read-file document.txt \
  --voice voices/fr_FR-siwis-medium.onnx \
  --play
```

### List Installed Voices
```bash
cabal run piper-reader -- list-voices
# Output shows: voice-name (Language: code)
```

## Supported Languages (35+)

Piper supports the following languages:

- **Arabic** (ar) - Multiple dialects
- **Catalan** (ca)
- **Czech** (cs)
- **Danish** (da)
- **German** (de)
- **Greek** (el)
- **English** (en) - US, GB, and more
- **Spanish** (es) - Spain, Mexico, Argentina
- **Finnish** (fi)
- **French** (fr)
- **Hungarian** (hu)
- **Icelandic** (is)
- **Italian** (it)
- **Georgian** (ka)
- **Kazakh** (kk)
- **Luxembourgish** (lb)
- **Nepali** (ne)
- **Dutch** (nl)
- **Norwegian** (no)
- **Polish** (pl)
- **Portuguese** (pt) - Brazil, Portugal
- **Romanian** (ro)
- **Russian** (ru)
- **Serbian** (sr)
- **Swedish** (sv)
- **Swahili** (sw)
- **Turkish** (tr)
- **Ukrainian** (uk)
- **Vietnamese** (vi)
- **Chinese** (zh)
- **Japanese** (ja)
- **Korean** (ko)
- And more...

Full list with samples: https://rhasspy.github.io/piper-samples/

## Download URL Structure

All voices are hosted on HuggingFace:
```
https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/{lang}/{locale}/{voice}/{quality}/{filename}
```

**Example breakdown for French:**
```
https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/
  fr/                    # Language code
  fr_FR/                 # Locale (France)
  siwis/                 # Voice name
  medium/                # Quality level
  fr_FR-siwis-medium.onnx  # File
```

**Remember:** Always download BOTH files:
- `{voice}.onnx` - The neural network model
- `{voice}.onnx.json` - Configuration file

## Disk Space Planning

| Voices | Quality | Approximate Size |
|--------|---------|-----------------|
| 1 voice | medium | ~60MB |
| 5 voices | medium | ~300MB |
| 10 voices | medium | ~600MB |
| 20 voices | medium | ~1.2GB |

## Tips

1. **Start with medium quality** - Best balance of quality and file size
2. **Preview before downloading** - Use https://rhasspy.github.io/piper-samples/
3. **Download regional variants** - Compare es_ES vs es_MX for Spanish, en_US vs en_GB for English
4. **Keep .json files** - Both .onnx and .onnx.json are required for each voice
5. **Organize by language** - Use `list-voices` to see what you have installed

## Troubleshooting

**Missing .json file:**
```bash
# Download the matching .json file for your voice
wget -P voices https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/{path}/{voice}.onnx.json
```

**Voice not detected:**
```bash
# Check if files are in voices/ directory
ls -lh voices/

# Ensure both .onnx and .onnx.json exist
```

**404 error when downloading:**
- Check the voice name spelling
- Verify the quality level exists for that voice
- Browse the catalog: https://huggingface.co/rhasspy/piper-voices/tree/v1.0.0
