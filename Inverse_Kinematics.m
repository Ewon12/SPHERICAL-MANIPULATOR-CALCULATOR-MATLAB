%AARON JOSHUA M. APOLONIA
%Spherical Manipulator Modern Variant
disp('Spherical Manipulator Modern Variant')
%('th1=90, th2=-45, d=5')

syms  a1 a2 a3
a1=2;
a2=4;
a3=4;

H1 = Link([0,a1,0,pi/2,0]);
H1.qlim = pi/180*[-90 90];
H2 = Link([0,0,a2,pi/2,0,pi/2]);
H2.qlim=pi/180*[-90 0];
H3 = Link([0,0,0,0,1,a3]);
H3.qlim = [0 5];

SMMV = SerialLink([H1 H2 H3 ],'name','Spherical Variant')
SMMV.plot([0 0 0], 'workspace', [-15 15 -15 15 -15 15])
SMMV.teach

syms tn an rn dn t1 t2 d3 a1 a2 a3 

t1=0, t2=0, d3=0
a1=2, a2=4, a3=4

Hm_n =[cos(tn) -sin(tn)*cos(an) sin(tn)*sin(an) rn*cos(tn); sin(tn) cos(tn)*cos(an) -cos(tn)*sin(an) rn*sin(tn); 0 sin(an) cos(an) dn; 0 0 0 1]
H0_1 = subs(Hm_n, [tn an rn dn], [t1 pi/2 0 a1]);
H1_2 = subs(Hm_n, [tn an rn dn], [pi/2+t2 pi/2 a2 0]);
H2_3 = subs(Hm_n, [tn an rn dn], [0 0 0 a3+d3]);
H0_3 = H0_1*H1_2*H2_3

qready = [0 0 0]
T=transl([0 0 0])
q=SMMV.ikine(T,qready, 'mask', [1 1 1 0 0 0])