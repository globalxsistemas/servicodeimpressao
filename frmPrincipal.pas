unit frmPrincipal;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxLabel, cxDropDownEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, DMPrincipal, vcl.Printers,
  Vcl.StdCtrls, Vcl.Menus, frxClass, frxExportPDF, frxDesgn, cxButtons, frxDBSet,IniFiles,
  dxSkinBasic, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinTheBezier,
  dxDateRanges, dxScrollbarAnnotations;

type
  TFPrincipal = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxtvCategoria: TcxGridDBColumn;
    cxtvImpressora: TcxGridDBColumn;
    btnSalvar: TcxButton;
    btnPreconta: TcxButton;
    btnPedido: TcxButton;
    Label1: TLabel;
    edtBase: TEdit;
    btnAbrir: TcxButton;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPrecontaClick(Sender: TObject);
    procedure btnPedidoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);

  private
   procedure update();
   procedure delete();
   function genId(): Int64;
   function contem() : Boolean;
   procedure carregaLista();
   function ListaImpressoras(): TStringList;
   procedure salvar();



  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;
  dmPrincipal : TDMPrimcipal;


implementation

{$R *.dfm}

{ TFPrincipal }

procedure TFPrincipal.btnSalvarClick(Sender: TObject);
begin
salvar;
end;

procedure TFPrincipal.carregaLista;
begin
  dmPrincipal.cxDataSet.Close();
  dmPrincipal.cxDataSet.Open();
  dmPrincipal.cxDataSet.First;
  dmPrincipal.cxDataSet.Edit;
  TcxComboBoxProperties(cxtvImpressora.Properties).Items.Add('SEM IMPRESSORA');
  TcxComboBoxProperties(cxtvImpressora.Properties).Items := ListaImpressoras;
  cxGrid1.Update;
end;

function TFPrincipal.contem: Boolean;
var
r : Boolean;
c1,c2 : String;
begin
 dmPrincipal.categoriaDataSet.First;
 r := false;

 while not dmPrincipal.categoriaDataSet.Eof do
  begin

  c1 :=   dmPrincipal.cxDataSet.FieldByName('categoria').AsString;
  c2 :=  dmPrincipal.categoriaDataSet.FieldByName('categoria').AsString;

  if(c1.Equals(c2) or c1.Equals('Pré Conta'))then
  begin

   r := true;
   break;

  end
  else
  begin
  if(r = false)then r := false;
  end;

  dmPrincipal.categoriaDataSet.Next;
  end;

  Result := r;

end;

procedure TFPrincipal.btnPrecontaClick(Sender: TObject);
begin
dmPrincipal.frxReport1.LoadFromFile(GetCurrentDir + '\preconta.fr3');
dmPrincipal.frxReport1.DesignReport();
end;

procedure TFPrincipal.btnAbrirClick(Sender: TObject);
var
base : String;
ArquivoINI: TIniFile;
begin
OpenDialog1.Filter :='*.fdb';
OpenDialog1.InitialDir := 'C:\';OpenDialog1.Execute;
base := OpenDialog1.Files[0];

  ArquivoINI := TIniFile.Create(GetCurrentDir + '\Configuracao.ini');
  ArquivoINI.WriteString('BASE', 'CAMINHO', OpenDialog1.Files[0]);
  ArquivoINI.Free;

  if(not base.Equals('Erro ao ler o valor'))then
  begin
edtBase.Text := base;
dmPrincipal.FDConnection1.Connected := false;
dmPrincipal.FDConnection1.Params.Database := base;
dmPrincipal.FDConnection1.Connected := true;

try
update();
delete();
carregaLista();

Except
   ShowMessage('Erro ao carregar Base, Tente novamente ou Selecione uma base compativel!');
end;
  end;


end;

procedure TFPrincipal.btnPedidoClick(Sender: TObject);
begin
dmPrincipal.frxReport1.LoadFromFile(GetCurrentDir + '\pedido.fr3');
dmPrincipal.frxReport1.DesignReport();
end;

procedure TFPrincipal.delete();
begin

try
try
dmPrincipal.cxDataSet.Open();
dmPrincipal.cxDataSet.First;

dmPrincipal.categoriaDataSet.Open();
dmPrincipal.categoriaDataSet.First;

while not dmPrincipal.cxDataSet.Eof do
begin

   if(not contem())then
   begin

   dmPrincipal.cxDataSet.Delete;

   end;

  dmPrincipal.cxDataSet.Next;

end;
dmPrincipal.cxDataSet.ApplyUpdates(0);
 Except

 raise;

end;

finally
   dmPrincipal.categoriaDataSet.Close;
   dmPrincipal.cxDataSet.Close;
end;

end;

procedure TFPrincipal.FormCreate(Sender: TObject);
var
base : String;
ArquivoINI: TIniFile;

begin
ArquivoINI := TIniFile.Create(GetCurrentDir + '\Configuracao.ini');
base := ArquivoINI.ReadString('BASE', 'CAMINHO', 'Erro ao ler o valor');
ArquivoINI.Free;


if(base.Equals('Erro ao ler o valor'))then
begin
     OpenDialog1.Filter :='*.fdb';
     OpenDialog1.InitialDir := 'C:\';OpenDialog1.Execute;

     base := OpenDialog1.Files[0];

     ArquivoINI := TIniFile.Create(GetCurrentDir + '\Configuracao.ini');
     ArquivoINI.WriteString('BASE', 'CAMINHO', base);
     ArquivoINI.Free;
end;

if(base.Equals('Erro ao ler o valor'))then
begin
     Application.Terminate;
end
else
begin
     dmPrincipal := TDMPrimcipal.Create(nil);
edtBase.Text := base;

try
     update();
     delete();
     carregaLista();

Except
     ShowMessage('Erro ao carregar Base, Tente novamente ou Selecione uma base compativel!');
end;

end;


end;

procedure TFPrincipal.FormDestroy(Sender: TObject);
begin
dmPrincipal.cxDataSet.close;
dmPrincipal.DisposeOf;
Application.Terminate;
end;

function TFPrincipal.genId: Int64;
begin

   result :=  StrToInt64(formatdatetime('yymmddhhnnsszz', Now));

end;

procedure TFPrincipal.update();
var
id : Int64;
begin

try
try
id := genId;

dmPrincipal.categoriaDataSet.Open();
dmPrincipal.categoriaDataSet.First;

dmPrincipal.cxDataSet.Open();

if(not dmPrincipal.cxDataSet.Locate('categoria','Pré Conta'))then
begin
  dmPrincipal.cxDataSet.Append;
  dmPrincipal.cxDataSet.FieldByName('categoria').AsString := 'Pré Conta';
  id := id + 1;
  dmPrincipal.cxDataSet.FieldByName('id').AsLargeInt := id;
  dmPrincipal.cxDataSet.next;
end;

while not dmPrincipal.categoriaDataSet.Eof do
begin


if(dmPrincipal.cxDataSet.Locate('categoria',dmPrincipal.categoriaDataSet.FieldByName('categoria').AsString,[]))then
begin
 dmPrincipal.cxDataSet.Edit;
end
else
begin
dmPrincipal.cxDataSet.Append;
id := id + 1;
dmPrincipal.cxDataSet.FieldByName('id').AsLargeInt := id;
end;

 dmPrincipal.cxDataSet.FieldByName('categoria').AsString :=  dmPrincipal.categoriaDataSet.FieldByName('categoria').AsString;
 dmPrincipal.cxDataSet.Post;
 dmPrincipal.categoriaDataSet.Next;
end;

 dmPrincipal.cxDataSet.ApplyUpdates(0);

 Except
  raise;
end;


finally
   dmPrincipal.categoriaDataSet.Close;
   dmPrincipal.cxDataSet.Close;
end;

end;

function TFPrincipal.ListaImpressoras(): TStringList;
var
  sltmp: TStringList;
  I: Integer;
begin
  sltmp := TStringList.Create;
  for I := 0 to Pred(Printer.Printers.Count) do
    sltmp.Add(Printer.Printers[I]);
  Result := sltmp;
end;

procedure TFPrincipal.salvar;
begin
  dmPrincipal.cxDataSet.ApplyUpdates(0);
  carregaLista;
end;

end.

