================================
Linkowanie (łączenie) kontenerów
================================

Utwórz kontener na podstawie oficjalnego obrazu ``redis`` i nazwij go ``redis_kontener``::

    docker run -d --name redis_kontener redis

Następnie stwórz kontener, w którym zainstalujemy narzędzie klienckie do połączenia z bazą redis::

    docker run -it --link redis_kontener:redis ubuntu:14.04 bash

Sprawdź, że wewnątrz kontenera masz dostęp do hosta o nazwie ``redis``::

    grep redis /etc/hosts
    ping -c 4 redis

i zainstaluj paczkę ``redis-tools``::

    apt-get update
    apt-get install -y redis-tools

i sprawdź możliwość połączenia z bazą::

    redis-cli -h redis

Wychodzimy::

    exit

Zapisujemy ostatnio stworzony kontener (jako obraz) pod nazwą ``slafs/bdgweb_redis_cli_test``,
do późniejszego użytku. Sprawdzamy ID kontenera::

    docker ps -a | head -2 | tail -1

    docker commit <ID> slafs/bdgweb_redis_cli_test

    docker images | grep "slafs/bdgweb_redis_cli_test"

    docker run -it --rm --link redis_kontener:redis slafs/bdgweb_redis_cli_test --help
