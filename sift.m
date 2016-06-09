imageset=imageSet('/home/navyasri/Desktop/problems/CBIR/dataset/training');

q=300;

Ref=imresize(read(imageset,q),[100 100]);

N=0;
S(1)=0;


for i=1:imageset.Count
    
     I= imresize(read(imageset,i),[100 100]);
     I=single(rgb2gray(I));
     [f,d]=vl_sift(I);
     d=double(d);
     d=d';
     [a,b]=size(d);
     S(i+1)=S(i)+a;
     X(N+1:N+a,:)=d;
     N=N+a;
end
m=100;
[A,B]=kmeans(X,m);

field='his';
value=[];
s= struct(field,value);


for i=1:imageset.Count
    
    siz=S(i+1)-S(i)-1;
    for k=1:m
        s(i).his(k)=0;
    end
    
    
    for j= S(i)+1:S(i+1)
        k=A(j);
        s(i).his(k)=s(i).his(k)+1;
    end

end

for i=1:imageset.Count
   nor(i)=norm(s(q).his'-s(i).his');
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
