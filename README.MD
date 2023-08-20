# Ambiente de desenvolvimento para matéria de Laboratório de banco de dados

Este repositório contém o necessário para a configuração do ambiente de desenvolvimento 
do projeto de lab de banco

## Instalação: passo-a-passo

Para instalar o ambiente de desenvolvimento, siga os passos seguintes:

1. Clone esse repositório.

    - Caso tenha chave ssh configurada

        ``` bash
        $ git clone git@github.com:devkemc/fatec_lab_banco.git
        ``` 
    - Caso não tenha chave ssh configurada

        ``` shell
        $ git clone https://github.com/devkemc/fatec_lab_banco.git
        ``` 

2. Verifique se já tem o docker e o docker-compose instalado.
    <blockquote>A nova versão do docker já traz o compose</blockquote>    
3. Adicione o zip fornecido que contem o sql developer sqldeveloper-23.1.0.097.1607-no-jre.zip na pasta lab_banco/docker/sql_developer

    ``` bash
    $ cp <suas_pastas>/sqldeveloper-23.1.0.097.1607-no-jre.zip <suas_pastas>/lab_banco/docker/sql_developer
    ```

4. Acesse local onde o docker está configurado no projeto.  

    ``` bash
    $ cd <suas_pastas>/lab_banco/docker
    ```

5. Execute o comando para a criação dos contâiners

    ``` bash
    $ docker compose up
    ```
- oracle-db-lab-banco: Contém o Oracle XE LTS;
- sql-developer-lab-banco: Contém o Oracle sql developer 23;

