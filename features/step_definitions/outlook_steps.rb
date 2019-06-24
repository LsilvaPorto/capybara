Dado("que eu acesso o site da outlook") do
    visit "https://login.live.com/" #acessando a pagina
  end
  
  Quando("eu me logo") do
    logar('teste.capybara@outlook.com','testesenha1')
  end

  Quando("quando eu clico em entrar") do
    nova_mensagem()
  end
  
  Quando("quando eu clico em nova mensagem") do
    preenche_campo_email("lucas.porto@stoneage.com.br")
  end
  
  Quando("quando eu escrevo e envio o email") do
    prepara_email('Teste de envio de emails', "testando o envio de emails através do capybara")
    envia_email()
  end
  
  Então("eu quero ser redirecionado para a página inicial do emial outlook") do
    
  end

def logar (login, senha)
    fill_in 'loginfmt', with: login #insere o email na parte de login
    click_link_or_button 'Próximo' #clica no botão "proximo"
    fill_in 'passwd', with: senha  #insere a senha no login
    click_link_or_button 'Entrar'  #clica no botão "entrar"
end

def nova_mensagem
    click_link_or_button 'Mais ações' #clica no botão mais "ações"
    find(:xpath, '//*[@id="home.banner.profile.view-inbox"]').click #clica no botão "exibir caixa de entrada"
    switch_tabs()  #função que altera entre as abas
    testa_xpath_botao_nova_mensagem() #funcao que acha e clica no botão "nova mensagem"
end

def prepara_email(assunto, texto_email)
    fill_in 'subjectLine0', with: assunto #preenche o assunto do email
    texto_do_email = find(:xpath, '//*[@id="app"]/div/div[2]/div/div[1]/div[3]/div[2]/div/div[3]/div[1]/div/div/div/div[1]/div[2]/div')  #guarda na variavel texto_do_email o valor retornado pela função elemento_nova_mensagem
    texto_do_email.send_keys texto_email #escreve o texto "teste" no corpo do email
end

def envia_email
    #find(:xpath, '//*[@id="id__2100"]').click
    click_link_or_button 'Enviar'
end

def testa_xpath_botao_nova_mensagem
    if page.has_xpath?('//*[@id="id__5"]', :text => 'Nova mensagem', :visible => true)
        find(:xpath, '//*[@id="id__5"]').click
    end
end

def encontra_campo_email
      find(:xpath, '//*[@id="app"]/div/div[2]/div/div[1]/div[3]/div[2]/div/div[3]/div[1]/div/div/div/div[1]/div[1]/div[1]/div/div[1]/div/div/div/div/div[1]/div/div/input')
end

def preenche_campo_email (email)
    elemento = encontra_campo_email()
    elemento.send_keys email #preenche o email
end 

def switch_tabs
    window = page.driver.browser.window_handles.last #salva dentro da variavel window a ultima janela aberta
    page.driver.browser.switch_to.window(window) #muda a tab para a salva dentro da variavel window
end
