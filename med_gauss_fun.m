function dataf=med_gauss_fun(data,dim,button,sigma)
switch button
    case 1
        switch dim 
            case '2d'
                data=medfilt2(data,[2 2]);
                dataf=imgaussfilt(data,[sigma sigma]);
            case '3d'
                data=medfilt3(data,[3 3 3]);
                dataf=imgaussfilt3(data,[sigma sigma sigma]);
            otherwise
                error('��˹&��ֵ�˲�ά�ȴ���')
        end
    case 0
        dataf=data;
    otherwise
        error('��˹&��ֵ�˲������쳣');
end
end
        
