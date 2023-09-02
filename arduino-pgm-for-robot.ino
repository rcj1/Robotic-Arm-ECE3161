#include <Servo.h>
int counter = 9;
Servo base_servo;
Servo arm2_servo;
Servo arm1_servo; 
Servo gripper_servo;

void setup() {
Serial.begin(9600);
base_servo.attach(9); 
arm2_servo.attach(10); 
arm1_servo.attach(11); 
gripper_servo.attach(6);
}

void loop() {
  if (Serial.available() > 0) {
    // read the incoming byte:
    int incomingByte = Serial.read();
    if (counter == 9) base_servo.write(incomingByte); // move arm into position
    if (counter == 10) arm2_servo.write(incomingByte);
    if (counter == 11) gripper_servo.write(incomingByte); // open gripper
    if (counter == 12) arm1_servo.write(incomingByte); // move gripper down onto object
    if (counter == 13 || counter == 14) gripper_servo.write(incomingByte); // gradually tighten gripper
    if (counter == 15) arm2_servo.write(incomingByte); // move arm into release position
    if (counter == 16) base_servo.write(incomingByte);
    if (counter == 17) arm1_servo.write(incomingByte);
    if (counter == 18) gripper_servo.write(incomingByte); // release object
    
    counter++;
    if (counter == 19) counter = 9; // loop over
         
  }
}