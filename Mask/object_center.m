function pixelv = object_brightpoint(filename2,Layer)
  Image = imread(filename2);
  ColorMatrix=Image(:,:,Layer)
  %Maxpixel=max(ColorMatrix(:))
  %[Maxrow Maxcol]=find(ColorMatrix==Maxpixel)
  %pixelv=[Maxrow Maxcol]
  [p1,p2]=find(ColorMatrix);
  pixelv=[p1,p2]
          
  end
  