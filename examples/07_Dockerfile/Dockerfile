# wybieramy obraz bazowy
FROM ubuntu:14.04

# pokazujemy kto tu rządzi :)
MAINTAINER Jan Kowalski <foo@bar.pl>

# szereg instrukcji
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y -q redis-tools

# podstawowa komenda
ENTRYPOINT ["redis-cli"]

# domyślne argumenty
CMD ["-h", "redis"]
