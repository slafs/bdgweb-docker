====================
Prosta aplikacja WWW
====================

W katalogu ``app`` znajduje się prosta aplikacja webowa (napisana w Pythonie z użyciem Flask).
Aplikacja podłącza się do bazy redis i zwiększa w niej licznik o nazwie ``counter``
za każdym żądaniem HTTP GET.

Założenie jest takie, że baza redis znajduje się na hoście o nazwie ``redis_host``.

Na początek zbudujemy obraz z naszą aplikacją::

    docker build -t slafs/bdgweb_app_08 app/

Następnie uruchamiamy kontener z bazą redis::

    docker run -d --name=redis_kontener redis

Później uruchamiamy kontener z aplikacją (pod nazwą ``aplikacja_www`` i podłączamy
go do kontera ``redis_kontener`` tak, by był on widoczny pod nazwą ``redis_host``.
Dodatkowo mapujemy port ``8080`` z kontenera na port ``9000`` na naszym hoście::

    docker run -d --name=aplikacja_www --link=redis_kontener:redis_host -p 9000:8080 slafs/bdgweb_app_08

Sprawdzamy czy nasz licznik się zwiększa popzez kilkukrotne wywołanie::

    curl -s http://127.0.0.1:9000/
