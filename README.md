# ifscrud-docker

Aplicação modelo para desenvolvimento AMP(Apache, MySQL, PHP)

Depois da execução do container a aplicação fica disponível em:
http://localhost:8000/

O PHPMyAdmin para gestão do banco de dados pode acessado em:
http://localhost:8081/
* Usuário: ifsc
* Senha: ifsc

ou como administrador

* Usuário: root
* Senha: root_password

O servidor Mysql fica acessivel diretamente em localhost:3310

## Clonar o repositório
```
git clone https://github.com/bpvifsc/ifscrud-docker
```

## Primeira Execução
```
docker-compose up --build -d
```

## Outras execuções
```
docker-compose up -d
```

## Parar aplicação
```
docker-compose down
```

## Visualizar saída dos servidores
```
docker-compose up
```
CTRL+C para terminar a execução
