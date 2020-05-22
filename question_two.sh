#!/usr/bin

ATL_flights=0
CLT_flights=0
MIA_flights=0

grep GNV /ufrc/bsc4452/share/Class_Files/data/flights.May2017-Apr2018.csv | cut -f 7 -d "," > flight.txt

while read i
do
  if [ "$i" == '"ATL"' ]
   then
    ATL_flights=$((ATL_flights+1))
  fi
  if [ "$i" == '"CLT"' ]
   then
    CLT_flights=$((CLT_flights+1))
  fi
  if [ "$i" == '"MIA"' ]
   then
    MIA_flights=$((MIA_flights+1))
  fi
done <flight.txt
echo "ATL Flights: $ATL_flights"
echo "CLT Flights: $CLT_flights"
echo "MIA Flights: $MIA_flights"
