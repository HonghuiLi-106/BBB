function sO2f=sO2filter_fun(sO2,depth,mask,l_c,h_th)
% sO2=gpuarray(sO2);
% sO2f_c=[];
[size_x,size_y]=size(sO2);
o_c=round(l_c./2);
depth(mask<1)=0;
sO2(mask<1)=0;
sO2=fillmissing(sO2,'movmedian',3);
sO2(isnan(sO2)==1)=0;
sO2f=sO2;
%滤波核全在图像内
for xi=1:(size_x-l_c+1)
    for yi=1:(size_y-l_c+1)
        sO2_c=sO2(xi:(xi+l_c-1),yi:(yi+l_c-1));
        dep_c=depth(xi:(xi+l_c-1),yi:(yi+l_c-1));
        dep_c=abs(dep_c-dep_c(o_c,o_c));
        sO2_c(dep_c>h_th)=0;
        sO2_c=sum(sO2_c,'all')./nnz(sO2_c);
%         sO2f_c=[sO2f_c sO2_c];
        sO2f(xi+o_c-1,yi+o_c-1)=sO2_c;
    end
%         sO2f((yi+o_c-1),o_c:(size_x-e_c))=sO2f_c(1:(size_x-l_c+1));
end
sO2f(mask<1)=0;%必须有
sO2f=fillmissing(sO2f,'movmedian',3);
sO2f(isnan(sO2f)==1)=0;
end



% %滤波核上部分不在图像内
% if o_c~=1||o_c~=2
% for yi=1:(o_c-1)
%     parfor xi=1:(size_x-e_c)
%         sO2_c=sO2(yi:(yi+l_c-1),xi:(xi+l_c-1));
%         dep_c=dep(yi:(yi+l_c-1),xi:(xi+l_c-1));
%         dep_c=abs(dep_c-dep_c(o_c,o_c));
%         sO2_c(dep_c>h_th)=0;
%         sO2_c=sum(sO2_c,'all')./nnz(sO2_c);
%         sO2f_c=[sO2f_c sO2_c];
%     end
%         sO2f((yi+o_c-1),o_c:(x_size-e_c+1))=sO2f_c;
% end
% %滤波核下部分不在图像内
% %滤波核左部分不在图像内
% %滤波核右部分不在图像内
% %滤波核左上部分不在图像内
% %滤波核左下部分不在图像内
% %滤波核右上部分不在图像内
% %滤波核右下部分不在图像内
%         
