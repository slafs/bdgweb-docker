=========================================
Prosta aplikacja WWW z wykorzystaniem Fig
=========================================

W tym przykładzie jest identyczna aplikacja jak w poprzednim.
Tutaj również użyjemy narzędzia `fig`_.

.. _fig: http://www.fig.sh/

Dodatkowo nałożymy na naszą aplikacje warstwę pośredniczącą (proxy) w postaci
load balancera HAProxy.

Dla prostoty przykładu konfiguracja HAProxy ma "na sztywno" wpisaną listę 254 możliwych
adresów konterów, do których może się połączyć. Istnieje wiele narzędzi do dynamicznego
dynamicznego wczytania konfiguracji lub odkrywania serwisów w sieci np. `etcd`_ lub `serf`_

.. _etcd: https://coreos.com/using-coreos/etcd/
.. _serf: https://www.serfdom.io/

ale ich omówienie wykracza poza ten przykład.

Ciekawą właściwością fig'a jest możliwość skalowania kontenerów do konkretnej ilości.
Uruchom kontenery zadeklarowane w ``fig.yml`` poprzez::

    fig up -d

Sprawdź, że jeden kontener (host) naszej aplikacji jest pod kontrolą kontenera HAProxy.
Uruchom w przeglądarce adres http://127.0.0.1:9000/stats

Nasza aplikacja tak jak do tej pory powinna być dostępna pod adresem http://127.0.0.1:9000/.
Odśwież ją kilka razy. Licznik powinien się zwiększać.

Uruchom 4 dodatkowe kontenery przez fig poleceniem::

    fig scale app=5

Ponownie sprawdź statystyki HAProxy (http://127.0.0.1:9000/stats) oraz
naszą aplikację (http://127.0.0.1:9000/). Tym razem string z nazwą hosta powinien
się zmieniać (dzięki load balancerowi) w czasie kiedy odświeżasz stronę (licznik również)
