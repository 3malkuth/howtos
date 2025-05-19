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

Install whisper:
```
mkdir whisperx
cd whisperx
pipenv install git+https://github.com/openai/whisper.git

OR

pipenv install git+https://github.com/openai/whisper.git
```

Upgrade whisper:
```
cd whisperx
pipenv install --upgrade --no-deps --force-reinstall git+https://github.com/openai/whisper.git
pipenv shell
whisper file_name.mp3 --model turbo # wav and flac are also supported
whisper file_name.mp3 --model turbo --device cpu # in case you run out of memory on your card
whisper file_name.mp3 --language German
```

References:
- https://github.com/openai/whisper
- https://github.com/m-bain/whisperX

### whishper.net

Dependencies:
```
sudo apt install docker
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
```

Docker:
```
# In order to avoid using sudo for docker you need to run the following commands
# sudo usermod -aG docker your-desktop-username
# newgrp docker # activates change without having to login and out
```

Install whishper:
```
mkdir whishper
cd whishper
curl -fsSL -o get-whishper.sh https://raw.githubusercontent.com/pluja/whishper/main/get-whishper.sh
bash get-whishper.sh
```

Run and stop whishper:
```
docker-compose -f docker-compose.yml up
docker-compose -f docker-compose.yml down --remove-orphans
```

Access:
- http://localhost:8082

References:
- https://documentation.ubuntu.com/server/how-to/graphics/install-nvidia-drivers/index.html
- https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#linux-distributions
- https://whishper.net/guides/install/
