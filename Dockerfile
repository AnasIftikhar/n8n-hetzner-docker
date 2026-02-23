FROM n8nio/n8n:2.9.1

USER root

RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    curl \
    wget \
    unzip \
    fontconfig \
    python3 \
    python3-pip && \
    pip3 install yt-dlp --break-system-packages && \
    wget -q "https://github.com/google/fonts/raw/main/ofl/montserrat/Montserrat-Bold.ttf" \
    -O /usr/share/fonts/Montserrat-Bold.ttf && \
    fc-cache -fv && \
    mkdir -p /data/videos && \
    chmod 777 /data/videos && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER node
