FROM mariadb:10.5.2-bionic

ENV LANG ru_RU.utf8

RUN apt-get update -y && \
	apt-get install -y locales locales-all && \
	rm -rf /var/lib/apt/lists/* && \
	localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8

