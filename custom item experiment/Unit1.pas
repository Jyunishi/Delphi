unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, OraCall, RVScroll, SclRView, DBSRVE,
  RVTypes,  RVFMisc, RVFuncs, RVItem, RVLabelItem, StdCtrls, RvUni, CRVData, RVStyle;

const
  rvsTOC     = -210;
  rvsTMFItem = -9000;

type
  TForm1 = class(TForm)
    DBSRichViewEdit1: TDBSRichViewEdit;
    OraSession1: TOraSession;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyFieldItem = class (TRVTextItemInfo)
  protected
    FFieldId : Integer;

//    function GetRVFExtraPropertyCount: Integer; override;
    procedure SaveRVFExtraProperties(Stream: TStream); override;
    function SetExtraCustomProperty(const PropName: TRVAnsiString;
      const Value: String): Boolean; override;
  public
    function GetRVFExtraPropertyCount: Integer;
    procedure Assign(Source: TCustomRVItemInfo);
    procedure SaveRTF(Stream: TStream; RVData: TPersistent; ItemNo,
      Level: Integer; var SavingData: TRVRTFSavingData; DocType: TRVRTFDocType;
      HiddenParent: Boolean);
    property FieldId : Integer read FFieldId write FFieldId;
//    MaxLevel: Integer;
//    constructor Create(RVData: TPersistent; FieldId : Integer); overload; //ride;
//    constructor CreateEx(RVData: TPersistent; AMaxLevel: Integer);
//    function SetExtraIntPropertyEx(Prop: Integer; Value: Integer):
//      Boolean; override;
//    function GetExtraIntPropertyEx(Prop: Integer; var Value: Integer):
//      Boolean; override;
//    function GetExtraIntPropertyReformat(Prop: Integer):
//      TRVReformatType; override;
//    function SetExtraCustomProperty(const PropName: TRVAnsiString;
//      const Value: String): Boolean; override;
//    procedure Assign(Source: TCustomRVItemInfo); override;
//    {$IFnDEF RVDONOTUSERTF}
//    procedure SaveRTF(Stream: TStream; RVData: TPersistent; ItemNo: Integer;
//      Level: Integer; var SavingData: TRVRTFSavingData; DocType: TRVRTFDocType;
//      HiddenParent: Boolean); override;
//    {$ENDIF}
//    {$IFnDEF RVDONOTUSEDOCX}
//    procedure SaveOOXMLBeforeRun(Stream: TStream; RVData: TPersistent;
//      ItemNo: Integer; SavingData: TRVDocXSavingData;
//      HiddenParent: Boolean); override;
//    procedure SaveOOXML(Stream: TStream; RVData: TPersistent; ItemNo: Integer;
//      SavingData: TRVDocXSavingData; HiddenParent: Boolean); override;
//    procedure SaveOOXMLAfterRun(Stream: TStream; RVData: TPersistent;
//      ItemNo: Integer; SavingData: TRVDocXSavingData;
//      HiddenParent: Boolean); override;
//    {$ENDIF}
  end;

resourcestring
  RVTOCSaveTextStr = '[Update fields to build a table of contents]';
  RVTOCDisplayText = '{TOC}';
  TMFIDefText = '<...>';

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  bufItem : TMyFieldItem;
  i : Integer;
begin
  bufItem := TMyFieldItem.Create(DBSRichViewEdit1.RichViewEdit.RVData);
  bufItem.ItemOptions := [rvioUnicode];
  bufItem.FieldId := 455;
  bufItem.ItemText := RVU_StringToRawByteString('test SUKA', True, 1252);
  DBSRichViewEdit1.RichViewEdit.InsertItem('test SUKA', bufItem);
//  bufItem.Inserting(DBSRichViewEdit1.RichViewEdit.RVData, bufItem.ItemText, False);
//  i := DBSRichViewEdit1.RichViewEdit.CurItemNo;
//  DBSRichViewEdit1.RichViewEdit.RVData.Items.Insert(2, bufItem);
//  bufItem.Inserted(DBSRichViewEdit1.RichViewEdit.RVData, 2);
  DBSRichViewEdit1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  t : Integer;
begin
//  if DBSRichViewEdit1.RichViewEdit.GetCurrentItem is TMyFieldItem then
//    ShowMessage(IntToStr(TMyFieldItem(DBSRichViewEdit1.RichViewEdit.GetCurrentItem).FFieldId));
//    ShowMessage('Ebat');
  DBSRichViewEdit1.RichViewEdit.GetCurrentItem.getExtraCustomProperty()
  GetExtraIntProperty('TMFID', t);
  ShowMessage(IntToStr(t));
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if OraQuery1.State in [dsInsert, dsEdit] then
    OraQuery1.Post;
  OraSession1.Commit;
end;

{ TMyFieldItem }

//constructor TMyFieldItem.Create(RVData: TPersistent; FieldId: Integer);
//begin
////  inherited Create(RVData);
////  Self.FieldId := FieldId;
////  ItemText := RVU_StringToRawByteString(TMFIDefText, True, 1251);
////  StyleNo := rvsTMFItem;
//end;
//
//function TMyFieldItem.GetRVFExtraPropertyCount: Integer;
//begin
//
//end;
//

procedure TMyFieldItem.SaveRVFExtraProperties(Stream: TStream);
begin
  inherited SaveRVFExtraProperties(Stream);
  WriteRVFExtraCustomPropertyInt(Stream, 'TMFID', FFieldId);
//    RVFWriteLine(Stream, {$IFDEF RVUNICODESTR}AnsiStrings.{$ENDIF}
//      Format('TMFID=%s', [StringToRVFString(IntToStr(FFieldId))]));
end;

function TMyFieldItem.SetExtraCustomProperty(const PropName: TRVAnsiString;
  const Value: String): Boolean;
begin
  if PropName='TMFID' then
  begin
    FFieldId := StrToInt(Value);
    Result := True;
  end
  else
    Result := inherited SetExtraCustomProperty(PropName, Value);
end;

//function TMyFieldItem.SetExtraIntPropertyEx(Prop, Value: Integer): Boolean;
//begin
//  case Prop of
//    rveipcMaxLevel:
//      begin
//        MaxLevel := Value;
//        Result := True;
//      end;
//    else
//      Result := inherited SetExtraIntPropertyEx(Prop, Value);
//  end;
//end;

function TMyFieldItem.GetRVFExtraPropertyCount: Integer;
begin
  Result := inherited GetRVFExtraPropertyCount;
  if FieldId <> 0 then
    inc(Result);
end;

procedure TMyFieldItem.Assign(Source: TCustomRVItemInfo);
begin
  if Source is TMyFieldItem then
    FFieldId := TMyFieldItem(Source).FFieldId;
  inherited Assign(Source);
end;

procedure TMyFieldItem.SaveRTF(Stream: TStream; RVData: TPersistent; ItemNo,
  Level: Integer; var SavingData: TRVRTFSavingData; DocType: TRVRTFDocType;
  HiddenParent: Boolean);
var
  TextStr: TRVAnsiString;
  IText : string;
begin
  IText := RVU_RawByteStringToString(ItemText, True, 1252);
  TextStr := MakeRTFIdentifierStr(IText,
    TCustomRVData(RVData).GetRVStyle.DefCodePage,
    rvrtfDuplicateUnicode in TCustomRVData(RVData).RTFOptions);
  RVFWrite(Stream,
    {$IFDEF RVUNICODESTR}AnsiStrings.{$ENDIF}Format(
      '{\field\flddirty{\*\fldinst { TOC \\o "1-%d" \\h \\z \\u }}'+
      '{\fldrslt {%s}}}', [FFieldId, TextStr]));
end;

initialization

  RegisterRichViewItemClass(rvsTMFItem, TMyFieldItem);

end.
