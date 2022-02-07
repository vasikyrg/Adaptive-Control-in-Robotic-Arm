# Adaptive Control in Robotic Arm
A simulation of a robotic arm which i did during my studies in subject "Automatic Control Systems III"

Given the system: ![image](https://user-images.githubusercontent.com/95449708/150957131-92eabb44-c01f-497a-8f7b-0bae26614060.png)

![image](https://user-images.githubusercontent.com/95449708/150957172-b195e180-9a22-4633-87fb-983ec60b9e31.png)

with:

![image](https://user-images.githubusercontent.com/95449708/150957229-21101f64-ffb3-4216-835a-e8e4e5996747.png)

The purpose of the control is to monitor the trajectory:

![image](https://user-images.githubusercontent.com/95449708/150957362-b766c41d-8512-4b76-b686-71a767432a77.png)

If we don't know the values of ![image](https://user-images.githubusercontent.com/95449708/150958461-6600ea68-b26e-4431-a8ea-8a11f31fa395.png), we can estimate them as ![image](https://user-images.githubusercontent.com/95449708/150958593-830bb4d0-1f9f-4ec0-aa98-de71eb2bdcea.png)![image](https://user-images.githubusercontent.com/95449708/150958625-9fe00753-b741-492a-9c6a-e3f93276b273.png)
and ![image](https://user-images.githubusercontent.com/95449708/150958670-71f9b357-32a7-407e-bd11-7aa54bc13e6f.png)
. Furthermore, we know that: 

![image](https://user-images.githubusercontent.com/95449708/150958803-15e07b9f-9332-4591-950d-87940c1bcb03.png)

a] Simulate the system if you know every value of the system, select the best input function to linearize the system to reach the goal (set the poles of the Closed Loop Monitoring Error System to -10). Given 

![image](https://user-images.githubusercontent.com/95449708/150959699-9ed108df-a9b3-4d86-b6a7-f4a099e6446e.png) 

and 

![image](https://user-images.githubusercontent.com/95449708/150959793-51f5193c-c0df-4412-bd93-32307dfab12e.png)

b]Draw a robust control law with the error slip method with Λ = 10Ι2x2 so that track tracking is achieved despite the existing uncertainties. For the smooth form of your controller sign function use the saturation function given below.
![image](https://user-images.githubusercontent.com/95449708/150960122-dc580e64-73b9-4e8f-ba51-46b3d9c30f8a.png)

where ε=0.00001.

WARNING! I didn't have enough time to translate everything in English, so some words are in Greek. If you have any question send me an email (vasiliskyrge98@gmail.com)
