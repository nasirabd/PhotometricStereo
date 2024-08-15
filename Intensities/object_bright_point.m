function pixelv = object_bright_point(filename2,Layer)
  Image = imread(filename2);
  ColorMatrix=Image(:,:,Layer)
  %Maxpixel=max(ColorMatrix(:))
  %[Maxrow Maxcol]=find(ColorMatrix==Maxpixel)
  %pixelv=[Maxrow Maxcol]
  [p1,p2]=find(ColorMatrix);
  pixelv=[p1,p2]
          
  end
  