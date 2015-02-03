===================================
Tworzenie obrazu poprzez Dockerfile
===================================

Wykorzystujac pliki ``Dockerfile`` (trzeba znać kilka komend na krzyż)
możemy w łatwy i powtarzalny sposób tworzyć obrazy Docker.

W tym katalogu plik ``./Dockerfile`` pozwoli na wykonanie
tych samych kroków co z przykładu ``06``.

Obraz budujemy komendą::

    docker build --rm -t slafs/bdgweb_redis_cli_test .

``.`` oznacza, że cały kontekst obrazu znajduje się w obecnym katalogu. W nim
musi też być plik ``Dockerfile`` (Od Docker 1.5 można wskazać inny plik przez opcję ``-f``).

Zauważ, że przy drugim uruchomieniu cały proces trwa o wiele krócej.
To dzięki wbudowanemu cache'owaniu tych samych operacji.

By wymusić zbudowanie obrazu od nowa można użyć przłącznika ``--no-cache``::

    docker build --rm --no-cache -t slafs/bdgweb_redis_cli_test .
