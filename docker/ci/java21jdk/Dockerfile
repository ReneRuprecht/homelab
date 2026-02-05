FROM eclipse-temurin:21-jdk

RUN apt-get update && apt-get install -y \
    git \
    curl \
    bash \
    ca-certificates \
    make \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
RUN bash -c ". /root/.nvm/nvm.sh && \
    nvm install 24 && \
    nvm alias default 24"

ENV PATH="/root/.nvm/versions/node/v24.13.0/bin:$PATH"

WORKDIR /app

CMD ["bash"]
