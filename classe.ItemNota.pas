unit classe.ItemNota;

interface

type
  TItem = class
  private
    FCod_item: Integer;
    FValor_item: Double;
    FDescricao: String;
    procedure Setcod_item(const Value: Integer);
    procedure Setvalor_item(const Value: Double);
    procedure SetDescricao(const Value: String);
  published


    property Cod_item : Integer read FCod_item write Setcod_item;
    property Valor_item : Double read FValor_item write Setvalor_item;
    property Descricao : String read FDescricao write SetDescricao;
  end;

implementation

{ TItem }

procedure TItem.Setcod_item(const Value: Integer);
begin
  FCod_item := Value;
end;

procedure TItem.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TItem.Setvalor_item(const Value: Double);
begin
  FValor_item := Value;
end;

end.
