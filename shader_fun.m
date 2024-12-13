function [data_shader]=shader_fun(datargb1,datargb2,cmap,shaderbutt)
switch shaderbutt
    case 1
        %判断背景数值为0的情况
        [sizex,sizey,~]=size(datargb2);
        for xi=1:1:sizex
            for yi=1:1:sizey
                if isequal(reshape(datargb1(xi,yi,:),[1 3]),cmap(1,:))
                datargb2(xi,yi,:)=0;
                end
            end
        end
        datahsv1=rgb2hsv(datargb1);
        datahsv2=rgb2hsv(datargb2);
        datahsv1(:,:,2)=datahsv2(:,:,2);
        datahsv1(:,:,3)=datahsv2(:,:,3);
        data_shader=hsv2rgb(datahsv1);
    case 0
        data_shader=datargb1;
    otherwise
        error('光影开关异常');
end
end