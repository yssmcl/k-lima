<%-- 
    Document   : menu
    Created on : 19/07/2017, 09:18:29
    Author     : Leandro Ensina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



        <div class="off-canvas position-left" id="mobile-menu" data-off-canvas>
          <div class="menu-mobile-opcao"><a href="index.jsp">Home</a></div>
          <div class="menu-mobile-opcao"><a href="tabela_evasao.jsp">Tabela</a></div>
          <div class="menu-mobile-opcao">Gráficos</div>
          <ul>
            <li><a href="Graficos.jsp">Estáticos</a></li>
            <li><a href="graficosDinamicos.jsp">Dinâmicos</a></li>
          </ul>
          <div class="menu-mobile-opcao"><a href="mapa_alunos.jsp">Mapa</a></div>
          <div class="menu-mobile-opcao"><a href="upload_csv_evasao.jsp">Atualizar Dados</a></div>
          <div class="menu-mobile-opcao"><a href="#">Ajuda</a></div>
        </div>

        <!-- MOBILE NAVIGATION -->
        
        <div class="off-canvas-content" data-off-canvas-content>
          <div class="title-bar show-for-small-only">
            <div class="title-bar-left">
              <button class="menu-icon" type="button" data-open="mobile-menu"></button>
              <span class="title-bar-title">MENU</span>
            </div>
          </div>
        
          <!-- DESKTOP NAVIGATION -->
          <nav class="top-bar nav-desktop hide-for-small-only">
           <div class="wrap">
              <div class="top-bar-left">
                <ul class="dropdown menu menu-desktop" data-dropdown-menu>
                  <li>
                    <a href="index.jsp">Home</a>
                  </li>                  
                  <li>
                    <a href="tabela_evasao.jsp">Tabela</a>
                  </li>
                  <li>
                    <a href="#">Gráficos</a>
                    <ul class="menu">
                      <li><a href="Graficos.jsp">Estáticos</a></li>
                      <li><a href="graficosDinamicos.jsp">Dinâmicos</a></li>
                    </ul>
                  </li>
                  <li>
                    <a href="mapa_alunos.jsp">Mapa</a>
                  </li>
                  <li>
                    <a href="upload_csv_evasao.jsp">Atualizar Dados</a>
                  </li>
                  <li>
                    <a href="#">Ajuda</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>