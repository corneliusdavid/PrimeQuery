namespace PrimeQueryTest;

interface

uses
  RemObjects.Elements.EUnit,
  PrimeQuery;

type
  PrimeEditTestClass = public class(Test)
  private
    method FirstTest;
    FPrimeNumEdit: PrimeNumberEdit;
  public
    method Setup; override;
    method TestClear;
    method TestClearZero;
    method TestClearOne;
    method TestClear999;
    method TestAddDigit;
    method TestAddDigitToZero;
    method TestAddDigitToOne;
    method TestAddDigitToNine;
    method TestAddDigitTo999;
    method TestBackspace;
    method TestBackspaceZero;
    method TestBackspaceOne;
    method TestBackspace9;
    method TestBackspace10;
    method TestBackspace11;
    method TestBackspace999;
    method TestInc;
    method TestIncZero;
    method TestIncOne;
    method TestIncNine;
    method TestIncTen;
    method TestInc999;
    method TestDec;
  end;

implementation

method PrimeEditTestClass.FirstTest;
begin
  Assert.IsTrue(true);
end;

method PrimeEditTestClass.Setup;
begin
  FPrimeNumEdit := new PrimeNumberEdit;
end;

method PrimeEditTestClass.TestClear;
begin
  FPrimeNumEdit.Number := 123;
  FPrimeNumEdit.Clear;
  Assert.IsTrue(FPrimeNumEdit.Number = 0);
end;

method PrimeEditTestClass.TestClearZero;
begin
  FPrimeNumEdit.Number := 0;
  FPrimeNumEdit.Clear;
  Assert.IsTrue(FPrimeNumEdit.Number = 0);
end;

method PrimeEditTestClass.TestClearOne;
begin
  FPrimeNumEdit.Number := 1;
  FPrimeNumEdit.Clear;
  Assert.IsTrue(FPrimeNumEdit.Number = 0);
end;

method PrimeEditTestClass.TestClear999;
begin
  FPrimeNumEdit.Number := 999;
  FPrimeNumEdit.Clear;
  Assert.IsTrue(FPrimeNumEdit.Number = 0);
end;

method PrimeEditTestClass.TestAddDigit;
begin
  FPrimeNumEdit.Number := 12;
  FPrimeNumEdit.AddDigit(3);
  Assert.IsTrue(FPrimeNumEdit.Number = 123);

  FPrimeNumEdit.Number := 12;
  FPrimeNumEdit.AddDigit('3');
  Assert.IsTrue(FPrimeNumEdit.Number = 123);
end;

method PrimeEditTestClass.TestAddDigitToZero;
begin
  FPrimeNumEdit.Number := 0;
  FPrimeNumEdit.AddDigit(4);
  Assert.IsTrue(FPrimeNumEdit.Number = 4);

  FPrimeNumEdit.Number := 0;
  FPrimeNumEdit.AddDigit('4');
  Assert.IsTrue(FPrimeNumEdit.Number = 4);
end;

method PrimeEditTestClass.TestAddDigitToOne;
begin
  FPrimeNumEdit.Number := 1;
  FPrimeNumEdit.AddDigit(8);
  Assert.IsTrue(FPrimeNumEdit.Number = 18);

  FPrimeNumEdit.Number := 1;
  FPrimeNumEdit.AddDigit('8');
  Assert.IsTrue(FPrimeNumEdit.Number = 18);
end;

method PrimeEditTestClass.TestAddDigitToNine;
begin
  FPrimeNumEdit.Number := 9;
  FPrimeNumEdit.AddDigit(1);
  Assert.IsTrue(FPrimeNumEdit.Number = 91);

  FPrimeNumEdit.Number := 9;
  FPrimeNumEdit.AddDigit('1');
  Assert.IsTrue(FPrimeNumEdit.Number = 91);
end;

method PrimeEditTestClass.TestAddDigitTo999;
begin
  FPrimeNumEdit.Number := 999;
  FPrimeNumEdit.AddDigit(2);
  Assert.IsTrue(FPrimeNumEdit.Number = 9992);

  FPrimeNumEdit.Number := 999;
  FPrimeNumEdit.AddDigit('2');
  Assert.IsTrue(FPrimeNumEdit.Number = 9992);
end;

method PrimeEditTestClass.TestBackspace;
begin
  FPrimeNumEdit.Number := 123;
  FPrimeNumEdit.Backspace;
  Assert.IsTrue(FPrimeNumEdit.Number = 12);
end;

method PrimeEditTestClass.TestBackspaceZero;
begin
  FPrimeNumEdit.Number := 0;
  FPrimeNumEdit.Backspace;
  Assert.IsTrue(FPrimeNumEdit.Number = 0);
end;

method PrimeEditTestClass.TestBackspaceOne;
begin
  FPrimeNumEdit.Number := 1;
  FPrimeNumEdit.Backspace;
  Assert.IsTrue(FPrimeNumEdit.Number = 0);
end;

method PrimeEditTestClass.TestBackspace9;
begin
  FPrimeNumEdit.Number := 9;
  FPrimeNumEdit.Backspace;
  Assert.IsTrue(FPrimeNumEdit.Number = 0);
end;

method PrimeEditTestClass.TestBackspace10;
begin
  FPrimeNumEdit.Number := 10;
  FPrimeNumEdit.Backspace;
  Assert.IsTrue(FPrimeNumEdit.Number = 1);
end;

method PrimeEditTestClass.TestBackspace11;
begin
  FPrimeNumEdit.Number := 11;
  FPrimeNumEdit.Backspace;
  Assert.IsTrue(FPrimeNumEdit.Number = 1);
end;

method PrimeEditTestClass.TestBackspace999;
begin
  FPrimeNumEdit.Number := 999;
  FPrimeNumEdit.Backspace;
  Assert.IsTrue(FPrimeNumEdit.Number = 99);
end;

method PrimeEditTestClass.TestDec;
begin
  FPrimeNumEdit.Number := 123;
  FPrimeNumEdit.DecNumber;
  Assert.IsTrue(FPrimeNumEdit.Number = 122);
end;

method PrimeEditTestClass.TestInc;
begin
  FPrimeNumEdit.Number := 123;
  FPrimeNumEdit.IncNumber;
  Assert.IsTrue(FPrimeNumEdit.Number = 124);
end;

method PrimeEditTestClass.TestIncZero;
begin
  FPrimeNumEdit.Number := 0;
  FPrimeNumEdit.IncNumber;
  Assert.IsTrue(FPrimeNumEdit.Number = 1);
end;

method PrimeEditTestClass.TestIncOne;
begin
  FPrimeNumEdit.Number := 1;
  FPrimeNumEdit.IncNumber;
  Assert.IsTrue(FPrimeNumEdit.Number = 2);
end;

method PrimeEditTestClass.TestIncNine;
begin
  FPrimeNumEdit.Number := 9;
  FPrimeNumEdit.IncNumber;
  Assert.IsTrue(FPrimeNumEdit.Number = 10);
end;

method PrimeEditTestClass.TestIncTen;
begin
  FPrimeNumEdit.Number := 10;
  FPrimeNumEdit.IncNumber;
  Assert.IsTrue(FPrimeNumEdit.Number = 11);
end;

method PrimeEditTestClass.TestInc999;
begin
  FPrimeNumEdit.Number := 999;
  FPrimeNumEdit.IncNumber;
  Assert.IsTrue(FPrimeNumEdit.Number = 1000);
end;

end.
