%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load MNIST Images %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
% Autora: Fernanda Amaral Melo                                                 %
% Contato: fernanda.amaral.melo@gmail.com                                      %
%                                                                              %
% Script usado para carregar as imagens da base do MNIST                       %
% Parametros:                                                                  %
% - filename: Nome do arquivo a ser lido                                       %
% Saida:                                                                       %
% - images: Matriz contendo as imagens carregadas                              %
%           Dimensoes 28x28x[Numero de imagens]                                %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function images = loadMNISTImages(filename)

fp = fopen(filename, 'rb');
assert(fp ~= -1, ['Could not open ', filename, '']);

magic = fread(fp, 1, 'int32', 0, 'ieee-be');
assert(magic == 2051, ['Bad magic number in ', filename, '']);

numImages = fread(fp, 1, 'int32', 0, 'ieee-be');
numRows = fread(fp, 1, 'int32', 0, 'ieee-be');
numCols = fread(fp, 1, 'int32', 0, 'ieee-be');

images = fread(fp, inf, 'unsigned char');
images = reshape(images, numCols, numRows, numImages);
images = permute(images,[2 1 3]);

fclose(fp);

% Reshape to #pixels x #examples
images = reshape(images, size(images, 1) * size(images, 2), size(images, 3));
% Convert to double and rescale to [0,1]
images = double(images) / 255;

end
