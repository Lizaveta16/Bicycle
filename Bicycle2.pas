unit Bicycle2;

interface

uses

  xmlDoc, xmlDom, xmlintf, math,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.StdActns;

type
  TForm1 = class(TForm)
    ActionList1: TActionList;
    FileOpen1: TFileOpen;
    ListView1: TListView;
    Label1: TLabel;
    distance: TEdit;
    procedure FileOpen1Accept(Sender: TObject);

  private
    { Private declarations }
  public
  function latlondistance(const lat1, lon1, lat2, lon2: real): real;
  procedure LoadFromXml( LZFileNAme: TFileName);
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

var lat, lon : real;

function latlondistance(const lat1, lon1, lat2, lon2: real): real;
  const R = 6371;  //радиус Земли
  var p, a: real;
begin
  p:= pi/180;
  a := 0.5 - cos((lat2 - lat1) * p)/2 + cos(lat1 * p) * cos(lat2 * p) *(1 - cos((lon2 - lon1) * p))/2;
  result:= 2*R*Math.ArcSin(sqrt(a));
end;

procedure LoadFromXml( LZFileNAme: TFileName);
var
  XMLDocument:     TXMLDocument;
  Node, RootNode: IXMLNode;
  i: Integer;
begin
  XMLDocument := TXMLDocument.Create(Application);
  XMLDocument.Active := true;
  XMLDocument.LoadFromFile(LZFileNAme);
  RootNode := XMLDocument.DocumentElement;
  Node := RootNode.ChildNodes['metadata'];
  Node := Node.ChildNodes['trk'];
  Node := Node.ChildNodes['trkseg'];
  for i := 0 to Node.ChildNodes.Count - 1 do
  begin
    lat:=StrToInt(Node.ChildNodes['lat'].text);
    lon:=StrToInt(Node.ChildNodes['lon'].text);
    //Push(TempElement);
  end;

end;

procedure TForm1.FileOpen1Accept(Sender: TObject);
var i : integer;
begin
  LoadFromXml(FileOpen1.Dialog.FileName);
    ListView1.Clear;
    for I := 10 downto 0  do
      begin
        with ListView1.Items.Insert(0) do
           begin
             Checked := true;
             //SubItems.Add(BaseLayer.Childs[I].Name);
           end;
      end;
  //distance.Text:= latlondistance();
end;

end.

