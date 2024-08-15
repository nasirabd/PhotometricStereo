function [Maskrowcenter,Maskcolcenter,Maskradius] = image_mask_center(filename)
   mask=imread(filename);
   k=(mask(:,:,1));
   [m1,m2]= find(k==255);
   masklocation=[m1,m2];
   minrow=min(m1);
   mincol=min(m2);
   maxrow=max(m1);
   maxcol=max(m2);
   Maskrowcenter=(minrow+maxrow)/2;
   Maskcolcenter=(mincol+maxcol)/2;
   Avgc= (Maskrowcenter+Maskcolcenter)/2;
   Avgmin=(minrow+mincol)/2;
   Maskradius=Avgc-Avgmin;
   
end

