FROM cypress/included:15.17.0

RUN apt-get update && apt-get install -y \
    curl \
    iproute2 \
    docker-cli \
    docker-compose \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /e2e

CMD [ "cypress", "run" ]
