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


ATL_arriv_delay=0

grep GNV /ufrc/bsc4452/share/Class_Files/data/flights.May2017-Apr2018.csv | awk 'BEGIN {FS=","} {print $7,$13,$16,$24}' | grep -E 'ATL' | awk '{print $3}' > ATL_arriv_delay.txt

while read i
do
if [ "$i" == "1.00" ]
then
ATL_arriv_delay=$((ATL_arriv_delay+1))
fi
done < ATL_arriv_delay.txt

echo "15 min Arrival Delay to ATL: $ATL_arriv_delay"

CLT_arriv_delay=0

grep GNV /ufrc/bsc4452/share/Class_Files/data/flights.May2017-Apr2018.csv | awk 'BEGIN {FS=","} {print $7,$13,$16,$24}' | grep -E 'CLT' | awk '{print $3}' > CLT_arriv_delay.txt

while read i
do
if [ "$i" == "1.00" ]
then
CLT_arriv_delay=$((CLT_arriv_delay+1))
fi
done < CLT_arriv_delay.txt

echo "15 min Arrival Delay to CLT: $CLT_arriv_delay"

MIA_arriv_delay=0

grep GNV /ufrc/bsc4452/share/Class_Files/data/flights.May2017-Apr2018.csv | awk 'BEGIN {FS=","} {print $7,$13,$16,$24}' | grep -E 'MIA' | awk '{print $3}' > MIA_arriv_delay.txt

while read i
do
if [ "$i" == "1.00" ]
then
MIA_arriv_delay=$((MIA_arriv_delay+1))
fi
done < MIA_arriv_delay.txt

echo "15 min Arrival Delay to MIA: $MIA_arriv_delay"


ATL_weather=0

grep GNV /ufrc/bsc4452/share/Class_Files/data/flights.May2017-Apr2018.csv | awk 'BEGIN {FS=","} {print $7,$13,$16,$24}' | grep -E 'ATL' | awk '{print $4}' | grep -E [^0.00] > ATL_weather.txt

while read i
do
if [ "$i" != "0.00" ]
then
ATL_weather=$((ATL_weather+1))
fi
done < ATL_weather.txt

echo "Weather Delay to ATL: $ATL_weather"

CLT_weather=0

grep GNV /ufrc/bsc4452/share/Class_Files/data/flights.May2017-Apr2018.csv | awk 'BEGIN {FS=","} {print $7,$13,$16,$24}' | grep -E 'CLT' | awk '{print $4}' | grep -E [^0.00] > CLT_weather.txt

while read i
do
if [ "$i" != "0.00" ]
then
CLT_weather=$((CLT_weather+1))
fi
done < CLT_weather.txt

echo "Weather Delay to CLT: $CLT_weather"

MIA_weather=0

grep GNV /ufrc/bsc4452/share/Class_Files/data/flights.May2017-Apr2018.csv | awk 'BEGIN {FS=","} {print $7,$13,$16,$24}' | grep -E 'MIA' | awk '{print $4}' | grep -E [^0.00] > MIA_weather.txt

while read i
do
if [ "$i" != "0.00" ]
then
MIA_weather=$((MIA_weather+1))
fi
done < MIA_weather.txt

echo "Weather Delay to MIA: $MIA_weather"
