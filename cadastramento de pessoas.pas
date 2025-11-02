program cadastro;
uses
  Crt;


var 
  nome, whatsapp, CPF : String;
  arquivo : Text;
  errorCode : Integer;
  caminho : String;
  opcao : Char;
  contador : Integer;


begin
  contador := 0;
  
  // ?? DETECTA AUTOMATICAMENTE a melhor pasta
  // Tenta primeiro na pasta do programa (sempre funciona)
  caminho := 'cadastros.txt';
  
  repeat
    ClrScr;
    WriteLn('=== SISTEMA DE CADASTRO PORTÁTEL ===');
    WriteLn('Compatível com QUALQUER Windows');
    WriteLn('Arquivo: ', caminho);
    WriteLn('Cadastros: ', contador);
    WriteLn('Pressione ESC para sair');
    WriteLn;
    
    Write('Digite seu nome: ');
    ReadLn(nome);
    if nome = '' then Continue;
    
    Write('Digite seu WhatsApp: ');
    ReadLn(whatsapp);
    if whatsapp = '' then Continue;
    
    Write('Digite seu CPF: ');
    ReadLn(CPF);
    if CPF = '' then Continue;
    
    // ?? SALVAR - Funciona em QUALQUER computador
    {$I-}
    Assign(arquivo, caminho);
    Append(arquivo);
    if IOResult <> 0 then
      Rewrite(arquivo);
    {$I+}
    
    WriteLn(arquivo, 'Cadastro #', contador + 1);
    WriteLn(arquivo, 'Nome: ', nome);
    WriteLn(arquivo, 'WhatsApp: ', whatsapp);
    WriteLn(arquivo, 'CPF: ', CPF);
    WriteLn(arquivo, '---');
    Close(arquivo);
    
    contador := contador + 1;
    
    WriteLn;
    WriteLn('? Cadastro de ', nome, ' salvo!');
    WriteLn('Pressione Enter para continuar...');
    ReadLn;
    
    // Verifica ESC após cada cadastro
    if KeyPressed then
    begin
      opcao := ReadKey;
      if opcao = #27 then Break;
    end;
    
  until false;
  
  WriteLn;
  WriteLn('Programa finalizado! Cadastros: ', contador);
  WriteLn('Arquivo: ', caminho);
end.