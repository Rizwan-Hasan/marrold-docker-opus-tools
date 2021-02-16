
# marrold-opus-tools

marrold-opus-tools is a basic docker image containing the [opus-tools](https://opus-codec.org/release/dev/2018/09/18/opus-tools-0_2.html) binaries for working with opus.

## Info

The image is based on [debian:buster-slim](https://hub.docker.com/_/debian) and the current opus-tools version is 0.2

The image is currently only available for the `amd64` architecture.

The script for installing opus-tools was created by [nottt](https://gist.github.com/Nottt/f55dd79ca235d8add67423a76b304961)

## Example Usage

The intended usage is to mount a directory of PCAP files and then execute bash, so you can then extract the opus and use `opusinfo` to get information on the stream(s).

`docker run -it -v ~/opus-pcaps/:/opt marrold/marrold-opus-tools bash`

opusrtp cannot handle PCAPs with VLAN tags so you can remove them first with tcprewrite which is included:

````
tcprewrite --enet-vlan=del --infile=input.pcap --outfile=output.pcap
````

## License

This Dockerfile is licensed under the terms of the _MIT license_. For other dependencies such as opus and opus-tools, please see their relevant licenses.

