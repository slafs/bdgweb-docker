==================
Izolacja kontenera
==================

Uruchom kontener::

    docker run -it ubuntu:14.04 bash

Wywołaj wewnątrz niego poniższe komendy::

    ip addr list

    rm -rf /sbin

    ip addr list

    exit

Drugie wywołanie ``ip addr list`` nie powinno zadziałać.

Sprawdź jakie ID otrzymał przed momentem stworzony kontener::

    $ docker ps -a | head -2

    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                        PORTS               NAMES
    dccd00a447c8        ubuntu:14.04        "bash"              43 seconds ago      Exited (130) 31 seconds ago                       jolly_hawking

Sprawdź co zmieniło się w tym kontenerze w stosunku do obrazu, z którego został utworzony (``ubuntu:14.04``)::

    docker diff dccd00a447c8

Następnie utwórz ponownie nowy kontener::

    docker run -it ubuntu:14.04 bash

I wydaj ponownie komendę ``ip addr list``.

Wszystko (a zwłaszcza katalog ``/sbin``) powinno być ponownie na swoim miejscu :).

