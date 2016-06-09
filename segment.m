imageset=imageSet('/home/navyasri/Desktop/problems/CBIR/testimages');

%Ref=imresize(read(imageset,50),[256 256]);
Ref=imresize(imread('84003.jpg'),[256 256]);
%[L,N] = superpixels(Ref,256);

R=double(Ref(:,:,1));
G=double(Ref(:,:,2));
B=double(Ref(:,:,3));

x=0;
y=0;


for i=1:16
    for j=1:16
        kr=R(x+1:x+16,y+1:y+16);
        sr=sum(R);
        sr=sum(sr');
        
        kg=G(x+1:x+16,y+1:y+16);
        sg=sum(G);
        sg=sum(sg');
        
        kb=B(x+1:x+16,y+1:y+16);
        sb=sum(B);
        sb=sum(sb');
        Rf(i,j)=sr;
        Gf(i,j)=sg;
        Bf(i,j)=sb;
        y=y+16;
    end 
    y=0;
    x=x+16;
end
%end





for t=1:imageset.Count
    
    I= imresize(read(imageset,t),[256 256]);
    R2=double(I(:,:,1));
    G2=double(I(:,:,2));
    B2=double(I(:,:,3));

    x=0;
    y=0;

    for i=1:16
        for j=1:16
            kr=R2(x+1:x+16,y+1:y+16);
            sr=sum(R2);
            sr=sum(sr');
        
            kg=G2(x+1:x+16,y+1:y+16);
            sg=sum(G2);
            sg=sum(sg');
        
            kb=B2(x+1:x+16,y+1:y+16);
            sb=sum(B2);
            sb=sum(sb');
            Rf2(i,j)=sr;
            Gf2(i,j)=sg;
            Bf2(i,j)=sb;
            y=y+16;
        end 
        y=0;
        x=x+16;
    end

    temp=[norm(hist(Rf)-hist(Rf2)) norm(hist(Gf)-hist(Gf2)) norm(hist(Bf)-hist(Bf2))]';
    nor(t)=norm(temp);

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
