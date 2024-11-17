# Use an official Node.js image
FROM node:16

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    g++ \
    libwebsockets-dev \
    libssl-dev \
    libuv1-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone the ttyd repository and build it
RUN git clone https://github.com/tsl0922/ttyd.git && \
    cd ttyd && \
    cmake . && \
    make && \
    make install

# Expose the default port that ttyd listens on (you can modify this based on Render's configuration)
EXPOSE 3000

# Run ttyd with bash (you can specify other commands to run inside the terminal)
CMD ["ttyd", "bash"]
