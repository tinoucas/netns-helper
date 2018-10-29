#!/bin/sh

PREFIX="$(echo "$1" | sed 's#^\(.*\)/$#\1#')"

find usr etc -type f | while read FILE
do
	MODE=
	if [ -n "$(echo $FILE | grep .service)" ]; then
		MODE=0644
	else
		MODE=0755
	fi
	install -m $MODE -v -D $FILE -t $PREFIX/$(dirname $FILE)
done

systemctl daemon-reload
