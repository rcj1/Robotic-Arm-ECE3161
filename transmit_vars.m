function transmit_vars(theta1, theta2, theta3, x)
pause(1)
write(x, char(theta1), "uint8");
pause(1)
write(x, char(theta3), "uint8");
pause(1)
write(x, char(86), "uint8");
pause(1)
write(x, char(theta2), "uint8");
pause(1)
write(x, char(97), "uint8");
pause(4)
write(x, char(180), "uint8");
end