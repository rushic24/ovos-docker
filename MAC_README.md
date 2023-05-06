# This repository is specifically intended for debugging OVOS on macOS only.


## Optional automated script to perform the steps described below
```
sed -i '' "s/#load-module module-native-protocol-tcp/load-module module-native-protocol-tcp/" /opt/homebrew/Cellar/pulseaudio/14.2/etc/pulse/default.pa

mkdir -p ~/run/user/1000

export XDG_RUNTIME_DIR_OLD=$(echo $XDG_RUNTIME_DIR)

export XDG_RUNTIME_DIR=~/run/user/1000

brew services restart pulseaudio

# Inside the ovos-docker repo folder
sed -i '' "s/XDG_RUNTIME_DIR=/run/user/1000/XDG_RUNTIME_DIR=~/run/user/1000/" .env

docker compose -f docker-compose-mac.yml --env-file .env up -d
```

--- 

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


