import numpy as np
HIST0 = -16342200
NAMES = ['x_mercury', 'vx_mercury', 'y_mercury',  'vy_mercury',  'z_mercury',  'vz_mercury',
             'x_venus',   'vx_venus',   'y_venus',     'vy_venus',    'z_venus',    'vz_venus',
             'x_earth',   'vx_earth',   'y_earth',    'vy_earth',    'z_earth',    'vz_earth',
             'x_moon',    'vx_moon',    'y_moon',     'vy_moon',     'z_moon',     'vz_moon',
             'x_mars',    'vx_mars',    'y_mars',     'vy_mars',     'z_mars',     'vz_mars',
             'x_jupiter', 'vx_jupiter', 'y_jupiter',  'vy_jupiter',  'z_jupiter',  'vz_jupiter',
             'x_saturn',  'vx_saturn',  'y_saturn',   'vy_saturn',   'z_saturn',   'vz_saturn',
             'x_uranus',  'vx_uranus',  'y_uranus',   'vy_uranus',   'z_uranus',   'vz_uranus',
             'x_neptune', 'vx_neptune', 'y_neptune',  'vy_neptune',  'z_neptune',  'vz_neptune',
             'x_ceres',   'vx_ceres',   'y_ceres',    'vy_ceres',    'z_ceres',    'vz_ceres',
             'x_vesta',   'vx_vesta',   'y_vesta',    'vy_vesta',    'z_vesta',    'vz_vesta',
             'x_pallas',  'vx_pallas',  'y_pallas',   'vy_pallas',   'z_pallas',   'vz_pallas',
             'x_sun',     'vx_sun',     'y_sun',      'vy_sun',      'z_sun',      'vz_sun']
FILES = ['1-2.csv',
         '1-3.csv',
         '1-4.csv',
         '1-5.csv',
         '1-6.csv',
         '1-7.csv',
         '1-8.csv',
         '1-9.csv',
         '1-10.csv',
         '1-11.csv',
         '1-12.csv',
         '1-13.csv',
         '1-14.csv',
         '1-15.csv',
         '1-16.csv',
         '1-17.csv',
         '1-18.csv',
         '1-19.csv',
         '1-20.csv',
         '1-21.csv',
         '1-22.csv',
         '1-23.csv',
         '1-24.csv',
         '1-25.csv',
         '1-26.csv',
         '1-27.csv',
         '1-28.csv',
         '1-29.csv',
         '1-30.csv',
         '1-31.csv',
         '1-32.csv',
         '1-33.csv',
         '1-34.csv',
         '1-35.csv',
         '1-36.csv',
         '1-37.csv',
         '1-38.csv',
         '1-39.csv',
         '1-40.csv',
         '1-41.csv',
         '1-42.csv',
         '1-43.csv',
         '1-44.csv',
         '1-45.csv',
         '1-46.csv',
         '1-47.csv',
         '1-48.csv',
         '1-49.csv']
pi        = np.pi
M10       = 1.9885e+30+(4.7014e+25)*1.3;         # Mass of the Sun
Gamma     = 3.289005921186269e+05;    # M10/(M3+M4)  :#Mass of the Sun/ (Mass of the Earth + Mass of the Moon)
Eta       = 81.300559650988620;      # M3/M4 : Mass of the Earth/ Mass of the Moon
m1        = 6023600;             # M10/M1  : Mass of the Sun/ Mass of the Mercury 
m2        = 408523.719;           # M10/M2  : Mass of the Sun/ Mass of the Venus 
m3        = Gamma*((1/Eta)+1);   # M10/M3  : Mass of the Sun/ Mass of the Earth 
m4        = Gamma*(Eta+1);       # M10/M4  : Mass of the Sun/ Mass of the Moon 
m5        = 3098708;             # M10/M5  : Mass of the Sun/ Mass of the Mars 
m6        = 1047.3486;           # M10/M6  : Mass of the Sun/ Mass of the Jupiter 
m7        = 3497.9018;            # M10/M7  : Mass of the Sun/ Mass of the Saturn 
m8        = 22902.98;            # M10/M8  : Mass of the Sun/ Mass of the Uranus 
m9        = 19412.26;            # M10/M9  : Mass of the Sun/ Mass of the Neptune 
m10       = 1;                  # M10/M10 : Mass of the Sun/ Mass of the Sun 
m11       = 2118644067.7966;    # M10/M11  : Mass of the Sun/ Mass of the Ceres; M11/M10: 4.72*10^(-10)    
m12       = 7407407407.41;     # M10/M12  : Mass of the Sun/ Mass of the Vesta; M12/M10: 1.35*10^(-10)
m13       = 9708737864.08;      # M10/M13  : Mass of the Sun/ Mass of the Pallas; M13/M10: 1.03*10^(-10)


Mt        = (m1**(-1)+m2**(-1)+m3**(-1)+m4**(-1)+m5**(-1)+m6**(-1)+
             m7**(-1)+m8**(-1)+m9**(-1)+m10**(-1)+m11**(-1)+m12**(-1)+m13**(-1))*M10;   # sum of 10 masses
STEP_SECS = 31536000
G         = 6.67384e-11;
C         = 2.99792458e+08
AU        = 1.49597870691e+11
P0        = ((4*pi**2)/(G*Mt))**(1/2)*(AU)**(3/2)/86400
