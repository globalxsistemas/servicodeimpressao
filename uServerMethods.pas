unit uServerMethods;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, IniFiles,DMPrincipal;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    base: String;
  public

    function imprimePedido(pedidos: String): Boolean;
    function imprimePreConta(mesa: Integer): Boolean;
    function DifHora(Inicio,Fim : String):String;
  end;
{$METHODINFO OFF}

implementation

uses System.StrUtils;

{ TServerMethods1 }


function TServerMethods1.DifHora(Inicio, Fim: String): String;
var
  FIni,FFim : TDateTime;
begin
Fini := StrTotime(Inicio);
FFim := StrToTime(Fim);
If (Inicio > Fim) then
  begin
  Result := TimeToStr((StrTotime('23:59:59')-Fini)+FFim)
  end
else
  begin
  Result := TimeToStr(FFim-Fini);
  end;
end;

function TServerMethods1.imprimePedido(pedidos: String): Boolean;
var
  categorias: String;
  ok: Integer;
  dmp : TDMPrimcipal;
  Data_Atual: string;
  Data_pedido: string;
  difhorario : integer;
  MinAtual : String;
  MinPedido: String;
  diferenca : integer;
begin

  categorias := '';
  ok := 0;
  dmp :=TDMPrimcipal.Create(SELF);


  dmp.statusImpressoDataSet.Close;
  dmp.statusImpressoDataSet.SQL.Clear;
  dmp.statusImpressoDataSet.SQL.Add('select * from comandas  where cod in (' + pedidos + ')');
  dmp.statusImpressoDataSet.open;

  if dmp.statusImpressoDataSet.RecordCount >= 1 then
  begin
    if (dmp.statusImpressoDataSet.FieldByName('IMPRESSO').AsString = 'N') or
       (dmp.statusImpressoDataSet.FieldByName('IMPRESSO').AsString = 'P') then
    begin
     Data_Atual := FormatDateTime('dd/mm/yyyy', Date);
     Data_pedido := dmp.statusImpressoDataSet.FieldByName('DT_DOC').AsString;
     if (Data_pedido < Data_Atual) then
     begin
       dmp.statusImpressoDataSet.Close;
       dmp.statusImpressoDataSet.SQL.Clear;
       dmp.statusImpressoDataSet.SQL.Add('update comandas set impresso = ''S'' where cod in (' + pedidos + ')');
       dmp.statusImpressoDataSet.Execute();
     end else
     begin
       MinAtual := FormatDateTime('nn', now);
       MinPedido:= FormatDateTime('nn', dmp.statusImpressoDataSet.FieldByName('HORA').AsDateTime);

       diferenca := strtoint(MinAtual) - StrToInt(MinPedido);

       if abs(diferenca) >= 10 then
       begin
       dmp.statusImpressoDataSet.Close;
       dmp.statusImpressoDataSet.SQL.Clear;
       dmp.statusImpressoDataSet.SQL.Add('update comandas set impresso = ''S'' where cod in (' + pedidos + ')');
       dmp.statusImpressoDataSet.Execute();
       end else
       begin
       try
          dmp := TDMPrimcipal.Create(nil);

          dmp.impressorasDataSet.Close;
          dmp.impressorasDataSet.Open();
          dmp.impressorasDataSet.first;

          dmp.categoriaImpressoraDataSet.Close;
          dmp.categoriaImpressoraDataSet.Open();
          dmp.categoriaImpressoraDataSet.first;

          dmp.comandaDataSet.Close;
          dmp.comandaDataSet.SQL.clear;
          dmp.comandaDataSet.SQL.Add('SELECT ');
          dmp.comandaDataSet.SQL.Add('P.EAN, ');
          dmp.comandaDataSet.SQL.Add('P.CATEGORIA as CATEGORIA,');
          dmp.comandaDataSet.SQL.Add('C.DESCRICAO as DESCRICAOCOMANDA, ');
          dmp.comandaDataSet.SQL.Add('M.DESCRICAO AS DESCRICAOMESA, ');
          dmp.comandaDataSet.SQL.Add('C.QTD as QTD, ');
          dmp.comandaDataSet.SQL.Add('C.VL_ITEM as VL_ITEM, ');
          dmp.comandaDataSet.SQL.Add('C.VALORUNIT as VALORUNIT, ');
          dmp.comandaDataSet.SQL.Add('C.OPERADOR as OPERADOR, ');
          dmp.comandaDataSet.SQL.Add('M.NUMERO as NMMESA, ');
          dmp.comandaDataSet.SQL.Add('M.PESSOAS as PESSOAS, ');
          dmp.comandaDataSet.SQL.Add('M.ABERTURA as ABERTURA, ');
          dmp.comandaDataSet.SQL.Add('C.OBSERVACAO as OBSERVACAO, ');
          dmp.comandaDataSet.SQL.Add('G.NOME AS NOMEGARCON ');
          dmp.comandaDataSet.SQL.Add('FROM COMANDAS AS C ');
          dmp.comandaDataSet.SQL.Add('LEFT OUTER JOIN MESAS AS M ON (M.NUMERO = C.MESA) ');
          dmp.comandaDataSet.SQL.Add('LEFT OUTER JOIN garcons AS G ON (G.COD = M.GARCOM) ');
          dmp.comandaDataSet.SQL.Add('LEFT OUTER JOIN PRODUTOS AS P ON (P.EAN = C.COD_PROD) ');
          dmp.comandaDataSet.SQL.Add('WHERE M.STATUS != ''2'' and C.COD in ( ' + pedidos + ' );');
          dmp.comandaDataSet.Open;

          while not dmp.impressorasDataSet.Eof do
          begin
            dmp.categoriaImpressoraDataSet.Filtered := false;
            dmp.categoriaImpressoraDataSet.Filter := 'impressora like ' +
              QuotedStr(dmp.impressorasDataSet.FieldByName('impressora').AsString);
            dmp.categoriaImpressoraDataSet.Filtered := true;
            dmp.categoriaImpressoraDataSet.first;

            while not dmp.categoriaImpressoraDataSet.Eof do
            begin

              if (categorias.Equals('')) then
                begin
                  categorias := 'CATEGORIA LIKE ' +
                    QuotedStr(dmp.categoriaImpressoraDataSet.FieldByName('categoria').AsString);
                end
              else
              begin
                categorias := categorias + 'or CATEGORIA LIKE ' +
                  QuotedStr(dmp.categoriaImpressoraDataSet.FieldByName
                  ('categoria').AsString);
              end;
              dmp.categoriaImpressoraDataSet.Next;

            end;

            dmp.comandaDataSet.Filtered := false;
            dmp.comandaDataSet.Filter := categorias;
            dmp.comandaDataSet.Filtered := true;
            if (dmp.comandaDataSet.RecordCount > 0) then
            begin
              dmp.frxReport1.LoadFromFile(GetCurrentDir + '\pedido.fr3');
              dmp.frxReport1.PrepareReport;
              dmp.ImpressaoComanda.DataSet := dmp.comandaDataSet;
              dmp.frxReport1.PrintOptions.ShowDialog := false;
              dmp.frxReport1.PrintOptions.Printer :=
              dmp.impressorasDataSet.FieldByName('impressora').AsString;

              if (dmp.frxReport1.Print) then
                if (ok <> 2) then
                  ok := 1
                else
                  ok := 2;

            end;

            categorias := '';
            dmp.impressorasDataSet.Next;
          end;


          if (ok = 1) then
          begin

             dmp.statusImpressoDataSet.Close;
             dmp.statusImpressoDataSet.SQL.Clear;
             dmp.statusImpressoDataSet.SQL.Add('update comandas set impresso = ''S'' where cod in (' + pedidos + ')');
             dmp.statusImpressoDataSet.Execute();

            Result := true;
          end;

        finally
          dmp.statusImpressoDataSet.Close;
          dmp.impressorasDataSet.Close;
          dmp.categoriaImpressoraDataSet.Close;
          dmp.comandaDataSet.Close;
        end;
       end;
     end;
    end;
  end;





end;

function TServerMethods1.imprimePreConta(mesa: Integer): Boolean;
  var
   dmp : TDMPrimcipal;
begin

    dmp := TDMPrimcipal.Create(nil);

    dmp.categoriaImpressoraDataSet.Close;
    dmp.categoriaImpressoraDataSet.Open();
    dmp.categoriaImpressoraDataSet.first;

    dmp.comandaDataSet.Close;
    dmp.comandaDataSet.SQL.Clear;
    dmp.comandaDataSet.SQL.Add('SELECT ');
    dmp.comandaDataSet.SQL.Add('P.ean,');
    dmp.comandaDataSet.SQL.Add('max(P.CATEGORIA)as CATEGORIA,');
    dmp.comandaDataSet.SQL.Add('max(C.DESCRICAO)as DESCRICAOCOMANDA,');
    dmp.comandaDataSet.SQL.Add('max(M.DESCRICAO) AS DESCRICAOMESA,');
    dmp.comandaDataSet.SQL.Add('sum(C.QTD) as QTD,');
    dmp.comandaDataSet.SQL.Add('sum(C.VL_ITEM) as VL_ITEM,');
    dmp.comandaDataSet.SQL.Add('max(C.VALORUNIT) as VALORUNIT,');
    dmp.comandaDataSet.SQL.Add('max(C.OPERADOR) as OPERADOR,');
    dmp.comandaDataSet.SQL.Add('max(M.NUMERO) as NMMESA,');
    dmp.comandaDataSet.SQL.Add('max(M.PESSOAS) as PESSOAS,');
    dmp.comandaDataSet.SQL.Add('max(M.ABERTURA) as ABERTURA,');
    dmp.comandaDataSet.SQL.Add('max(C.OBSERVACAO) as OBSERVACAO,');
    dmp.comandaDataSet.SQL.Add('max(G.NOME) AS NOMEGARCON');
    dmp.comandaDataSet.SQL.Add('FROM COMANDAS AS C');
    dmp.comandaDataSet.SQL.Add('LEFT OUTER JOIN MESAS AS M ON (M.NUMERO = C.MESA)');
    dmp.comandaDataSet.SQL.Add('LEFT OUTER JOIN garcons AS  G ON (G.COD = M.GARCOM)');
    dmp.comandaDataSet.SQL.Add('LEFT OUTER JOIN PRODUTOS AS  P ON (P.EAN = C.COD_PROD)');
    dmp.comandaDataSet.SQL.Add('WHERE  M.STATUS != ''2'' AND M.numero = :mesa group by 1  order by P.ean');
    dmp.comandaDataSet.Params[0].Value := mesa;
    dmp.comandaDataSet.Open;

    if (dmp.categoriaImpressoraDataSet.Locate('CATEGORIA', 'Pré Conta')) then
    begin
      dmp.frxReport1.LoadFromFile(GetCurrentDir + '\preconta.fr3');
      dmp.frxReport1.PrepareReport;
      dmp.frxReport1.PrintOptions.ShowDialog := false;
      dmp.frxReport1.PrintOptions.Printer :=
        dmp.categoriaImpressoraDataSet.FieldByName('impressora').AsString;
      Result := dmp.frxReport1.Print;
    end
    else
    begin
      Result := false;
    end;
end;

end.
