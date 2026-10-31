#### Download the latest version of Node-exporter
`wget https://github.com/prometheus/node_exporter/releases/download/v1.12.1/node_exporter-1.12.1.linux-amd64.tar.gz`

#### Untar the downloaded file
`tar -xvzf node_exporter-1.12.1.linux-amd64.tar.gz`

#### Move the binary to a directory in your PATH
`cp node_exporter-1.12.1.linux-amd64/node_exporter /usr/bin`

#### Run the program
`node_exporter`
