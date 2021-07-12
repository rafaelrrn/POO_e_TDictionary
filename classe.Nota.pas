unit classe.Nota;

interface

uses classe.ItemNota, System.Generics.Collections, System.SysUtils;

type
  TNota = class
  private

    FChave: String;
    FData: String;
    FValorTotal: Double;
    FItems : TObjectDictionary<Integer, TItem>;

    procedure SetChave(const Value: String);
    procedure SetData(const Value: String);
    procedure SetValor(const Value: Double);

  published

    constructor Create;
    Destructor Destroy; override;

    property Chave : String read FChave write SetChave;
    property Data : String read FData write SetData;
    property ValorTotal : Double read FValorTotal write SetValor;

  public
    function AdicionaItem(item: TItem;  out msg: String): Boolean;
    function RetornaItem(cod_item: Integer; item: TItem): TItem;
    function RetornaItem2(cod_item: Integer; item: TItem): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;

{ TNota }

function TNota.AdicionaItem(item: TItem;  out msg: String): Boolean;
begin
   try
      Result := true;
      FItems.AddOrSetValue(item.Cod_item, item); //Adiciona ou atualiza
      {if not FItems.ContainsKey(item.Cod_item) then   // Só adiciona se não encontrar
         FItems.Add(item.Cod_item, item);}
   except on
      e:Exception do
      begin
         msg := 'Erro '+ E.message;
         Result := false;
      end;
   end;
end;

constructor TNota.Create;
begin
   FItems := TObjectDictionary<Integer, TItem>.Create([doOwnsValues]);
end;

destructor TNota.Destroy;
begin
   FreeAndNil(FItems);
   inherited;
end;

function TNota.RetornaItem2(cod_item: Integer; item: TItem): Boolean;
begin
   try
      if FItems.ContainsKey(cod_item) then
      begin
         if (FItems.TryGetValue(cod_item, item)) then
            result := true;

      end else
         result := false;

   except on
      e:Exception do
      begin
         result := false;
         showmessage(E.message);
      end;
   end;
end;


function TNota.RetornaItem(cod_item: Integer; item: TItem): TItem;
begin
   try
      if FItems.ContainsKey(cod_item) then
      begin
         if (FItems.TryGetValue(cod_item, item)) then
            result := item;

      end else
         result := item;

   except on
      e:Exception do
      begin
         showmessage(E.message);
      end;
   end;
end;

procedure TNota.SetChave(const Value: String);
begin
  FChave := Value;
end;

procedure TNota.SetData(const Value: String);
begin
  FData := Value;
end;

procedure TNota.SetValor(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
