unit Dibujar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    BtnLapiz: TButton;
    BtnGoma: TButton;
    GrosorLinea: TComboBox;
    PaletaColores: TImage;
    BtnLimpiar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnLapizClick(Sender: TObject);
    procedure BtnGomaClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaletaColoresMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GrosorLineaChange(Sender: TObject);
    procedure BtnLimpiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Pulsado,Goma,Lapiz :Boolean;
  CorX,CorY :integer;
  col:TColor;

implementation

{$R *.dfm}

procedure TForm4.BtnGomaClick(Sender: TObject);
begin
lapiz:=false;
goma:=true;
Image1.Canvas.Pen.Width:=10;
Image1.Canvas.Pen.Color:=clwhite;
end;


procedure TForm4.BtnLapizClick(Sender: TObject);
begin
 Image1.Canvas.Pen.Width:=2;
 GrosorLinea.Text:='2';
 goma:=false;
 lapiz:=true;
 Image1.Canvas.Pen.Color:=clred;
end;


procedure TForm4.BtnLimpiarClick(Sender: TObject);
begin
Image1.Picture:=nil;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
pulsado:=false;
lapiz:=false;
goma:=false;
end;

procedure TForm4.GrosorLineaChange(Sender: TObject);
var
 n:integer;
begin
  n:=strtoint(GrosorLinea.Text);
  Image1.Canvas.Pen.Width:=n;
end;

procedure TForm4.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
pulsado:=true;
CorX:=x;
CorY:=y;
Image1.Canvas.MoveTo(CorX,CorY);
end;






procedure TForm4.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      if (pulsado and (lapiz or goma)) then
    begin
      Image1.Canvas.LineTo(x,y);
    end

end;

procedure TForm4.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 pulsado:=false;
end;

procedure TForm4.PaletaColoresMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
col:=paletaColores.Canvas.Pixels[x,y];
   Image1.Canvas.Pen.Color:=col;

end;

end.
