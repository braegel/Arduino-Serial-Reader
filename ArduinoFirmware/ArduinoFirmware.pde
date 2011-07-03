/*
  Analog input, analog output, serial output
 
 Reads an analog input pin, maps the result to a range from 0 to 255
 and uses the result to set the pulsewidth modulation (PWM) of an output pin.
 Also prints the results to the serial monitor.
 
 The circuit:
 * potentiometer connected to analog pin 0.
   Center pin of the potentiometer goes to the analog pin.
   side pins of the potentiometer go to +5V and ground
 * LED connected from digital pin 9 to ground
 
 created 29 Dec. 2008
 Modified 4 Sep 2010
 by Tom Igoe
 
 This example code is in the public domain.
 
 */

// These constants won't change.  They're used to give names
// to the pins used:
const int analogInPin0 = A0;
const int analogInPin1 = A1;
const int analogInPin2 = A2;
const int analogInPin3 = A3;
const int analogInPin4 = A4;
const int analogInPin5 = A5;

int sensorValue0 = 0;
int sensorValue1 = 0;
int sensorValue2 = 0;
int sensorValue3 = 0;
int sensorValue4 = 0;
int sensorValue5 = 0;

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600); 
}

void loop() {
  // read the analog in value:
  sensorValue0 = analogRead(analogInPin0);            
  sensorValue1 = analogRead(analogInPin1);            
  sensorValue2 = analogRead(analogInPin2);            
  sensorValue3 = analogRead(analogInPin3);            
  sensorValue4 = analogRead(analogInPin4);            
  sensorValue5 = analogRead(analogInPin5);            
  Serial.print("A0\t");
  Serial.println(sensorValue0);      
  Serial.print("A1\t");
  Serial.println(sensorValue1);      
  Serial.print("A2\t");
  Serial.println(sensorValue2);      
  Serial.print("A3\t");
  Serial.println(sensorValue3);      
  Serial.print("A4\t");
  Serial.println(sensorValue4);      
  Serial.print("A5\t");
  Serial.println(sensorValue5);      
  // wait 10 milliseconds before the next loop
  // for the analog-to-digital converter to settle
  // after the last reading:
  delay(10);                     
}
