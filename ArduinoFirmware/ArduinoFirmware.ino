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
const int analogInPin0 = 0;
const int analogInPin1 = 1;
const int analogInPin2 = 2;
const int analogInPin3 = 3;
const int analogInPin4 = 4;
const int analogInPin5 = 5;

const int measurements = 5;

int sensorValue0[5];
int sensorValue1[5];
int sensorValue2[5];
int sensorValue3[5];
int sensorValue4[5];
int sensorValue5[5];

int i,j,done,temp;

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600); 
}

void loop() {
  // read the analog in value 5 times:
  
  for (i=0;i<=measurements;i++){
    analogRead(analogInPin0);
    delay (10);
    sensorValue0[i] = analogRead(analogInPin0);
    delay (10);

    analogRead(analogInPin1);
    delay (10);
    sensorValue1[i] = analogRead(analogInPin1);
    delay (10);

    analogRead(analogInPin2);
    delay (10);
    sensorValue2[i] = analogRead(analogInPin2);            
    delay (10);

    analogRead(analogInPin3);
    delay (10);
    sensorValue3[i] = analogRead(analogInPin3);            
    delay (10);

    analogRead(analogInPin4);
    delay (10);
    sensorValue4[i] = analogRead(analogInPin4);            
    delay (10);

    analogRead(analogInPin5);
    delay (10);
    sensorValue5[i] = analogRead(analogInPin5);
    delay (10);
  }

// SORT Array to build the median

    done = 0;                // flag to know when we're done sorting              
    while(done != 1){        // simple swap sort, sorts numbers from lowest to highest
      done = 1;
        for (j = 0; j <= measurements; j++){
          if (sensorValue0[j] > sensorValue0[j + 1]){     // numbers are out of order - swap
            temp = sensorValue0[j + 1];
            sensorValue0 [j+1] =  sensorValue0[j] ;
            sensorValue0 [j] = temp;
            done = 0;
           }
        }
     }

    done = 0;                // flag to know when we're done sorting              
    while(done != 1){        // simple swap sort, sorts numbers from lowest to highest
      done = 1;
        for (j = 0; j <= 5; j++){
          if (sensorValue1[j] > sensorValue1[j + 1]){     // numbers are out of order - swap
            temp = sensorValue1[j + 1];
            sensorValue1 [j+1] =  sensorValue1[j] ;
            sensorValue1 [j] = temp;
            done = 0;
           }
        }
     }
    done = 0;                // flag to know when we're done sorting              
    while(done != 1){        // simple swap sort, sorts numbers from lowest to highest
      done = 1;
        for (j = 0; j <= 5; j++){
          if (sensorValue2[j] > sensorValue2[j + 1]){     // numbers are out of order - swap
            temp = sensorValue2[j + 1];
            sensorValue2 [j+1] =  sensorValue2[j] ;
            sensorValue2 [j] = temp;
            done = 0;
           }
        }
     }
    done = 0;                // flag to know when we're done sorting              
    while(done != 1){        // simple swap sort, sorts numbers from lowest to highest
      done = 1;
        for (j = 0; j <= 5; j++){
          if (sensorValue3[j] > sensorValue3[j + 1]){     // numbers are out of order - swap
            temp = sensorValue3[j + 1];
            sensorValue3 [j+1] =  sensorValue3[j] ;
            sensorValue3 [j] = temp;
            done = 0;
           }
        }
     }
    done = 0;                // flag to know when we're done sorting              
    while(done != 1){        // simple swap sort, sorts numbers from lowest to highest
      done = 1;
        for (j = 0; j <= 5; j++){
          if (sensorValue4[j] > sensorValue4[j + 1]){     // numbers are out of order - swap
            temp = sensorValue4[j + 1];
            sensorValue4 [j+1] =  sensorValue4[j] ;
            sensorValue4 [j] = temp;
            done = 0;
           }
        }
     }
    done = 0;                // flag to know when we're done sorting              
    while(done != 1){        // simple swap sort, sorts numbers from lowest to highest
      done = 1;
        for (j = 0; j <= 5; j++){
          if (sensorValue5[j] > sensorValue5[j + 1]){     // numbers are out of order - swap
            temp = sensorValue5[j + 1];
            sensorValue5 [j+1] =  sensorValue5[j] ;
            sensorValue5 [j] = temp;
            done = 0;
           }
        }
     }

  
  // Send middle field of array to serial. It's the median.
  
  Serial.print("A0\t");
  Serial.println(sensorValue0[2]);      
  Serial.print("A1\t");
  Serial.println(sensorValue1[2]);      
  Serial.print("A2\t");
  Serial.println(sensorValue2[2]);      
  Serial.print("A3\t");
  Serial.println(sensorValue3[2]);      
  Serial.print("A4\t");
  Serial.println(sensorValue4[2]);      
  Serial.print("A5\t");
  Serial.println(sensorValue5[2]);
}
