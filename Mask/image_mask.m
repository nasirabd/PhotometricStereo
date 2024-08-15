function [x,y] = image_mask(filename)
   mask=imread(filename);
   maskimage =single (mask(:,:,1))/255;
   [x,y] = find(maskimage==1);
 

end