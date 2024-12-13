function mask=mask_fun(data,th1,th2)
[sizex sizey]=size(data);
mask=ones(sizex,sizey);
mask(data<th1)=0;
mask=bwareaopen(mask,th2);
end