imageset=imageSet('/home/navyasri/Desktop/problems/CBIR/testimages');

%k=imageset.ImageLocation(1);

%Ref=imresize(read(imageset,20),[100 100]);
Ref=imresize(imread('84003.jpg'),[100 100]);


R=double(Ref(:,:,1));
G=double(Ref(:,:,2));
B=double(Ref(:,:,3));

for i=1:imageset.Count
    
   % k=imageset.ImageLocation(i);
   % I=imresize(imread(k),[460 760]);
   I= imresize(read(imageset,i),[100 100]);
    R2=double(I(:,:,1));
    G2=double(I(:,:,2));
    B2=double(I(:,:,3));
    k=hist(R);
    l=hist(R2);
    temp=double(k-l);

   temp=[norm(hist(R)-hist(R2)) norm(hist(G)-hist(G2)) norm(hist(B)-hist(B2))]';
    nor(i)=norm(temp);

end
[M,In]=sort(nor);
subplot(3,3,1)
imshow(read(imageset,In(1)));
subplot(3,3,2)
imshow(read(imageset,In(2)));
subplot(3,3,3)
imshow(read(imageset,In(3)));
subplot(3,3,4)
imshow(read(imageset,In(4)));
subplot(3,3,5)
imshow(read(imageset,In(5)));
subplot(3,3,6)
imshow(read(imageset,In(6)));
subplot(3,3,7)
imshow(read(imageset,In(7)));
subplot(3,3,8)
imshow(read(imageset,In(8)));
subplot(3,3,9)
imshow(read(imageset,In(9)));
