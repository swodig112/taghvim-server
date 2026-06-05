% this program is designed for calculating the Barycentric coordination and velocities of solar system
% in the curved space 96-7-25
clc
format long

s = zeros(10,3);
s(1,1)=0.35726020644727541518;      %x Mercury heliocentric
s(2,1)=0.60824943318560406033;      %x Venus heliocentric
s(3,1)=0.11601490913916648627;      %x EM Bary heliocentric
s(4,1)=-0.00080817732791148419;      %x Moon geocentric
s(5,1)=-0.11468858243909270380;      %x Mars heliocentric
s(6,1)=-5.38420940699214597622;      %x Jupiter heliocentric
s(7,1)=7.88988993382281817537;      %x Saturn heliocentric
s(8,1)=-18.26990081497826660524;      %x Uranus heliocentric
s(9,1)=-16.05954509192446441763;      %x Neptune heliocentric
s(10,1)=0.00450250884530125842;      %x Sun barycentric

s(1,2)=-0.09154904243051842990;      %y Mercury heliocentric
s(2,2)=-0.34913244319590053792;      %y Venus heliocentric
s(3,2)=-0.92660555364038517604;      %y EM Bary heliocentric
s(4,2)=-0.00199463000162039941;      %y Moon geocentric
s(5,2)=-1.32836653083348816476;      %y Mars heliocentric
s(6,2)=-0.83124765616108382433;      %y Jupiter heliocentric
s(7,2)=4.59571072692601301962;      %y Saturn heliocentric
s(8,2)=-1.16271158021904696130;      %y Uranus heliocentric
s(9,2)=-23.94294829087950141524;      %y Neptune heliocentric
s(10,2)=-0.00076707348146464055;      %y Sun barycentric

s(1,3)=-0.08598103998694037053;      %Z Mercury heliocentric
s(2,3)=-0.19554434578540693592;      %Z Venus heliocentric
s(3,3)=-0.40180627760698804496;      %Z EM Bary heliocentric
s(4,3)=-0.00108726266083810178;      %Z Moon geocentric
s(5,3)=-0.60615518941938081574;      %Z Mars heliocentric
s(6,3)=-0.22509475703354987777;      %Z Jupiter heliocentric
s(7,3)=1.55843151672508969735;      %Z Saturn heliocentric
s(8,3)=-0.25036954074255487461;      %Z Uranus heliocentric
s(9,3)=-9.40042278035400838599;      %Z Neptune heliocentric
s(10,3)=0.00026605632781203556;      %Z Sun barycentric

K=zeros(1,3);                             %curved space factor achiaved from Curved Space
K(1,1)=sqrt(s(10,2)^2+s(10,3)^2);      %Kxfactor
K(1,2)=sqrt(s(10,1)^2+s(10,3)^2);      %Kyfactor
K(1,3)=sqrt(s(10,1)^2+s(10,2)^2);      %Kzfactor

G = 6.67384e-11;                  % unit: m^3/kg*s^2
M10 = 1.988500e+30;               % Mass of the Sun
au = 1.495978707e+11;             % unit: m
c = (2.99792458e+08);             % speed of light m/s
ca = c*86400/au                  % speed of light au/day 
rs=(2*G*M10/c^2)/au;              %Schwarzschilds radius

rBC = sqrt(s(10,1)^2+s(10,2)^2+s(10,3)^2);    %Distance from BC until Sun (down limit of integral)

rprim = zeros(9,3);         %up limit of integral
for i=1:9
    for j=1:3
        rprim(i,j)= sqrt(s(i,j)^2+K(1,j)^2);
    end
end


lx =@(r)sqrt(r.^3./((r-rs).*(r.^2-(K(1,1)).^2)));   %integral function for x coordinates
ly =@(r)sqrt(r.^3./((r-rs).*(r.^2-(K(1,2)).^2)));   %integral function for y coordinates
lz =@(r)sqrt(r.^3./((r-rs).*(r.^2-(K(1,3)).^2)));   %integral function for z coordinates

coordinates = zeros(9,3);     %result Matrix 
for i=1:9                     %x - Barycentric coordinates
        if s(i,1)<0
           coordinates(i,1) =  -quad(lx,rBC,rprim(i,1),10^-16);
        else
           coordinates(i,1) =  quad(lx,rBC,rprim(i,1),10^-16)+2*s(10,1);
        end
end

for i=1:9                     %y - Barycentric coordinates
        if s(i,2)<0
           coordinates(i,2) =  -quad(ly,rBC,rprim(i,2),10^-16);
        else
           coordinates(i,2) =  quad(ly,rBC,rprim(i,2),10^-16)-2*s(10,2);
        end
end

for i=1:9                     %z - Barycentric coordinates
        if s(i,3)<0
           coordinates(i,3) =  -quad(lz,rBC,rprim(i,3),10^-16);
        else
           coordinates(i,3) =  quad(lz,rBC,rprim(i,3),10^-16)-2*s(10,3);
        end
end


Eta = 81.300559650988620;      % M3/M4 : Mass of the Earth/ Mass of the Moon
Landa = 1/(1+Eta);             %M4/(M3+M4)
xM_E=-0.00080817732791148419;
yM_E=-0.00199463000162039941;
zM_E=-0.00108726266083810178;

coordinates(3,1)=-Landa*xM_E+coordinates(3,1);    %x Earth Barycentric
coordinates(3,2)=-Landa*yM_E+coordinates(3,2);    %y Earth Barycentric
coordinates(3,3)=-Landa*zM_E+coordinates(3,3);    %z Earth Barycentric

coordinates(4,1)= coordinates(3,1)+xM_E;    %x Moon Barycentric
coordinates(4,2)= coordinates(3,2)+yM_E;    %y Moon Barycentric
coordinates(4,3)= coordinates(3,3)+zM_E;    %z Moon Barycentric

%Velocities--------------------------
v = zeros(10,3);
v(1,1)= 0.00336784566219378527;      %Vx Mercury heliocentric
v(2,1)= 0.01095242010990883868;      %Vx Venus heliocentric
v(3,1)= 0.01681162005220228976;      %Vx EM Bary heliocentric
v(4,1)= 0.00060108481665912983;      %Vx Moon geocentric
v(5,1)= 0.01448200480794474793;      %Vx Mars heliocentric
v(6,1)= 0.00109236329121849772;      %Vx Jupiter heliocentric
v(7,1)= -0.00321720349109366378;     %Vx Saturn heliocentric
v(8,1)= 0.00022154016562741063;      %Vx Uranus heliocentric
v(9,1)= 0.00264312279157656145;      %Vx Neptone heliocentric
v(10,1)= -0.00000035174423541454;    %Vx Sun barycentric

v(1,2)= 0.02488934284224928990;      %Vy Mercury heliocentric
v(2,2)= 0.01561250673986247038;      %Vy Venus heliocentric
v(3,2)= 0.00174313168798203152;      %Vy EM Bary heliocentric
v(4,2)= -0.00016744546061515148;     %Vy Moon geocentric
v(5,2)= 0.00023728549236071136;      %Vy Mars heliocentric
v(6,2)= -0.00652329419119226767;     %Vy Jupiter heliocentric
v(7,2)= 0.00433063223355569175;      %Vy Saturn heliocentric
v(8,2)= -0.00376765355824616179;     %Vy Uranus heliocentric
v(9,2)= -0.00150349208075879462;     %Vy Neptune heliocentric
v(10,2)= 0.00000517762777222281;     %Vy Sun barycentric

v(1,3)= 0.01294407158679596663;      %Vz Mercury heliocentric
v(2,3)= 0.00632887645174666542;      %Vz Venus heliocentric
v(3,3)= 0.00075597376713614610;      %Vz EM Bary heliocentric
v(4,3)= -0.00008556214497398616;     %Vz Moon geocentric
v(5,3)= -0.00028374983610239698;     %Vz Mars heliocentric
v(6,3)= -0.00282301226721943903;     %Vz Jupiter heliocentric
v(7,3)= 0.00192641746379945286;      %Vz Saturn heliocentric
v(8,3)= -0.00165324380492239354;     %Vz Uranus heliocentric
v(9,3)= -0.00068127100487234772;     %Vz Neptune heliocentric
v(10,3)= 0.00000222910220557907;     %Vz Sun barycentric


velocities = zeros(9,3);     %result Matrix 

for n=1:3
fr1(n) = rBC*sqrt(rBC/((rBC-rs)*(rBC^2-K(1,n)^2)));
gama(n) = 1/(1-v(10,n)^2/ca^2)          %Lorants factores
end
gx =@(r)r.^(3/2).*(r-rs).^(-1/2).*(r.^2-K(1,1).^2).^(-3/2);   %integral function for gx function
gy =@(r)r.^(3/2).*(r-rs).^(-1/2).*(r.^2-K(1,2).^2).^(-3/2);   %integral function for gy function
gz =@(r)r.^(3/2).*(r-rs).^(-1/2).*(r.^2-K(1,3).^2).^(-3/2);   %integral function for gx function

for i=1:9                     %x - Barycentric velocities
        if s(i,1)<0
        fr2(i,1) = rprim(1,1)*sqrt(rprim(1,1)/((rprim(1,1)-rs)*(rprim(1,1)^2-K(1,1)^2)));
        Gy(i,1) = quad(gx,rBC,rprim(i,1),10^-11);
        deltau1 = (s(10,1)*v(10,1)+s(10,2)*v(10,2)+s(10,3)*v(10,3))/rBC;
        fr1(1)= fr1(1);
        else
        fr2(i,1) = -rprim(1,1)*sqrt(rprim(1,1)/((rprim(1,1)-rs)*(rprim(1,1)^2-K(1,1)^2)));
        Gy(i,1) =  -quad(gx,rBC,rprim(i,1),10^-11);
        deltau1 = (s(10,1)*v(10,1)+s(10,2)*v(10,2)+s(10,3)*v(10,3))/rBC;
        fr1(1)= fr1(1);
        end
        
        deltau2(i,1) = (s(10,2)*v(10,2)+s(10,3)*v(10,3)+s(i,1)*v(i,1))/rprim(i,1);
        
        velocities(i,1) = gama(1)*(fr1(1)*deltau1- fr2(i,1)*deltau2(i,1)-(s(10,2)*v(10,2)+s(10,3)*v(10,3))*Gy(i,1))

end
for i=1:9                     %y - Barycentric velocities
        if s(i,2)<0
        fr2(i,2) = rprim(1,2)*sqrt(rprim(1,2)/((rprim(1,2)-rs)*(rprim(1,2)^2-K(1,2)^2)));
        Gy(i,2) =  quad(gy,rBC,rprim(i,2),10^-11);
        deltau1 = (s(10,1)*v(10,1)+s(10,2)*v(10,2)+s(10,3)*v(10,3))/rBC;
        fr1(2)= fr1(2);
        else
        fr2(i,2) = -rprim(1,2)*sqrt(rprim(1,2)/((rprim(1,2)-rs)*(rprim(1,2)^2-K(1,2)^2)));
        Gy(i,2) =  -quad(gy,rBC,rprim(i,2),10^-11);
        deltau1 = (s(10,1)*v(10,1)+s(10,2)*v(10,2)+s(10,3)*v(10,3))/rBC;
        fr1(2)= -fr1(2);
        end
        
        deltau2(i,2) = (s(10,1)*v(10,1)+s(10,3)*v(10,3)+s(i,2)*v(i,2))/rprim(i,2);
        
        velocities(i,2) = gama(2)*(fr1(2)*deltau1- fr2(i,2)*deltau2(i,2)-(s(10,1)*v(10,1)+s(10,3)*v(10,3))*Gy(i,2))

end
for i=1:9                     %z - Barycentric velocities
        if s(i,3)<0
        fr2(i,3) = rprim(1,3)*sqrt(rprim(1,3)/((rprim(1,3)-rs)*(rprim(1,3)^2-K(1,3)^2)));
        Gy(i,3) =  quad(gz,rBC,rprim(i,3),10^-11);
        deltau1 = (s(10,1)*v(10,1)+s(10,2)*v(10,2)+s(10,3)*v(10,3))/rBC;
        fr1(3)= fr1(3);
        else
        fr2(i,3) = -rprim(1,3)*sqrt(rprim(1,3)/((rprim(1,3)-rs)*(rprim(1,3)^2-K(1,3)^2)));
        Gy(i,1) =  -quad(gz,rBC,rprim(i,3),10^-11);
        deltau1 = (s(10,1)*v(10,1)+s(10,2)*v(10,2)+s(10,3)*v(10,3))/rBC;
        fr1(3)= -fr1(3);
        end
        
        deltau2(i,3) = (s(10,1)*v(10,1)+s(10,2)*v(10,2)+s(i,3)*v(i,3))/rprim(i,3);
        
        velocities(i,3) = gama(3)*(fr1(3)*deltau1- fr2(i,3)*deltau2(i,3)-(s(10,1)*v(10,1)+s(10,2)*v(10,2))*Gy(i,3));

end
vxM_E= 0.00060108481665912983;
vyM_E=-0.00016744546061515148;
vzM_E=-0.00008556214497398616;

velocities(3,1)=-Landa*vxM_E+velocities(3,1);    %vx Earth Barycentric
velocities(3,2)=-Landa*vyM_E+velocities(3,2);    %vy Earth Barycentric
velocities(3,3)=-Landa*vzM_E+velocities(3,3);    %vz Earth Barycentric

velocities(4,1)= velocities(3,1)+vxM_E    %vx Moon Barycentric
velocities(4,2)= velocities(3,2)+vyM_E    %vy Moon Barycentric
velocities(4,3)= velocities(3,3)+vzM_E    %vz Moon Barycentric