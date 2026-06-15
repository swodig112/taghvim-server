%Final program by incrising the steps from 10^7 to 10^8 in year
%95-09-21
%ZHOPIN     pishbini baraye 2 sal
clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Ahdiye Ebadi
%%%%%%%%%%%%%%%%%%%%%%%%%

tic

% initial conditions

M10 = 1.9885e+30+(4.7014e+25)*1.3;         % Mass of the Sun
Gamma = 3.289005921186269e+05;    % M10/(M3+M4)  :
                                  %Mass of the Sun/ (Mass of the Earth + Mass of the Moon)
Eta = 81.300559650988620;      % M3/M4 : Mass of the Earth/ Mass of the Moon

m1 = 6023600;             % M10/M1  : Mass of the Sun/ Mass of the Mercury 
m2 = 408523.719;           % M10/M2  : Mass of the Sun/ Mass of the Venus 
m3 = Gamma*((1/Eta)+1);   % M10/M3  : Mass of the Sun/ Mass of the Earth 
m4 = Gamma*(Eta+1);       % M10/M4  : Mass of the Sun/ Mass of the Moon 
m5 = 3098708;             % M10/M5  : Mass of the Sun/ Mass of the Mars 
m6 = 1047.3486;           % M10/M6  : Mass of the Sun/ Mass of the Jupiter 
m7 = 3497.9018;            % M10/M7  : Mass of the Sun/ Mass of the Saturn 
m8 = 22902.98;            % M10/M8  : Mass of the Sun/ Mass of the Uranus 
m9 = 19412.26;            % M10/M9  : Mass of the Sun/ Mass of the Neptune 
m10 = 1;                  % M10/M10 : Mass of the Sun/ Mass of the Sun 
m11 = 2118644067.7966;    % M10/M11  : Mass of the Sun/ Mass of the Ceres; M11/M10: 4.72*10^(-10)    
m12 = 7407407407.41;     % M10/M12  : Mass of the Sun/ Mass of the Vesta; M12/M10: 1.35*10^(-10)
m13 = 9708737864.08;      % M10/M13  : Mass of the Sun/ Mass of the Pallas; M13/M10: 1.03*10^(-10)


Mt = (m1^(-1)+m2^(-1)+m3^(-1)+m4^(-1)+m5^(-1)+m6^(-1)+...
      m7^(-1)+m8^(-1)+m9^(-1)+m10^(-1)+m11^(-1)+m12^(-1)+m13^(-1))*M10;   % sum of 10 masses

alfa1 = (M10/Mt)*m1^(-1);
alfa2 = (M10/Mt)*m2^(-1);
alfa3 = (M10/Mt)*m3^(-1); 
alfa4 = (M10/Mt)*m4^(-1);
alfa5 = (M10/Mt)*m5^(-1);
alfa6 = (M10/Mt)*m6^(-1);
alfa7 = (M10/Mt)*m7^(-1); 
alfa8 = (M10/Mt)*m8^(-1);
alfa9 = (M10/Mt)*m9^(-1);
alfa10 = (M10/Mt)*m10^(-1);
alfa11 = (M10/Mt)*m11^(-1);
alfa12 = (M10/Mt)*m12^(-1);
alfa13 = (M10/Mt)*m13^(-1);

G = 6.67384e-11;    % unit: m^3/kg*s^2
au = 1.49597870691e+11;   % unit: m
P0 = ((4*pi^2)/(G*Mt))^(1/2)*(au)^(3/2)/86400%86164.0989;

c = (2.99792458e+08)*(P0/au)*86400%86164.0989;       % speed of light

x_mercury = 0.361762758384775;            y_mercury = -0.090782003840857;         z_mercury = -0.085715018904580;
x_venus = 0.612751990375337;              y_venus = -0.348365417812948;           z_venus = -0.195278332807551;
x_earth = 0.120527269802940;              y_earth = -0.925814301968645;           z_earth = -0.401527060858499;
x_moon = 0.119719092475029;               y_moon = -0.927808931970266;            z_moon = -0.402614323519337;
x_mars = -0.110186105470922;              y_mars = -1.327599518639508;            z_mars = -0.605889187607180;
x_jupiter = -5.379706968015059;           y_jupiter = -0.830480639340128;         z_jupiter = -0.224828745444467;
x_saturn = 7.894392516307928;             y_saturn = 4.596477873945809;           z_saturn = 1.557633411577752;
x_uranus = -18.265398388060675;            y_uranus = -1.161944566710386;          z_uranus = -0.250103530203650;
x_neptune = -16.055042663734071;           y_neptune = -23.942181307227955;         z_neptune = -9.400156805600114;

x_ceres = 1.44318511996268e+00;               y_ceres = -2.20360599799583e+00;            z_ceres = -1.32613193531346e+00;
x_vesta = 1.86874722644083e-01;               y_vesta = 2.38739522913333e+00;             z_vesta = 9.24862444546802e-01;
x_pallas = 2.08333893913313e-01;              y_pallas = -3.20885218828276e+00;           z_pallas = 6.24110133180000e-01;

v0x_mercury =  0.003365993264857;         v0y_mercury = 0.024884167883111;        v0z_mercury = 0.012946302175192;
v0x_venus = 0.010950586447485;            v0y_venus = 0.015624962827939;          v0z_venus =  0.006338301377872;
v0x_earth = 0.016802096240104;            v0y_earth = 0.001742082352963;          v0z_earth = 0.000760259562802;
v0x_moon = 0.017403181056763;             v0y_moon = 0.001574636892348;           v0z_moon = 0.000674697417828;
v0x_mars = 0.014481327987726;             v0y_mars = 0.000232394311647;           v0z_mars = -0.000281912748936;
v0x_jupiter = 0.001092014384010;          v0y_jupiter = -0.006536288439362;       v0z_jupiter = -0.002824181880996;
v0x_saturn = -0.003219064361163;          v0y_saturn = 0.004341060839389;         v0z_saturn = 0.001947773218539;
v0x_uranus = 0.000221188997819;           v0y_uranus = -0.003764434720928;        v0z_uranus = -0.001615767786348;
v0x_neptune = 0.002642777940802;          v0y_neptune = -0.001497555172773;       v0z_neptune = -0.000642699832015;

v0x_ceres = 8.46505284413723e-03;             v0y_ceres = 4.68942805653228e-03;           v0z_ceres = 4.68387689352716e-04;
v0x_vesta = -1.01748478910377e-02;            v0y_vesta = 4.66568585604242e-05;           v0z_vesta = 1.34638809455665e-03;
v0x_pallas = 8.53396211603700e-03;            v0y_pallas = -8.55483241450155e-04;         v0z_pallas = -3.90672387131133e-04;


vx_mercury = v0x_mercury*P0;            vy_mercury = v0y_mercury*P0;           vz_mercury = v0z_mercury*P0;
vx_venus = v0x_venus*P0;                vy_venus = v0y_venus*P0;               vz_venus = v0z_venus*P0;
vx_earth = v0x_earth*P0;                vy_earth = v0y_earth*P0;               vz_earth = v0z_earth*P0;
vx_moon = v0x_moon*P0;                  vy_moon = v0y_moon*P0;                 vz_moon = v0z_moon*P0;
vx_mars = v0x_mars*P0;                  vy_mars = v0y_mars*P0;                 vz_mars = v0z_mars*P0;
vx_jupiter = v0x_jupiter*P0;            vy_jupiter = v0y_jupiter*P0;           vz_jupiter = v0z_jupiter*P0;
vx_saturn = v0x_saturn*P0;              vy_saturn = v0y_saturn*P0;             vz_saturn = v0z_saturn*P0;
vx_uranus = v0x_uranus*P0;              vy_uranus = v0y_uranus*P0;             vz_uranus = v0z_uranus*P0;
vx_neptune = v0x_neptune*P0;            vy_neptune = v0y_neptune*P0;           vz_neptune = v0z_neptune*P0;
vx_ceres = v0x_ceres*P0;                vy_ceres = v0y_ceres*P0;               vz_ceres = v0z_ceres*P0;
vx_vesta = v0x_vesta*P0;                vy_vesta = v0y_vesta*P0;               vz_vesta = v0z_vesta*P0;
vx_pallas = v0x_pallas*P0;              vy_pallas = v0y_pallas*P0;             vz_pallas = v0z_pallas*P0;


s0(1) = x_mercury;   s0(2) = vx_mercury;   s0(3) = y_mercury;    s0(4) = vy_mercury;    s0(5) = z_mercury;    s0(6) = vz_mercury;
s0(7) = x_venus;     s0(8) = vx_venus;     s0(9) = y_venus;      s0(10) = vy_venus;     s0(11) = z_venus;     s0(12) = vz_venus;
s0(13) = x_earth;    s0(14) = vx_earth;    s0(15) = y_earth;     s0(16) = vy_earth;     s0(17) = z_earth;     s0(18) = vz_earth;
s0(19) = x_moon;     s0(20) = vx_moon;     s0(21) = y_moon;      s0(22) = vy_moon;      s0(23) = z_moon;      s0(24) = vz_moon;
s0(25) = x_mars;     s0(26) = vx_mars;     s0(27) = y_mars;      s0(28) = vy_mars;      s0(29) = z_mars;      s0(30) = vz_mars;
s0(31) = x_jupiter;  s0(32) = vx_jupiter;  s0(33) = y_jupiter;   s0(34) = vy_jupiter;   s0(35) = z_jupiter;   s0(36) = vz_jupiter;
s0(37) = x_saturn;   s0(38) = vx_saturn;   s0(39) = y_saturn;    s0(40) = vy_saturn;    s0(41) = z_saturn;    s0(42) = vz_saturn;
s0(43) = x_uranus;   s0(44) = vx_uranus;   s0(45) = y_uranus;    s0(46) = vy_uranus;    s0(47) = z_uranus;    s0(48) = vz_uranus;
s0(49) = x_neptune;  s0(50) = vx_neptune;  s0(51) = y_neptune;   s0(52) = vy_neptune;   s0(53) = z_neptune;   s0(54) = vz_neptune;
s0(55) = x_ceres;    s0(56) = vx_ceres;    s0(57) = y_ceres;     s0(58) = vy_ceres;     s0(59) = z_ceres;     s0(60) = vz_ceres;
s0(61) = x_vesta;    s0(62) = vx_vesta;    s0(63) = y_vesta;     s0(64) = vy_vesta;     s0(65) = z_vesta;     s0(66) = vz_vesta;
s0(67) = x_pallas;   s0(68) = vx_pallas;   s0(69) = y_pallas;    s0(70) = vy_pallas;    s0(71) = z_pallas;    s0(72) = vz_pallas;


batch = 1;
step = 1;
eclipse_save = false;
ckpt = struct('s0', s0, 'batch', batch, 'step', step, 'eclipse_save', eclipse_save);
ckpt_file = "out/ckpt";
stop_file = "STOP";
if isfile(ckpt_file)
    ckpt = load(ckpt_file).ckpt;
    s0 = ckpt.s0;
    batch = ckpt.batch;
    step = ckpt.step;
    eclipse_save = ckpt.eclipse_save;
end

if isfile(stop_file)
    delete(stop_file);
end


%x0cm = (alfa3*s0(13) + alfa4*s0(19))/(alfa3 + alfa4);
%y0cm = (alfa3*s0(15) + alfa4*s0(21))/(alfa3 + alfa4);
%psi03 = atand(y0cm/x0cm);
AccuratedFactor=3;
t0 = 0; 
t1 = 0.001/AccuratedFactor;              %Accurated steps
n = 1000*AccuratedFactor;                %Accurated steps
fprintf("%d\n", n);
u = 1; v = 1;
SolarTime = zeros(1:u,2);
LunarTime = zeros(1:v,2);

for h=2:3
    
    alfa_m = zeros (10000,1);
    alfa_s = zeros (10000,1);
    
    if isfile(stop_file)
        fprintf("DOOMED!\n");
    end
    for m=1:n   
        tspan = linspace(t0,t1,10001);
        [t s]  =  ode45('F13Raccurated', tspan, s0);

        %Defining x10 & y10 & z10; 10th body's position!

        x1 = s(:,1);    v1x = s(:,2);    y1 = s(:,3);    v1y = s(:,4);    z1 = s(:,5);    v1z = s(:,6);
        x2 = s(:,7);    v2x = s(:,8);    y2 = s(:,9);    v2y = s(:,10);   z2 = s(:,11);   v2z = s(:,12);
        x3 = s(:,13);   v3x = s(:,14);   y3 = s(:,15);   v3y = s(:,16);   z3 = s(:,17);   v3z = s(:,18);
        x4 = s(:,19);   v4x = s(:,20);   y4 = s(:,21);   v4y = s(:,22);   z4 = s(:,23);   v4z = s(:,24);
        x5 = s(:,25);   v5x = s(:,26);   y5 = s(:,27);   v5y = s(:,28);   z5 = s(:,29);   v5z = s(:,30);
        x6 = s(:,31);   v6x = s(:,32);   y6 = s(:,33);   v6y = s(:,34);   z6 = s(:,35);   v6z = s(:,36);
        x7 = s(:,37);   v7x = s(:,38);   y7 = s(:,39);   v7y = s(:,40);   z7 = s(:,41);   v7z = s(:,42);
        x8 = s(:,43);   v8x = s(:,44);   y8 = s(:,45);   v8y = s(:,46);   z8 = s(:,47);   v8z = s(:,48);
        x9 = s(:,49);   v9x = s(:,50);   y9 = s(:,51);   v9y = s(:,52);   z9 = s(:,53);   v9z = s(:,54);
        x11 = s(:,55);  v11x = s(:,56);  y11 = s(:,57);  v11y = s(:,58);  z11 = s(:,59);  v11z = s(:,60);
        x12 = s(:,61);  v12x = s(:,62);  y12 = s(:,63);  v12y = s(:,64);  z12 = s(:,65);  v12z = s(:,66);
        x13 = s(:,67);  v13x = s(:,68);  y13 = s(:,69);  v13y = s(:,70);  z13 = s(:,71);  v13z = s(:,72);


        s(:,73) = -(alfa1*x1.*(1+(v1x.^2+v1y.^2+v1z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x1.^2+y1.^2+z1.^2))/(2*c^2))+...
                    alfa2*x2.*(1+(v2x.^2+v2y.^2+v2z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x2.^2+y2.^2+z2.^2))/(2*c^2))+...
                    alfa3*x3.*(1+(v3x.^2+v3y.^2+v3z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x3.^2+y3.^2+z3.^2))/(2*c^2))+...
                    alfa4*x4.*(1+(v4x.^2+v4y.^2+v4z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x4.^2+y4.^2+z4.^2))/(2*c^2))+...
                    alfa5*x5.*(1+(v5x.^2+v5y.^2+v5z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x5.^2+y5.^2+z5.^2))/(2*c^2))+...
                    alfa6*x6.*(1+(v6x.^2+v6y.^2+v6z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x6.^2+y6.^2+z6.^2))/(2*c^2))+...
                    alfa7*x7.*(1+(v7x.^2+v7y.^2+v7z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x7.^2+y7.^2+z7.^2))/(2*c^2))+...
                    alfa8*x8.*(1+(v8x.^2+v8y.^2+v8z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x8.^2+y8.^2+z8.^2))/(2*c^2))+...
                    alfa9*x9.*(1+(v9x.^2+v9y.^2+v9z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x9.^2+y9.^2+z9.^2))/(2*c^2))+...
                    alfa11*x11.*(1+(v11x.^2+v11y.^2+v11z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x11.^2+y11.^2+z11.^2))/(2*c^2))+...
                    alfa12*x12.*(1+(v12x.^2+v12y.^2+v12z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x12.^2+y12.^2+z12.^2))/(2*c^2))+...
                    alfa13*x13.*(1+(v13x.^2+v13y.^2+v13z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x13.^2+y13.^2+z13.^2))/(2*c^2)))/alfa10;

        s(:,75) = -(alfa1*y1.*(1+(v1x.^2+v1y.^2+v1z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x1.^2+y1.^2+z1.^2))/(2*c^2))+...
                    alfa2*y2.*(1+(v2x.^2+v2y.^2+v2z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x2.^2+y2.^2+z2.^2))/(2*c^2))+...
                    alfa3*y3.*(1+(v3x.^2+v3y.^2+v3z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x3.^2+y3.^2+z3.^2))/(2*c^2))+...
                    alfa4*y4.*(1+(v4x.^2+v4y.^2+v4z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x4.^2+y4.^2+z4.^2))/(2*c^2))+...
                    alfa5*y5.*(1+(v5x.^2+v5y.^2+v5z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x5.^2+y5.^2+z5.^2))/(2*c^2))+...
                    alfa6*y6.*(1+(v6x.^2+v6y.^2+v6z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x6.^2+y6.^2+z6.^2))/(2*c^2))+...
                    alfa7*y7.*(1+(v7x.^2+v7y.^2+v7z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x7.^2+y7.^2+z7.^2))/(2*c^2))+...
                    alfa8*y8.*(1+(v8x.^2+v8y.^2+v8z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x8.^2+y8.^2+z8.^2))/(2*c^2))+...
                    alfa9*y9.*(1+(v9x.^2+v9y.^2+v9z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x9.^2+y9.^2+z9.^2))/(2*c^2))+...
                    alfa11*y11.*(1+(v11x.^2+v11y.^2+v11z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x11.^2+y11.^2+z11.^2))/(2*c^2))+...
                    alfa12*y12.*(1+(v12x.^2+v12y.^2+v12z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x12.^2+y12.^2+z12.^2))/(2*c^2))+...
                    alfa13*y13.*(1+(v13x.^2+v13y.^2+v13z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x13.^2+y13.^2+z13.^2))/(2*c^2)))/alfa10;

        s(:,77) = -(alfa1*z1.*(1+(v1x.^2+v1y.^2+v1z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x1.^2+y1.^2+z1.^2))/(2*c^2))+...
                    alfa2*z2.*(1+(v2x.^2+v2y.^2+v2z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x2.^2+y2.^2+z2.^2))/(2*c^2))+...
                    alfa3*z3.*(1+(v3x.^2+v3y.^2+v3z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x3.^2+y3.^2+z3.^2))/(2*c^2))+...
                    alfa4*z4.*(1+(v4x.^2+v4y.^2+v4z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x4.^2+y4.^2+z4.^2))/(2*c^2))+...
                    alfa5*z5.*(1+(v5x.^2+v5y.^2+v5z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x5.^2+y5.^2+z5.^2))/(2*c^2))+...
                    alfa6*z6.*(1+(v6x.^2+v6y.^2+v6z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x6.^2+y6.^2+z6.^2))/(2*c^2))+...
                    alfa7*z7.*(1+(v7x.^2+v7y.^2+v7z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x7.^2+y7.^2+z7.^2))/(2*c^2))+...
                    alfa8*z8.*(1+(v8x.^2+v8y.^2+v8z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x8.^2+y8.^2+z8.^2))/(2*c^2))+...
                    alfa9*z9.*(1+(v9x.^2+v9y.^2+v9z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x9.^2+y9.^2+z9.^2))/(2*c^2))+...
                    alfa11*z11.*(1+(v11x.^2+v11y.^2+v11z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x11.^2+y11.^2+z11.^2))/(2*c^2))+...
                    alfa12*z12.*(1+(v12x.^2+v12y.^2+v12z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x12.^2+y12.^2+z12.^2))/(2*c^2))+...
                    alfa13*z13.*(1+(v13x.^2+v13y.^2+v13z.^2)/(2*c^2)-4*pi^2*(alfa10./sqrt(x13.^2+y13.^2+z13.^2))/(2*c^2)))/alfa10;


        t = t(1:end-1,:);    
        xyz = s(1:end-1,1:2:77);

        s0 = s(end,:);
        t0 = t1;
        t1 = t1 + 0.001/AccuratedFactor;              %Accurated steps

        if eclipse_save
            %Defining equatorial coordinates for Moon and Sun: declination(delta) & right ascension(alpha)

            xe = xyz(:,7);       ye = xyz(:,8);          ze = xyz(:,9);    
            xm = xyz(:,10);       ym = xyz(:,11);          zm = xyz(:,12);
            xs = xyz(:,37);        ys = xyz(:,38);           zs = xyz(:,39);

            Rm = sqrt((xm-xe).^2+(ym-ye).^2+(zm-ze).^2);
            Rs = sqrt((xs-xe).^2+(ys-ye).^2+(zs-ze).^2);

            delta_m = asin((zm-ze)./Rm);

            salfa_m = (ym-ye)./(Rm.*abs(cos(delta_m)));


            for l=1:length(salfa_m) 
                if salfa_m(l,1)>0
                    alfa_m(l,1) = real(acos((xm(l,1)-xe(l,1))/(Rm(l,1)*abs(cos(delta_m(l,1))))));
                else
                    alfa_m(l,1) = real(pi+acos(-(xm(l,1)-xe(l,1))/(Rm(l,1)*abs(cos(delta_m(l,1))))));
                end
            end

            delta_s = asin((zs-ze)./Rs);

            salfa_s = (ys-ye)./(Rs.*abs(cos(delta_s)));


            for l=1:length(salfa_s) 
                if salfa_s(l,1)>0
                    alfa_s(l,1) = real(acos((xs(l,1)-xe(l,1))/((Rs(l,1))*abs(cos(delta_s(l,1))))));
                else
                    alfa_s(l,1) = real(pi+acos(-(xs(l,1)-xe(l,1))/(Rs(l,1)*abs(cos(delta_s(l,1))))));
                end
            end

            %xcm = (alfa3*xe + alfa4*xm)/(alfa3 + alfa4);
            %ycm = (alfa3*ye + alfa4*ym)/(alfa3 + alfa4);
            %psi3 = atand(ycm./xcm);
            beta = acosd(cos(delta_s).*cos(alfa_s).*cos(delta_m).*cos(alfa_m)+...
                         cos(delta_s).*sin(alfa_s).*cos(delta_m).*sin(alfa_m)+...
                         sin(delta_s).*sin(delta_m));
            
            W = t*P0;

            MEx = xm-xe;   MEy = ym-ye;   MEz = zm-ze;
            SMx = xs-xm;   SMy = ys-ym;   SMz = zs-zm;
            SEx = xs-xe;   SEy = ys-ye;   SEz = zs-ze;

            dE = sqrt((MEy.*SMz - MEz.*SMy).^2 + (MEz.*SMx - MEx.*SMz).^2 +...
                      (MEx.*SMy - MEy.*SMx).^2)./sqrt(SMx.^2+SMy.^2+SMz.^2);

            dM = sqrt((MEy.*SEz - MEz.*SEy).^2 + (MEz.*SEx - MEx.*SEz).^2 +...
                      (MEx.*SEy - MEy.*SEx).^2)./sqrt(SEx.^2+SEy.^2+SEz.^2);

            %InterPolating!

            ti = t(1,1):(t(2,1)-t(1,1))/10:t(end,1);
            betai = interp1(t,beta,ti);
            Wi = interp1(t,W,ti);
            dEi = interp1(t,dE,ti);
            dMi = interp1(t,dM,ti);

            %Predicting time of solar & lunar eclipse!

            ddE = diff(dEi); 
            ddM = diff(dMi); 

            for l=1:(length(ddE)-1);
                if betai(l)<1
                    if (ddE(l)<0)&&(ddE(l+1)>0)
                        SolarTime(u,:) = [Wi(l+1) dEi(l+1)];
                        u = u+1;
                    end
                    
                end  
            end


            for l=1:(length(ddM)-1);
                if betai(l)>178.44
                    if (ddM(l)<0)&&(ddM(l+1)>0)
                        LunarTime(v,:) = [Wi(l+1) dMi(l+1)];
                        v = v+1;
                    end
                end
            end
        end

    end

end

toc

