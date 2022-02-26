FROM golang:latest

COPY ./sources.list /etc/apt/
RUN apt-get update && apt-get install -y \
		neovim \
		python3 \
		python3-pip \
	&& rm -rf /var/lib/apt/lists/* \
	&& pip3 install --upgrade neovim \
	&& mkdir -p /root/.config/nvim \
	&& go get -u github.com/nsf/gocode \
	&& go get -u golang.org/x/tools/cmd/goimports

COPY ./init.vim /root/.config/nvim/

RUN ["nvim", "-u", "/root/.config/nvim/init.vim", "-e", "-c", "call dein#install()", "-c", "UpdateRemotePlugins", "-c", "q!", "hoge"]
