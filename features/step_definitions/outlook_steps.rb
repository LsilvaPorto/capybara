

Dado("que eu acesso o site da outlook") do
    
    PageEnvio.email = "lucas.porto@stoneage.com.br"
    PageEnvio.assunto = 'Teste de envio de emails'
    PageEnvio.texto_email = "testando o envio de emails através do capybara"
    visit PageLogin.url #acessando a pagina
    
  end
  
  Quando("eu me logo") do
    PageLogin.logar(PageLogin.login, PageLogin.senha)
  end

  Quando("quando eu clico em entrar") do
    PageEnvio.nova_mensagem()
  end
  
  Quando("quando eu clico em nova mensagem") do
    PageEnvio.preenche_campo_email(PageEnvio.email)
  end
  
  Quando("quando eu escrevo e envio o email") do
    PageEnvio.prepara_email(PageEnvio.assunto, PageEnvio.texto_email)
    PageEnvio.envia_email()
  end
  
  Então("eu quero ser redirecionado para a página inicial do emial outlook") do
    
  end

