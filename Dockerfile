FROM golang:alpine

# Add required packages
RUN apk add curl \
    git \
    git-flow \
    gcc \
    libc-dev \
    docker \
    fish

# Add oh-my-fish
RUN curl -L https://get.oh-my.fish > install &&\
    fish install --noninteractive

# Add plugins
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.55.2

EXPOSE 8080

ENTRYPOINT /usr/bin/fish
