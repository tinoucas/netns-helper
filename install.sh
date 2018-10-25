#!/bin/sh

PREFIX="$(echo "$1" | sed 's#^\(.*\)/$#\1#')"

find usr etc -type f | while read FILE
do
	install -v -D $FILE -t $PREFIX/$(dirname $FILE)
done

systemctl daemon-reload
