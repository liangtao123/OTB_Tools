function rect = pos2rect(obj_center, obj_size, win_size)
%POS2RECT Get rectangle [x,y,w,h] from obj_center [cx,cy] and size [w,h]
%由目标的中心位置，以及目标的长宽 转化为以矩形框左上定点表示的rect（左上x,y坐标，长宽）
% Parameters:
%   obj_center Rectangle center location [cx, cy]
%   obj_size   Rectangle dimensions [w,h]
%   win_size   (optional) If [width, height] are given, the rectangle will
%              stay within the boundaries [1, 1, width, height]
%              对目标长宽限幅
  rect = [round(obj_center - obj_size./2), obj_size];
  if exist('win_size','var')
    if rect(1) < 1
      corr = abs(rect(1)) + 1;
      rect(1) = 1;
      rect(3) = rect(3) - corr;
    end
    if rect(2) < 1
      corr = abs(rect(2)) + 1;
      rect(2) = 1;
      rect(4) = rect(4) - corr;
    end
    if rect(1) + rect(3) > win_size(1)
      rect(3) = win_size(1) - rect(1);
    end
    if rect(2) + rect(4) > win_size(2)
      rect(4) = win_size(2) - rect(2);
    end
  end
end


