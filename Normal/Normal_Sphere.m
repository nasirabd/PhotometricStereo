function N = Normal_Sphere(Maskrowcenter,Maskcolcenter,Maskradius,s)
y=zeros(3,22);
for k = 1:length(s)
    N_x = ((s(2,k))-Maskcolcenter)/Maskradius;
    N_y = ((s(1,k))-Maskrowcenter)/Maskradius;
    N_z = sqrt(1-N_x^2-N_y^2);
    y(2,k)=N_x;
    y(1,k)=N_y;
    y(3,k)=N_z;
end
N = y;
end




