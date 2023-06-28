const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'all_clean2',
});

connection.connect(function (err) {
  if (!err) {
    console.log("Conexão com o Banco realizada com sucesso!");
  } else {
    console.log("Erro: Conexão NÃO realizada", err);
  }
});

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/login.html');
});

app.post('/login', (req, res) => {
  let email = req.body.email;
  let senha = req.body.senha;

  connection.query("SELECT * FROM usuario WHERE email_usuario = ?", [email], function (err, rows, fields) {
    console.log("Results:", rows);
    if (!err) {
      if (rows.length > 0) {
        if (rows[0].senha_usuario === senha) {
          res.send('Login com Sucesso!!!');
        } else {
          res.send('Senha incorreta');
        }
      } else {
        res.send('Login Falhou - Email não cadastrado');
      }
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.send('Login failed');
    }
  });
});

app.get('/cadastro', (req, res) => {
  res.sendFile(__dirname + '/pages/cadastro.html');
});

app.post('/cadastro', (req, res) => {
  let email = req.body.email;
  let senha = req.body.senha;

  connection.query("INSERT INTO usuario (email_usuario, senha_usuario) VALUES (?, ?)", [email, senha], function (err, result) {
    if (!err) {
      res.send('Cadastro realizado com sucesso!');
    } else {
      console.log("Erro: Cadastro não realizado", err);
      res.send('Erro ao realizar o cadastro');
    }
  });
});

app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000!');
});