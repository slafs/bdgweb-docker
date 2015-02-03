============================
Tworzenie obrazu z kontenera
============================

Wewnątrz kontenera utwórz plik i zapamiętaj ID kontenera::

    CID=$( docker run -d ubuntu:14.04 bash -c 'echo "hello world" > /test.txt' )

Zapisz stan kontenera jako osobny obraz::

    docker commit $CID slafs/bdgweb_test_image:latest

Sprawdż, że obraz poprawnie został zapisany::

    docker images | grep bdgweb

Utwórz nowy kontener na podstawie wyżej stworzonego obrazu i sprawdź, że wcześniej stworzony plik już tam jest::

    NCID=$( docker run -d slafs/bdgweb_test_image cat /test.txt )

Posprzątaj po sobie :) i usuń kontenery::

    docker rm $CID
    docker rm $NCID

oraz obraz::

    docker rmi slafs/bdgweb_test_image:latest

