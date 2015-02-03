=========================================
Prosta aplikacja WWW z wykorzystaniem Fig
=========================================

W tym przykładzie jest identyczna aplikacja jak w poprzednim.
Tutaj jednak konfigurację naszych kontenerów i połączenia między innymi
mamy zapisaną w specjalnym pliku ``fig.yml``.

Dzięki narzędziu `fig`_ w łatwy sposób możemy uruchomić i zarządzać naszą aplikacją.

.. _fig: http://www.fig.sh/

Instalujemy narzędzie ``fig``::

    pip install fig

Uruchamiamy skonfigurowane kontenery::

    fig up -d

Sprawdzamy ich działanie::

    curl -s http://127.0.0.1:9000/
