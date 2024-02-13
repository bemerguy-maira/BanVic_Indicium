### Aqui segue o passo a passo do que foi realizado no projeto:

1. Considerando que foram disponibilizadas 7 tabelas do ERP da instituição financeira BanVic no formato csv, o primeiro passo foi criar um novo projeto no 
Big Query e inseri-las como um Dataset 'Dados_Brutos';

2. A fim de linkar o Big Query com a ferramenta dbt, foi emitida uma chave JASON para vincular as ferramentas e criado um repositório, também vinculando ao dbt,
no GitHub para cuidar do versionamento;

3. Foi construído um modelo conceitual com base na análise das tabelas disponibilizadas onde será modelada uma FATO TRANSAÇÕES (contendo a tabela
erp transações) e as Dimensões de Clientes (contendo a tabela erp clientes), Colaboradores (contendo a tabela erp colaboradores e 
colaborador_agencia), Contas (contendo a tabela erp contas), Propostas (contendo a tabela erp propostas_crédito), Agências (contendo a tabela 
erp agências) e Datas;

4. Após, foram criadas as pastas base de organização no dbt (marts e staging) para as diferentes etapas de tratamento dos dados e criação das 
tabelas de dimensão e fato;

5. Para a criação de cada dimensão e a tabela fatos, todos os dados pertinentes foram tratados na etapa de staging para depois compor a 
dimensão/fatos correspondente e essas alterações foram realizadas em uma nova branch devidamente identificada. Todas as dimensões/fatos 
possuem o arquivo de código .sql e uma documentação correspondente a este arquivo .yml;

6. Antes de cada pull request e validação de merge na main branch foram rodados testes para verificar a ausência de falhas nos códigos e, quando
existentes, foram corrigidos e o somente validados após todos os testes serem bem sucedidos;

7. No tratamento de dados da stg_erp_transacoes foi criada uma Surrogate Key para validar se cada linha dessa tabela é única unindo o código 
da transação com o código da conta vínculada a essa transação;

8. Foram criadas regras em algumas dimensõespara facilitar a compreensão e análise dos dados;


#### Análise do perfil da equipe de liderança do BanVic:

 - Diretor de Tecnologia: Andre Tech busca gerar análises automatizadas dos dados, será um grande aliado na apresentação e aprovação das implementações propostas;
 - Diretora Comercial: Camila Diniz acredita em uma abordagem mais conservadora que traz resultados, entretanto tem validade e não conseguiria sustentar o 
 crescimento do banco a longo prazo. Precisa ser convencida com argumentos que não desmereçam a sua proposta de resolução;
 - Analista de Dados: Lucas Johnson está empolgado e talvez tenha algumas ambições que não se encaixam na primeira linha de prioridades do BanVic, mas são interessantes
 e podem ser exploradas a longo prazo. Lucas quer entender o comportamento dos clientes em diversos canais, ele sugere explorar como o PIX afetou as transações, 
 identificar padrões de inatividade e avaliar a popularidade da agência digital em comparação com a agência física.


