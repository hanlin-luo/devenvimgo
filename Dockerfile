FROM golang

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	apt-get update && apt-get install -y \
		neovim \
	&& rm -rf /var/lib/apt/lists/* \
	&& pip3 install --upgrade neovim \
	&& mkdir -p /root/.config/nvim \
	&& go get -u github.com/nsf/gocode \
	&& go get -u golang.org/x/tools/cmd/goimports

COPY ./init.vim /root/.config/nvim/

RUN ["nvim", "-u", "/root/.config/nvim/init.vim", "-e", "-c", "call dein#install()", "-c", "UpdateRemotePlugins", "-c", "q!", "hoge"]