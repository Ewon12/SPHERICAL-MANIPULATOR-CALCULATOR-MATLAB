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
H3.qlim = [0 4];

SMMV = SerialLink([H1 H2 H3 ],'name','Spherical Variant')
SMMV.plot([pi/2 -pi/2 2], 'workspace', [-15 15 -15 15 -15 15])

q =[pi/2 -pi/2 2];

J = SMMV.jacob0(q);
J = J(1:3,:);
DJ = det(J);
IJ = inv(J);
TJ = transpose(J);

