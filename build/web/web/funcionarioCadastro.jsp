
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.controle.ControleFuncionario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>SGC Acome</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>
        <%
            session = request.getSession();
            Usuario u = (Usuario) session.getAttribute("usuario");
            boolean logado = false;
            if (u != null) {
                logado = true;
            }
        %>
    </head>
    <body>
        <header>
            <jsp:include page="cabecalho.jsp" flush="true" />
        </header>
        <main>
            <%
                if (!logado || u.getTipoUsuario().equals("candidato")) {
            %> <p> Acesso Negado </p>
            <p> Clique <a href="login.jsp"> aqui</a> para fazer o login. </p> 
            <%} else { %>
            <div class="container" style="width: 60%;">
                <div class="col s12 m6">
                    <div class="card grey lighten-5">
                        <div class="card-content black-text ">
                            <div class="row">
                                <form class="col s12" name="formulario" action="scripts/funcionarioCadastrar.jsp" method="post">
                                    <input placeholder="" id="first_name" type="hidden" name="tipoUsuario" value="funcionario"class="validate"/>
                                    <div class="center-row">
                                        <div class="input-field col s6">
                                            <div class="input-field col s7">
                                                <i class="material-icons prefix">supervisor_account</i>
                                                <select id="tipoFuncionario" name="tipoFuncionario">
                                                    <option value="" disabled selected>Escolha o Tipo</option>
                                                    <option value="gerente">Gerente</option>
                                                    <option value="funcionario">Funcion�rio</option>
                                                </select>
                                                <label>Tipo de Funcion�rio</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="center-row">
                                        <div class="input-field col s5">
                                            <i class="material-icons prefix">call_to_action</i>
                                            <input placeholder="" id="first_name" type="text" name="matricula" class="validate">
                                            <label for="matricula">N� matr�cula</label>
                                        </div>
                                    </div>
                                    <div class="center-row">
                                        <div class="input-field col s8">
                                            <i class="material-icons prefix">person</i>
                                            <input placeholder="" id="first_name" type="text" name="nome" class="validate">
                                            <label for="nome">Nome Completo</label>
                                        </div>
                                    </div>
                                    <div class="center-row">
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix"> description</i>
                                            <input placeholder="" id="cpf" type="text" name="cpf" class="validate">
                                            <label for="cpf">CPF</label>
                                        </div>
                                    </div>
                                    <div class="center-row">
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix"> featured_play_list</i>
                                            <input placeholder="" id="rg" type="text" name="rg" class="validate">
                                            <label for="rg">RG</label>
                                        </div>
                                    </div>
                                    <div class="center-row">
                                        <div class="input-field col s5">
                                            <div class="input-field col s5">
                                                <i class="material-icons prefix">wc</i>
                                                <select name="sexo">
                                                    <option value="" disabled selected>Sexo</option>
                                                    <option value="M">Masculino</option>
                                                    <option value="F">Feminino</option>
                                                </select>
                                                <label>Sexo</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="center-row">
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">today</i>
                                            <input placeholder="..." type="text" name="data" class="datepicker">
                                            <label for="data">Data de admiss�o</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">alternate_email</i>
                                            <input placeholder="" id="first_name" type="text" name="endereco" class="validate">
                                            <label for="endereco">Endere�o de Email</label>
                                            <span class="helper-text" data-error="E-mail inv�lido" data-success="Ok!"></span>
                                        </div>
                                    </div>
                                    <center>
                                        <!--    <input type="submit" name="salvar" value="Cadastrar" class="waves-effect waves-ligth  btn indigo"/> -->
                                        <button onclick="return validar()" class="waves-effect waves-light btn indigo" type="submit" name="salvar"><span>Cadastrar</span></button>
                                    </center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% }%>
        </main>
        <footer>
            <jsp:include page="rodape.jsp" flush="true" />
        </footer>                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $('select').formSelect();
                                                $('.datepicker').datepicker({format: 'dd/mm/yyyy'});
                                                $('.datepicker-date-display').css("background-color", "#003366");
                                                var $campoCpf = $("#cpf");
                                                var $campoRg = $("#rg");
                                                $campoCpf.mask('000.000.000-00', {reverse: true});
                                                $campoRg.mask('000.000.000-00', {reverse: true});
                                            });
        </script>
        <script>
            function validar() {
                if (document.formulario.tipoFuncionario.value == "") {
                    alert("Por favor, insira o tipo de funcionario.");
                    return false;
                }
                if (document.formulario.matricula.value == "") {
                    alert("Por favor, insira um n� de matr�cula.");
                    return false;
                }
                if (document.formulario.nome.value == "") {
                    alert("Por favor, insira o nome do funcion�rio.");
                    return false;
                }
                if (document.formulario.cpf.value == "") {
                    alert("Por favor, insira o CPF do funcionario.");
                    return false;
                }
                if (document.formulario.rg.value == "") {
                    alert("Por favor, insira o RG do funcionario.");
                    return false;
                }
                if (document.formulario.sexo.value == "") {
                    alert("Por favor, insira o sexo do funcionario.");
                    return false;
                }
                if (document.formulario.data.value == "") {
                    alert("Por favor, insira a data de admiss�o funcionario.");
                    return false;
                }
                if (document.formulario.endereco.value == "") {
                    alert("Por favor, insira o endere�o de e-mail do funcion�irio.");
                    return false;
                }
            }
        </script>
    </body>
</html>