x = [];
zedscript(); % capture camera
zedscript(); % capture camera again; sometimes first capture has off colors
x = serialport('COM3', 9600);
[point, color_is_dark] = detect(); % locate object
[theta1, theta2, theta3] = generate_joint_vars(point);
transmit_vars(round(theta1), round(theta2), round(theta3), x); % pick up object using joint vars
if (color_is_dark == 1) % if the object is marked with a dark circle, drop it to the right
    transmit_vars2(0, 0, 50, x) %\th
else % if the object is marked with a white circle, drop it at a 45 deg. angle between right and straight
    transmit_vars2(45, 0, 50, x)
end