class PageLogin < Page
    include Capybara::DSL

    def initialize(url, login = nil, senha = nil)
        @url = url
        @login = login
        @senha = senha
      end
    
    def logar (login, senha)
        fill_in 'loginfmt', with: login #insere o email na parte de login
        click_link_or_button 'Próximo' #clica no botão "proximo"
        fill_in 'passwd', with: senha  #insere a senha no login
        click_link_or_button 'Entrar'  #clica no botão "entrar"
    end
    
end