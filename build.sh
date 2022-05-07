set -e
git clone https://github.com/OpenVoiceOS/ovos-core || true
git clone https://github.com/OpenVoiceOS/ovos-audio || true
git clone https://github.com/OpenVoiceOS/ovos-skills || true
git clone https://github.com/OpenVoiceOS/ovos-bus || true
git clone https://github.com/OpenVoiceOS/ovos-gui || true
git clone https://github.com/OpenVoiceOS/ovos-speech || true
git clone https://github.com/OpenVoiceOS/ovos_PHAL || true
docker build ./ovos-core -t ghcr.io/openvoiceos/core:dev
docker-compose build
