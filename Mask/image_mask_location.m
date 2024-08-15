function [masklocation] = image_mask(filename)
   mask=imread(filename);
   k=(mask(:,:,1));
   
end