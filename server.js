const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql2');
const app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

const path = require('path')
app.use('/assets', express.static('assets'))
app.use('/images', express.static('images'))
app.use('/pages', express.static('pages'))

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'all_clean2',
});

connection.connect(function (err) {
  if (!err){
    console.log("Conexão como o Banco realizada com sucesso!!!");
  } else{
    console.log("Erro: Conexão NÃO realizada", err);
  }
});

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/login.html')
})



app.post('/login', (req, res) => {

  let email = req.body.email;
  let senha = req.body.senha;

  connection.query("SELECT * FROM usuario where email_usuario = '" + email + "'" , function (err, rows, fields) {
    console.log("Results:", rows);
    if (!err) {
      if (rows.length > 0) {

        if ( rows[0].senha_usuario  === senha) {
            res.redirect('/pages/home_page.html');

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



app.post('/cadastro', (req, res) => {
  let nome = req.body.nome;
  let telefone =req.body.telefone;
  let rua =req.body.rua;
  let bairro = req.body.bairro;
  let numero = req.body.numero;
  let cpf =req.body.cpf;
  let email = req.body.email;
  let password = req.body.password;

  connection.query( "INSERT INTO usuario ( `nome_usuario`, `telefone_usuario`, `rua_usuario`, `bairro_usuario`, `numero_casa_usuario`, `cpf_usuario` , `email_usuario`, `senha_usuario`) VALUES  ('" + nome + "','" + telefone + "','" + rua + "','" + bairro + "','" + numero + "', '" + cpf + "', '" + email + "', '" + password + "')", function (err, rows, fields) {
    console.log("Results:", rows);
    if (!err) {
      console.log("Cadastro feito com sucesso!!");
      res.sendFile(__dirname + '/pages/home_page.html')
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.send('Login failed');
    }
  });
});

app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000!')
})

