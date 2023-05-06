# This repo is exclusive to debug ovos on mac

```
# delete ~/.config/pulse and /opt/homebrew/etc/pulse before
brew install pulseaudio
```

```
# uncomment in /opt/homebrew/Cellar/pulseaudio/14.2/etc/pulse/default.pa
load-module module-native-protocol-tcp
```

```
brew services start pulseaudio
```

```
mkdir -p ~/run/user/1000
```

```
source .env
docker compose -f docker-compose.yml --env-file .env --env-file up -d
docker exec -ti ovos_cli ovos-speak "hello world"    
```