#!/bin/bash

ADDR='192.168.0.101'
PORT='9123'

#0..100
BRIGHTNESS=50

#2900..7000 - 143..344
TEMPERATURE=200


lamp_on() 
{
curl -s -X PUT http://$ADDR:$PORT/elgato/lights -H "Content-Type: application/json"  -d "{\"numberOfLights\": 1, \"lights\": [{ \"on\": 1}]}" > /dev/null
}


lamp_off() 
{
curl -s -X PUT http://$ADDR:$PORT/elgato/lights -H "Content-Type: application/json"  -d "{\"numberOfLights\": 1, \"lights\": [{\"on\": 0}]}" > /dev/null
}


lamp_brightness_set() 
{
# echo -n "brightness: " $BRIGHTNESS
 curl -s -X PUT http://$ADDR:$PORT/elgato/lights -H "Content-Type: application/json"  -d "{\"numberOfLights\": 1, \"lights\": [{\"brightness\": $BRIGHTNESS}]}" > /dev/null
}


lamp_temperature_set() 
{
# echo -n "temperature: " $TEMPERATURE
 curl -s -X PUT http://$ADDR:$PORT/elgato/lights -H "Content-Type: application/json"  -d "{\"numberOfLights\": 1, \"lights\": [{\"temperature\": $TEMPERATURE}]}" > /dev/null
}


greeting()
{
  echo 'q - quit\n'
  echo 'z - on\n'
  echo 'x - off\n'

  echo '8 - brighter\n'
  echo '2 - darker\n'

  echo '4 - decrease temperature\n'
  echo '6 - increase temperature\n'

}


greeting

while true; do
read -rsn1 input


if [ "$input" = "q" ]; then
   exit 0;
fi


if [ "$input" = "z" ]; then
   lamp_on
fi



if [ "$input" = "8" ]; then
   if [ "$BRIGHTNESS" -lt 100 ]; then
      ((BRIGHTNESS++))
   fi
   lamp_brightness_set
fi


if [ "$input" = "2" ]; then
   if [ "$BRIGHTNESS" -gt 0 ]; then
      ((BRIGHTNESS--))
   fi
   lamp_brightness_set 
fi


if [ "$input" = "4" ]; then
   if [ "$TEMPERATURE" -gt 143 ]; then
      ((TEMPERATURE--))
   fi
   lamp_temperature_set 
fi


if [ "$input" = "6" ]; then
   if [ "$TEMPERATURE" -lt 344 ]; then
      ((TEMPERATURE++))
   fi

   lamp_temperature_set 
fi


if [ "$input" = "x" ]; then
   lamp_off
fi


done