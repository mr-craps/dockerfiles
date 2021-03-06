OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

if [[ "${ARCH}" == "x86_64" ]]; then
    ARCH=amd64
elif [[ "${ARCH}" == "aarch64" ]]; then
    ARCH=arm64
else
    ARCH=arm
fi

echo "os: ${OS}, arch: ${ARCH}"

apt-get update && apt-get install -y curl unzip

curl -o consul.zip https://releases.hashicorp.com/consul/${VERSION}/consul_${VERSION}_${OS}_${ARCH}.zip && \
    unzip consul.zip
