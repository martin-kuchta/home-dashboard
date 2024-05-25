FROM karsten13/magicmirror:fat

COPY config /opt/magic_mirror/config

RUN sudo apt update && sudo apt install -y python3-pip jq
RUN python3 -m pip install --break-system-packages --upgrade mmpm
RUN ~/.local/bin/mmpm -h
RUN jq ".MMPM_MAGICMIRROR_ROOT=\"/opt/magic_mirror\"" ~/.config/mmpm/mmpm-env.json > /tmp/mmpm-env.json && mv /tmp/mmpm-env.json ~/.config/mmpm/mmpm-env.json
RUN mkdir /opt/magic_mirror/modules
RUN ~/.local/bin/mmpm install -y MMM-Inspirobot
RUN sed -i "s/http:/https:/g" /opt/magic_mirror/modules/MMM-inspirobot/MMM-inspirobot.js
