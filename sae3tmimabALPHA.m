% Times ths ode
t_start =0;
t_end = 10;
time_span = t_start:0.1:t_end;

% Arxikes Sinthikes
q1_0=-87;
q2_0=167;
q1_dot_0=0;
q2_dot_0=0;
x0=[q1_0 q2_0 q1_dot_0 q2_dot_0];
%Ode gia prossegisi
[t,x]=ode23s(@sae3timaBrhs,time_span,x0);
q1b2=x(:,1);
q2b2=x(:,2);
q1b2_dot=x(:,3);
q2b2_dot=x(:,4);
figure
plot(t,q1b2),xlabel('time (s)'),ylabel('Joint Angle 1')   
title(' Joint Angle 1  vs Time')
 grid   
figure
plot(t,q2b2),xlabel('time (s)'),ylabel('Joint Angle 2')   
title(' Joint Angle 2 vs Time')
grid    
figure
plot(t,q1b2_dot),xlabel('time (s)'),ylabel('Joint Velocity 1')   
title(' Joint Velocity 1   vs Time')
grid    
figure
plot(t,q2b2_dot),xlabel('time (s)'),ylabel('Joint Velocity 2')   
title(' Joint Velocity 2 vs Time')
grid
% Anaktisi timwn gia qd
qd1_array=zeros(10,1);
e1 = zeros(10,1);
qd1_dot_array=zeros(10,1);
e1_dot = zeros(10,1);
qd1_dot2_array=zeros(10,1);
qd2_array=zeros(10,1);
e2 = zeros(10,1);
qd2_dot_array=zeros(10,1);
e2_dot = zeros(10,1);
qd2_dot2_array=zeros(10,1);
for i=1:length(t)
    if t(i,1)<=5
    q1d=-90 +50*(1-cos(0.63*t(i)));
    q1d_dot=31.5*sin(0.63*t(i));
    q1d_dot2=19.845*cos(0.63*t(i));
else
    q1d=10;
    q1d_dot=0;
    q1d_dot2=0;
end

if t(i,1)<=5
    q2d=170 -60*(1-cos(0.63*t(i)));
    q2d_dot=-37.8*sin(0.63*t(i));
    q2d_dot2= -23.814*cos(0.63*t(i));
else
    q2d=50;
    q2d_dot=0;
    q2d_dot2=0;
end
qd1_array(i,1)=q1d;
qd1_dot_array(i,1)=q1d_dot;
qd1_dot2_array(i,1)=q1d_dot2;
qd2_array(i,1)=q2d;
qd2_dot_array(i,1)=q2d_dot;
qd2_dot2_array(i,1)=q2d_dot2;
e1(i,1)= q1b2(i,1)-qd1_array(i,1);
e1_dot(i,1)= q1b2_dot(i,1)-qd1_dot_array(i,1);
e2(i,1)= q2b2(i,1)-qd2_array(i,1);
e2_dot(i,1)= q2b2_dot(i,1)-qd2_dot_array(i,1);
end
figure
plot(t,qd1_array)
hold on
plot(t,q1b2)
hold on
plot(t,e1)
grid 
legend('qd1','q1','e1')
hold off
figure
plot(t,qd1_dot_array)
hold on
plot(t,q1b2_dot)
hold on
plot(t,e1_dot)
grid   
legend('qd1_d_o_t','q1_d_o_t','e1_d_o_t')
hold off
figure
plot(t,qd2_array)
hold on
plot(t,q2b2)
hold on
plot(t,e2)
grid 
legend('qd2','q2','e2')
hold off
figure
plot(t,qd2_dot_array)
hold on
plot(t,q2b2_dot)
hold on
plot(t,e2_dot)
grid
legend('qd2_d_o_t','q2_d_o_t','e2_d_o_t')
hold off
% figure
% plot(t,u1)
% hold on
% plot(t,u2)
% grid
% title('Eisodos sto B1')
% legend('eisodos u1','eisodos u2')
% hold off
