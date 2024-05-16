%% No-reference quality assessment for underwater images
%% Guojia Hou, Siqi Zhang, Ting Lu, Yuxuan Li, Zhenkuan Pan, Baoxiang Huang
%% Accepted by Computers and Electrical Engineering, 2024. https://doi.org/10.1016/j.compeleceng.2024.109293

%% Path to the underwater image dataset directory
img_path = '.\Path\';
ext = {'*.jpeg','*.jpg','*.png','*.pgm', '*.tif','*.bmp'};
img_path_list = [];
img_path_list_ = [];

for i = 1: length(ext)
    img_path_list_ = dir([img_path, ext{i}]);
    img_path_list = [img_path_list;img_path_list_];
end
img_num = length(img_path_list);
Score = zeros(img_num, 1);
metric_name = cell(img_num);
if img_num > 0
    for i = 1: img_num
        img_name = img_path_list(i).name;
        fprintf('%d %s\n',i,strcat(img_path, img_name));
        % Read Image
        img = imread([img_path, img_name]);
        cell_str = strsplit(img_name, '.');
        name = cell_str{1, 1};
        type = cell_str{1, 2};
        metric_name{i} = name;
%% Underwater Image Quality Prediction

%% Using the prediction Model trained on UWIQA dataset
        s = Quality_prediction(img);
        Score(i,:) = [s];
%% Using the prediction Model trained on UID2021 dataset
%         s = Quality_prediction2(img);
%         Score(i,:) = [s];
    end
end





