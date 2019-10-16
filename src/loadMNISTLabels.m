%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load MNIST Labels %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                            %
% Autora: Fernanda Amaral Melo                                               %
% Contato: fernanda.amaral.melo@gmail.com                                    %
%                                                                            %
% Script usado para carregar a classificacao das imagens da base do MNIST    %                                                   %
% Parametros:                                                                %
% - filename: Nome do arquivo a ser lido                                     %
% Saida:                                                                     %
% - images: Matriz contendo as classifica??es carregadas                     %
%           Dimensoes [Numero de imagens]x1                                  %
%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function labels = loadMNISTLabels(filename)
%loadMNISTLabels returns a [number of MNIST images]x1 matrix containing
%the labels for the MNIST images

fp = fopen(filename, 'rb');
assert(fp ~= -1, ['Could not open ', filename, '']);

magic = fread(fp, 1, 'int32', 0, 'ieee-be');
assert(magic == 2049, ['Bad magic number in ', filename, '']);

numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');

labels = fread(fp, inf, 'unsigned char');

assert(size(labels,1) == numLabels, 'Mismatch in label count');

fclose(fp);

end
