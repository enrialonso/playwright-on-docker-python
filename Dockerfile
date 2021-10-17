FROM ubuntu:focal

# Update repositories
RUN apt-get update

# Install latest Python
RUN apt-get install -y python3 python3-pip && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Install WebKit dependencies
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
    libwoff1 \
    libopus0 \
    libwebp6 \
    libwebpdemux2 \
    libenchant1c2a \
    libgudev-1.0-0 \
    libsecret-1-0 \
    libhyphen0 \
    libgdk-pixbuf2.0-0 \
    libegl1 \
    libnotify4 \
    libxslt1.1 \
    libevent-2.1-7 \
    libgles2 \
    libxcomposite1 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libepoxy0 \
    libgtk-3-0 \
    libharfbuzz-icu0

# Install gstreamer and plugins to support video playback in WebKit.
RUN apt-get install -y --no-install-recommends \
    libgstreamer-gl1.0-0 \
    libgstreamer-plugins-bad1.0-0 \
    gstreamer1.0-plugins-good \
    gstreamer1.0-libav

# Install Chromium dependencies
RUN apt-get install -y --no-install-recommends \
    libnss3 \
    libxss1 \
    libasound2 \
    fonts-noto-color-emoji \
    libxtst6

# Install Firefox dependencies
RUN apt-get install -y --no-install-recommends libdbus-glib-1-2 libxt6

# Install ffmpeg to bring in audio and video codecs necessary for playing videos in Firefox.
RUN apt-get install -y --no-install-recommends ffmpeg libffi-dev

# (Optional) Install XVFB if there's a need to run browsers in headful mode
RUN apt-get install -y --no-install-recommends xvfb

# Source dir for our scripts
RUN mkdir src

# Set working dir
WORKDIR src

# Add dependencies for the scripts
COPY requirements.txt /

# Add source code for the script to be executed
COPY main.py .

# Install our dependencies
RUN pip install playwright
RUN playwright install
RUN pip install -r /requirements.txt

# Execute our scripts inside the container
# Important: if you need run headless=True run command with xvfb-run
ENTRYPOINT xvfb-run python main.py