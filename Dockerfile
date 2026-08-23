FROM alpine:3.19

RUN apk add --no-cache \
    xvfb \
    x11vnc \
    xfce4 \
    xfce4-terminal \
    bash \
    python3 \
    git \
    dillo \
    && git clone --depth 1 https://github.com /opt/noVNC \
    && git clone --depth 1 https://github.com /opt/noVNC/utils/websockify \
    && ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html

EXPOSE 8080

ENV DISPLAY=:1
ENV RESOLUTION=1024x768x16

CMD Xvfb :1 -screen 0 $RESOLUTION & \
    sleep 2 && \
    xfce4-session & \
    x11vnc -display :1 -nopw -listen 127.0.0.1 -forever & \
    /opt/noVNC/utils/novnc_proxy --vnc 127.0.0.1:5900 --listen 8080
