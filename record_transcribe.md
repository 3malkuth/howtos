## Record & Transcribe Audio

### ffmpeg

Install on ubuntu:
```
sudo apt update && sudo apt install ffmpeg
```

Record a conversation:
```
ffmpeg -f pulse -i "$(awk '$2~/.monitor$/ {print $2; exit;}' <(pactl list short sources))" -i <(arecord -f CD) -filter_complex amix -acodec libmp3lame "$(date +%y_%m_%d__%H_%M_%S)".mp3
```

References:
- https://askubuntu.com/questions/1316606/recording-phone-calls-in-ubuntu-20-04-not-just-skype

### whisper

* https://github.com/m-bain/whisperX
* https://github.com/openai/whisper
