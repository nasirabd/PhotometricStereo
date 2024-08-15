%% DETERMINING LIGHTING DIRECTION
%Using the mask first Sphere to determine Light direction.
%Uncomment this and use your mask
%filename=('pathtomask1');

%Function for calculating the location of sphere center and radius
[Maskrowcenter,Maskcolcenter,Maskradius] = image_mask_center(filename);

%Function for finding Highlight point
[s] = RGB_bright_point(filename);

%Function for Calulating the Normal
N = Normal_Sphere(Maskrowcenter,Maskcolcenter,Maskradius,s);

%Using the normal to calculate the lighting direction at R = [0 0 1]'
R=[0 0 1]';
L_Sp_1=zeros(3,length(Filelist));
for i=1:length(N)
    L_Sphere_1 = 2*dot(N(:,i),R)*N(:,i)-R;
    L_Sp_1(:,i)=L_Sphere_1;
end
L_Sp_1;


%Using mask of second sphere
%filename=(pathtomask2);
[Maskrowcenter,Maskcolcenter,Maskradius] = image_mask_center(filename);
[s] = RGB_bright_point(filename);
N = Normal_Sphere(Maskrowcenter,Maskcolcenter,Maskradius,s);
R=[0 0 1]';

L_Sp_2=zeros(3,length(Filelist));
for j=1:length(N)
    L_Sphere_2 = 2*dot(N(:,j),R)*N(:,j)-R;
    L_Sp_2(:,j)=L_Sphere_2;
end
L_Sp_2;

% Using Lambertian Sphere where Light direction is equal to Normal
%filename=('pathtointensitymask');
[Maskrowcenter,Maskcolcenter,Maskradius] = image_mask_center(filename);
[s] = RGB_bright_point(filename);
N = Normal_Sphere(Maskrowcenter,Maskcolcenter,Maskradius,s);

L_lamb=zeros(3,length(Filelist));
for k =1:length(N)
    L_Lambertian = N(:,k);
    L_lamb(:,k)=L_Lambertian;
end
L_lamb;

%% Estimation of Normal

filename=('applemask.png');
[p] = Intensity(filename);
[x,y] = image_mask(filename);



%Storing the pixels of all images
results=zeros(length(Filelist),length([x,y]));
for k=1:22
 for i=1:length([x,y])
    results(k,i)=p(x(i),y(i),k);
 end         
end


 G=((results)'*L_Sp_2')*inv((L_Sp_2*L_Sp_2'));
 
    kd=sqrt(G(:,1).^2 + G(:,2).^2 + G(:,3).^2);
    Nd=zeros(length([x,y]),3);
    
    for i=1:3 
        for j=1:34132
        Nd(j,i)=(1/kd(j)).*G(j,i);
        end
    end
    Nd;

    surf_n1=zeros(600,800,3);
    for k=1:3
        for i=1:length([x,y])
                surf_n1(x(i),y(i),k)=Nd(i,k); %3*34132
        end
    end

 
    surf_albedo=zeros(600,800,1);
    for k=1:1
        for i=1:length([x,y])
                surf_albedo(x(i),y(i),k)=kd(i,k); %3*34132
        end
    end
    
subplot(1,2,1);
imshow(surf_n1);
subplot(1,2,2);
imshow(10*surf_albedo);