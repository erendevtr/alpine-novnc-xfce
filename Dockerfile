FROM alpine:3.19

RUN apk add --no-cache \
    xvfb \
    x11vnc \
    xfce4 \
    xfce4-terminal \
    bash \
    firefox \
    novnc \
    websockify

EXPOSE 8080

ENV DISPLAY=:1
ENV RESOLUTION=1024x768x16
ENV MOZ_FORCE_DISABLE_E10S=1

CMD Xvfb :1 -screen 0 $RESOLUTION & \
    sleep 2 && \
    xfce4-session & \
    x11vnc -display :1 -nopw -listen 127.0.0.1 -forever & \
    websockify --web /usr/share/novnc/ 8080 127.0.0.1:5900
