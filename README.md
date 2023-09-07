# Robotic Arm ECE3161

## Description
This code was used to control a robotic arm for my ECE 3161 university project in the Spring 2023 semester. The arm picks up an object marked with a light or a dark dot, and places the object in a different location based on the color of the dot (light or dark). 
### Explanation of coordinate systems and joint variables
Below is an illustration of the coordinate axes for the purpose of this project.

![image](https://github.com/rcj1/Robotic-Arm-ECE3161/assets/77995559/b4da3138-02c1-4c5f-9777-fd3fbfe23ce0)

Here is an illustration of the joint variables θ<sub>1</sub> , θ<sub>2</sub>, and θ<sub>3</sub>.

![image](https://github.com/rcj1/Robotic-Arm-ECE3161/assets/77995559/fb86a4cf-604f-4a2f-9adf-5c2dc407d501)

### Structure of project
* For this project, I connected my computer to a Zed 2i stereo camera, that also has a fixed position relative to the robot's base.
* The camera takes pictures of its surroundings and sends them to the computer, where any circle is detected in MATLAB.
* The position of the circle in 3D space is detected using the camera's stereo parameters.
* This position in (x, y, z) coordinates is translated into joint variables θ<sub>1</sub> , θ<sub>2</sub>, and θ<sub>3</sub>.
* Joint variables are sent to Arduino via serial connection, which sends appropriate signals to the servo motors. In addition to positioning the arm to pick up the object, the Arduino also sends a preprogrammed set of signals to the gripper so as to grip and release the object.

## Instructions
* Program Arduino with arduino-pgm-for-robot.ino
* Connect pin 9 of Arduino to servo for base of arm, pin 10 to servo for second arm, pin 11 to servo for first arm, and pin 12 to the gripper servo.
* Connect Arduino to computer via serial port.
* Connect Zed 2i to computer.
* Run ece_3161.m.
