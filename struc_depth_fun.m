function [struc2d,depth]=struc_depth_fun(struc3d)
[~,size_x,size_y]=size(struc3d);
struc2d=max(struc3d)-min(struc3d);
[~,depth]=max(struc3d);
struc2d=reshape(struc2d,[size_x,size_y]);
depth=reshape(depth,[size_x,size_y]);
struc2d=double(struc2d);
depth=double(depth);
end

