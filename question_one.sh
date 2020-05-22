#!/usr/bin

late_flights=0

grep GNV /ufrc/bsc4452/share/Class_Files/data/flights.May2017-Apr2018.csv | cut -f 16 -d ","   \
| while read i
do
if [ "$i" == "1.00" ]
then
late_flights=$((late_flights+1))
fi

echo "Late flights: $late_flights"
done
