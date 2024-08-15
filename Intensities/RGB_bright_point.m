function [s,Filelist] = RGB_bright_point(filename)
      %Uncomment with your image folder
      %myFolder = 'pathtoyourfolderofimages';
      filetype = fullfile(myFolder, '*.tif'); % Change to whatever pattern you need.
      Filelist = dir(filetype);
      s=zeros(2,length(Filelist));
      for k = 1 : length(Filelist)
          baseFileName = Filelist(k).name;
          filename2 = fullfile(Filelist(k).folder, baseFileName);
          imageArray = imread(filename2);
          RbgImage =imread(filename2);
          b=sqrt(RbgImage(:,:,1).^2 + RbgImage(:,:,2).^2 + RbgImage(:,:,3).^2);
          mask = imread(filename);
          channel1=single(mask(:,:,1))/255;
          n=b.*channel1;
          Intensity=max(max(n));
          [Row,Col]=find(n==Intensity);
          RowInt=[mean(Row)];
          ColInt=[mean(Col)];
          s(1,k)=RowInt;
          s(2,k)=ColInt;
          

      end
  end
  