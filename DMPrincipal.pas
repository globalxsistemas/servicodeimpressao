unit DMPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxExportPDF, frxDesgn,IniFiles, frxExportBaseDialog;

type
  TDMPrimcipal = class(TDataModule)
    FDConnection1: TFDConnection;
    cxDataSet: TFDQuery;
    cxDataSource: TDataSource;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    categoriaDataSet: TFDQuery;
    comandaDataSet: TFDQuery;
    frxPDFExport1: TfrxPDFExport;
    categoriaImpressoraDataSet: TFDQuery;
    impressorasDataSet: TFDQuery;
    statusImpressoDataSet: TFDQuery;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    ImpressaoComanda: TfrxDBDataset;
    comandaDataSetEAN: TStringField;
    comandaDataSetCATEGORIA: TStringField;
    comandaDataSetDESCRICAOCOMANDA: TStringField;
    comandaDataSetDESCRICAOMESA: TStringField;
    comandaDataSetQTD: TSingleField;
    comandaDataSetVL_ITEM: TSingleField;
    comandaDataSetVALORUNIT: TFMTBCDField;
    comandaDataSetOPERADOR: TStringField;
    comandaDataSetNMMESA: TIntegerField;
    comandaDataSetPESSOAS: TIntegerField;
    comandaDataSetABERTURA: TSQLTimeStampField;
    comandaDataSetOBSERVACAO: TStringField;
    comandaDataSetNOMEGARCON: TStringField;
    procedure DataModuleCreate(Sender: TObject);

  private
  public
  end;



var
  DMPrimcipal: TDMPrimcipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



procedure TDMPrimcipal.DataModuleCreate(Sender: TObject);
var
base : String;
ArquivoINI: TIniFile;
begin
 try
ArquivoINI := TIniFile.Create(GetCurrentDir + '\Configuracao.ini');
base := ArquivoINI.ReadString('BASE', 'CAMINHO', 'Erro ao ler o valor');
ArquivoINI.Free;

FDConnection1.Params.Database := base;
FDConnection1.Connected := true;
 except
 end;
end;



end.
