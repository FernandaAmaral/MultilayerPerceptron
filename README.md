# MultilayerPerceptron
Rede "Backpropagation" em reconhecimento de padrões
[Este projeto foi desenvolvido em outra plataforma de controle de versionamento e exportada para o GitHub após o término da disciplina Sistemas Inteligentes - UnB]

Criação e treinamento de uma rede neural artificial “Perceptron Multicamada” para reconhecimento de um conjunto de imagens manuscritas da base de dados MNIST.

O modelo do algoritmo segue a ilustração abaixo.
O vetor x[n] representa as entradas da função, que nesse caso são os valores dos pixels das imagens do banco de dados. Os manuscritos possuem 28x28 pixels, o que corresponde a um vetor de 784 posições.
O vetor y2 representa uma camada escondida de neurônios e o vetor y3 representa a saída da função, que neste caso, é um vetor de 10 posições que indica (de maneira binária) se a
saída encontrada é um número entre 0 e 9.

![perceptron](images/perceptron.png?raw=true)

As matrizes w1 e w2 são os pesos pelos quais os neurônios são multiplicados para se descobrir os valores das próximas camadas. Os elementos dessas matrizes são constantemente alterados durante o treinamento afim de se obter melhores resultados.

Na determinação dos parâmetros do treinamento, foi utilizada uma faixa de valores conforme ilustrada abaixo:
Na determinação do η (eta), foram testados valores entre 0.1 e 0.9 através de um laço de repetição no programa e o valor que retornou menor porcentagem de erro médio foi η=0.5 como pode ser conferido no gráfico a seguir:

![eta](images/eta.png?raw=true)

Da mesma forma que no caso anterior, na determinação do número de neurônios na camada escondida, também foi utilizado um laço de repetição que testava valores entre 10 e 784 (Número de neurônios da saída e entrada, respectivamente), esse intervalo comumente utilizado na literatura. O número de neurônios da camada escondida que retornou menor erro foi n=60.

![layers](images/layers.png?raw=true)

O erro quadrático médio de cada época pode ser conferido no gráfico abaixo. Nota-se a sua diminuição gradual à medida que as épocas passam, estabilizando na época 700, aproximadamente.

![error](images/error.png?raw=true)

O gráfico abaixo ilustra a taxa de erro médio quadrático de cada exemplo do arquivo de teste, com algumas exceções, os valores estão na mesma faixa de erro do gráfico anterior (porcentagem de erro dos arquivos de treinamento), e a média dos erros de todos os exemplos também está bem condizente com o valor encontrado no treinamento da rede.

![error_test](images/error_test.png?raw=true)


    