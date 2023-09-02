function [theta1, theta2, theta3] = generate_joint_vars(point3d)
    a1 = 0.11; % length of first arm
    a2 = 0.135 + 0.11; % length of second arm
    distanceInMeters = norm(point3d);
    if (distanceInMeters <= 0.11 + 0.135 + 0.11) % if we can reach it
        y = -point3d(2); % y for finding theta1 and theta2
        x = sqrt(point3d(3)^2 + point3d(1)^2); % x for finding theta1 and theta2
        theta3 = acosd((x^2 + y^2 - a1^2 - a2^2)/(2*a1*a2)); % angle of 2nd arm wrt first arm
        theta2 = -1 * (atand(y/x)-atand((a2*sind(theta3)/(a1 + a2*cosd(theta3))))); % angle of first arm wrt ground
        theta1 = 90 - atand(point3d(1)/point3d(3)); % base rotation
    end
end