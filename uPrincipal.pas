unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, classe.Nota, Vcl.StdCtrls, System.Generics.Collections,
  classe.ItemNota, System.DateUtils, Vcl.ExtCtrls, Vcl.Samples.Spin;

type //Pequena Classe apenas para a ação do botão  --> Button3Click
 TItens = class
  private
  public
   campo1 : String;
   campo2 : String;
end;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edtItem: TEdit;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    Button3: TButton;
    Bevel2: TBevel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
  private
    procedure criaItems_Lista(ListaItens: System.Generics.Collections.TDictionary<string, TItens>; var Itens: TItens);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  nota : TNota;

implementation




{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   item : TItem;
   i    : Integer;
   msg  : String;
begin
   try
      if not assigned(nota) then
         nota := TNota.Create;

      nota.Chave := '00001';
      nota.Data  := '01/01/2020';

      for I := 1 to SpinEdit1.Value  do
      begin

         item := TItem.Create;

         item.Cod_item := I;
         item.Descricao := 'Item '+ IntToStr(I);
         item.Valor_item := Random(100);

         nota.AdicionaItem(item,msg);
      end;

   finally
      msg := '';
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   vitem : TItem;
begin
   try
      vitem := nil;

      if assigned(nota) then
      begin

         vitem := nota.RetornaItem(
                                   StrToInt(edtItem.Text),
                                   vitem
                                  );


         if assigned(vitem) then
            showmessage(' Item Código : '    + IntToStr(vitem.Cod_item)     + #13 +
                        ' Item Valor : '     + FloatToStr(vitem.Valor_item) + #13 +
                        ' Item Descrição : ' + vitem.Descricao)

         else
            showmessage(' Código : '+ edtItem.Text + ' não existe na lista.');

      end else
          showmessage(' Lista de Itens não criada.');

   finally
   end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  ListaItens : TDictionary<String, TItens>;
  Itens,itens_resultado : TItens;
begin
   try
      ListaItens := TDictionary<String,TItens>.Create;

      //Criando Itens e preenchendo a lista  --> ListaItens
      criaItems_Lista(ListaItens, Itens);

      //Procurando na lista de Itens pelo indice -- 'Teste2 Campo1 | Segundo Item'
      ListaItens.TryGetValue( 'Primeiro Item | Campo 1', itens_resultado);

      if assigned(itens_resultado) then
         //showmessage(itens_resultado.campo1 + #13 + itens_resultado.campo2)
      else
         showmessage('Item não localizado');

   finally

      for Itens in ListaItens.Values do
         Itens.Free;

      ListaItens.Free;
   end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   if Assigned(nota) then
      FreeAndNil(nota);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Assigned(nota) then
      FreeAndNil(nota);
end;

procedure TForm1.criaItems_Lista(ListaItens: System.Generics.Collections.TDictionary<string, TItens>; var Itens: TItens);
begin

  Itens := TItens.Create;

  //primeiro item
  Itens.campo1 := 'Primeiro Item | Campo 1';
  Itens.campo2 := 'Primeiro Item | Campo 2';

  if not ListaItens.ContainsKey(Itens.campo1) then
     ListaItens.Add(Itens.campo1, Itens);

  Itens := TItens.Create;

  //segundo item
  Itens.campo1 := 'Segundo Item | Campo 1';
  Itens.campo2 := 'Segundo Item | Campo 2';

  if not ListaItens.ContainsKey(Itens.campo1) then
     ListaItens.Add(Itens.campo1,Itens);
end;

end.
