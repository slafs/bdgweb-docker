==================
Wolumeny (Volumes)
==================

Utwórz kontener i zamontuj katalog z hosta wewnątrz kontenera::

    docker run -it -v $PWD/przyklad:/mojwolumen ubuntu:14.04 bash

Wewnątrz kontenera zmodyfikuj plik z katalogu ``przyklad``::

    cat /mojwolumen/hello.txt
    echo "world2!" >> /mojwolumen/hello.txt
    cat /mojwolumen/hello.txt
    exit

Sprawdź, że również z poziomu hosta plik jest zmodyfikowany::

    cat ./przyklad/hello.txt

