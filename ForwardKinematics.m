function [pos, rot] = ForwardKinematics(q, tool_offset)
    L1 = 0.132;
    L2 = 0.132;
    T01 = DH([q(1), pi/2, 0, 0]);
    T12 = DH([q(2), 0, L1, 0]);
    T23 = DH([q(3), 0, L2, 0]);
    T03 = T01*T12*T23;
    T03_transformed = T03*tool_offset;

    pos= T03_transformed(1:3, 4);
    rot = T03_transformed(1:3, 1:3);
end

