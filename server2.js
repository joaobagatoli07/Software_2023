// Função para enviar os dados do formulário para o servidor
function cadastrar() {
    // Obter os valores dos campos do formulário
    var nome = document.getElementById('nome').value;
    var email = document.getElementById('email').value;
    var senha = document.getElementById('senha').value;
  
    // Criar um objeto com os dados do usuário
    var usuario = {
      nome: nome,
      email: email,
      senha: senha
    };
  
    // Fazer uma requisição para o backend
    fetch('/caminho/para/o/seu/backend', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(usuario)
    })
    .then(response => response.json())
    .then(data => {
      // Aqui você pode tratar a resposta do servidor
      console.log(data);
      // Redirecionar o usuário para outra página, se necessário
    })
    .catch(error => {
      // Tratar erros de requisição, se necessário
      console.error('Erro:', error);
    });
  }