source <(gcloud storage cat gs://spls/gsp318/script.sh)
gcloud storage cp gs://spls/gsp318/valkyrie-app.tgz .
tar -xzf valkyrie-app.tgz
cd valkyrie-app
FROM golang:1.10
WORKDIR /go/src/app
COPY source .
RUN go install -v
ENTRYPOINT ["app","-single=true","-port=8080"]
docker images
gcloud auth configure-docker Region-docker.pkg.dev
