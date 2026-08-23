# Ultra-Lightweight Alpine XFCE4 noVNC Desktop

A highly optimized, ultra-lightweight VNC desktop environment running Alpine Linux, XFCE4, and Firefox. Designed specifically to run smoothly on low-resource cloud platforms like Railway and Render without causing high CPU/RAM usage spikes.

## Features
- **No Git Clone inside Dockerfile:** Uses native Alpine packages for maximum stability and speed during builds.
- **Resource Optimized:** Configured at 1024x768x16 resolution to keep RAM and CPU footprints minimal.
- **Cloud Ready:** Built-in compatibility with dynamic port binding used by cloud providers.

---

## Deployment Guide

### 1. Railway Deployment

1. Create a new project on **Railway** and connect this GitHub repository.
2. Go to your service **Variables** tab.
3. Add a new variable:
   - **Key:** `PORT`
   - **Value:** `8080`
4. Go to the **Settings** tab, scroll down to the **Networking** section, and click **Generate Domain**.
5. Once deployed, access your desktop by visiting:
   `https://railway.app`

### 2. Render Deployment

1. Create a new **Web Service** on **Render** and connect this GitHub repository.
2. Select **Docker** as the Runtime environment.
3. Scroll down to **Advanced Settings** and add an Environment Variable:
   - **Key:** `PORT`
   - **Value:** `8080`
4. Render will automatically detect `EXPOSE 8080` and bind its public URL to this port.
5. Once the build is complete, access your desktop by visiting:
   `https://onrender.com`

---

## How to Connect
1. Open the generated public URL in your browser.
2. **Crucial:** Make sure to append `/vnc.html` to the end of the URL.
3. Click the blue **Connect** button. No password is required as the cloud provider secures the connection via HTTPS.
4. Launch Firefox via the terminal (`firefox`) or through the application menu on the bottom-left corner.
