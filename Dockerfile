FROM alpine:3.7

RUN apk update && apk add --no-cache \
    git \
    git-fast-import \
    openssh \
    python3 \
    python3-dev \
    curl \
  && python3 -m ensurepip \
  && rm -r /usr/lib/python*/ensurepip \
  && pip3 install --upgrade pip setuptools \
  && rm -r /root/.cache \
  && rm -rf /var/cache/apk/*

RUN curl https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/requirements-docs.txt -o requirements.txt \
  && pip install -U -r requirements.txt

WORKDIR /docs

EXPOSE 3000

ENTRYPOINT ["mkdocs"]

CMD ["serve", "--dev-addr=0.0.0.0:3000", "--livereload"]
