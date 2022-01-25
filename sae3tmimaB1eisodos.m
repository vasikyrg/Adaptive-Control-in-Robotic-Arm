function u=sae3tmimaB1eisodos(q1,q2,q1_dot,q2_dot,t)
%Prosegkistikes Times Systymatos
m1=6;
m2=2;
L1=0.5;
L2=0.4;
Lc1=0.35;
Lc2=0.1;
Iz1=0.05;
Iz2=0.02;
g=9.81;
%Orismos Newn pinakwn
Hp=[m2*(Lc2^2 + 2*L1*Lc2*cos(q2)+ L1^2)+(Lc1^2)*m1+Iz2+Iz1 m2*Lc2^2+L1*Lc2*m2*cos(q2)+Iz2; (Lc2^2)*m2+L1*Lc2*m2*cos(q2)+Iz2 m2*(Lc2^2)+Iz2];
Cp=[-m2*L1*Lc2*sin(q2)*q2_dot -m2*L1*Lc2*sin(q2)*(q2_dot+q1_dot); m2*L1*Lc2*sin(q2)*q1_dot 0];
Gp=[m2*Lc2*g*cos(q1+q2)+(m2*L1+m1*Lc1)*g*cos(q1); m2*Lc2*g*cos(q1+q2)];

if t<=5
    q1d=-90 +50*(1-cos(0.63*t));
    q1d_dot=31.5*sin(0.63*t);
    q1d_dot2=19.845*cos(0.63*t);
else
    q1d=10;
    q1d_dot=0;
    q1d_dot2=0;
end

if t<=5
    q2d=170 -60*(1-cos(0.63*t));
    q2d_dot=-37.8*sin(0.63*t);
    q2d_dot2= -23.814*cos(0.63*t);
else
    q2d=50;
    q2d_dot=0;
    q2d_dot2=0;
end
%Orismos eisodwn
%Orismos (v)
v1=q1d_dot2 -20*q1_dot +20*q1d_dot -100*q1 + 100*q1d;
v2=q2d_dot2 -20*q2_dot +20*q2d_dot -100*q2 + 100*q2d;
%Orismos (u)
u1=Hp(1,1)*v1+Hp(1,2)*v2+Cp(1,1)*q1_dot+Cp(1,2)*q2_dot+Gp(1,1);
u2=Hp(2,1)*v1+Hp(2,2)*v2+Cp(2,1)*q1_dot+Cp(2,2)*q2_dot+Gp(2,1);

u=[u1; u2];
end