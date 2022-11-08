# Readme

# Microsoft AL Sintaxis

## Variables:

- All identifiers must be unique.
- When set the name to a variable is recomended start with '_' or a letter. 
- The language is not sensitive to lower and upper in identifiers names (Recomend use PascalCase).
- The variables need a identify, type, propuse and must be initialized.
- Varaible can be local or global, local: inside a procedure or trigger, global: out of that.
- **'Rec' and 'xRec' is used by the system language, Rec -> access to current record, xRec -> access to last record (before update).**
- Default numeric variable type is 0.
- Default text variable is empty.
- Default boolean variable is false.

**Variable Declaration:**

```
  - var
  - myInt, nextInt, thirdInt : Integer; //this 3 var's as integer
  - isValid, doCheck : Boolean; // this 2 var's as boolean
```

**Protected Variable:**
  - protected var
  - myInt: Integer

## **Fundamentals Data Types**
- **Numeric**
  - Action (no available to tables)
    - Ok
    - Cancel
    - LookupOk
    - lookupCancel
    - Yes
    - No
    - RunObject
    - RunSystem
  - Integer
  - BigInteger
  - Decimal
  - Option 
  - Char (ASCII from 0 to 255)
  - Byte
  - Duration
- **String**
  - Text
  - Code
- **Boolean**
- **Date**
- **Time**
- **DateTime**
## **Complex Data Types**
This data types can be store multiple values
- BigText
- BLOB
- CodeUnit
- DateFormula
- Dialog
- File
- Fieldref
- GUID
- InStream y OutSream
- KeyRef
- Page
- Query
- Record
- RecordID
- RecordRef
- Report
- System
- TableFilter
- Variant
- List y Dictionary

## **Operations and numerations**

- **Option**
Is a enumerator so, the options will save as integer inside the option variable like:
```
var Color: Option Green,Red,Yellow;  
then
Color := Color::Red;
```
The options fields in a table can´t be extended with a table extension.

- **Enum** 

The Enum is also to enumerate options and can be extended like:

```
enum 50100 Color
{
    Extensible = true;

    value(0; Green)
    {
        Caption = 'Green';
    }
    value(1; Red)
    {
        Caption = 'Red'
    }
    value(1; Yellow)
    {
        Caption = 'Yellow'
    }
}

var MyFavoriteColor: **Enum** Color; //This set MyFavoriteColor variable as type Enum Color
begin
    MyFavoriteColor := Color:Red;
    Message('Selected Color is: %1', MyFavoriteColor);
end;
```

-   **Collections**

AL have 3 collection types
- Array ->  
  - Identifier
  - Data type
  - One or more elements
  - One index
  - A dimension
    ```
    SalesAmount: array[10] of Integer;
    ```
    To enter to element:
    ```
    SalesAmount[5] := 0;
    ```
    #### **In AL starts counting at 1 for any array**
    For multidimensional array 
    ```
    SalesAmount: array[6,9] of Integer;
    SalesAmount[5,3] := 0;
    ```

- List

    Just can be use with fundamental type, this type 
    use System.Collections.Generic.List<T> Class form .NET Framework, so you can use some their methods.
    ```
    procedure AddCustomerNames()
    var
        CustomerNames: List of [Text];
    begin
        CustomerNames.Add('Paul');
        CustomerNames.Add('Linda');
        Message(CustomerNames.Get(1));//Result 'Paul'
    end;
    ```

- Dictionary

    This type use System.Collections.Generic.Dictionary<TKey, TValue> of .Net Framework, this type represent a collection of keys and values
    procedure AddCustomerNames()
    ```
    var    
        CustomerNames2: List of [Text];
        CountriesDictionary: Dictionary of [Code[20], List of [Text]];//Code is a string type

        CustomerNames2.Add('Eddy');
        CustomerNames2.Add('Mark');
        CountriesDictionary.Add('US', CustomerNames);
        CountriesDictionary.Add('CA', CustomerNames2);

        Message(CountriesDictionary.Get('US').Get(2));
        //Result in 'Linda'
    begin       
    ```
## **Use assignments and type conversions**

You can set a value to a variable or the statement will asign a value to a variable.
You can asign with ':='

```
var 
    MyInt: Integer;
    A: Integer;
    B: Integer;
begin    
    A := 2;
    B := 3;
    MyInt := A + B;
end;
```
Description was assigned to the variable Code. Because the variable Code is of data type Code, it will automatically convert all lowercase letters to uppercase, and it will remove all leading and trailing spaces

Just string and numeric types allow automatic type **conversion**
```
var
    Description: Text[20];
    Code: Code[20];
begin
    Description = ' Hello World ';
    Code := Description;
    //Return 'HELLO WORLD'
    //Code delete start and finish blank spaces and convert to upper.
```
The value needs to be within the range of the variable. You can't assign a BigInteger value to an Integer data type if it exceeds the range of the integer.

## **Different expression types**

With a unary operator, the operator impacts the term that directly follows it. A binary operator impacts on either side of the operator.
Can be categorized by:
- Unary
  - (+)
  - (-)
  - NOT
   ```
   var
    CustomerExists: Boolean;
    MyBoolean: Boolean;
   begin
    CustomerExists := true;
    MyBoolean =: NOT CustomerExists;
    // Will result in MyBoolean: false 
    end; 
    ```

- String 
    
    Only (+) because concatenate two string in one
    ```
    Var
        MyText: Text[50];
    begin
        MyText := 'Wo' + 'rd'//Result is 'Word'
    end;
    ```
- Arithmetic

    Arithmetic operators are used in numeric expressions. A numeric expression is a formula that results in a numeric value.
    The following arithmetic operators are available:

    - Plus (+)
    - Minus (-)
    - Times (*)
    - Divide (/)

    If you divide two integer values, you'll always end with a Decimal value.

    Integer divide (DIV)

    The integer divide (DIV) operator is returning the integer quotient of the integer division. It's a binary operator that results in an integer value. You can calculate the result of an integer divide by dropping all the decimals of the result.

    ```
    17 DIV 8 = 2  // The decimal portion .125 is dropped
    17 DIV 9 = 1  // The decimal portion .88 is dropped
    ```

    Modulus (MOD)
    The modulus finds the remainder of the division of one number by another number.
    ```
    5 MOD 2 = 1   5 = (2x2) + 1
    17 MOD 9 = 8   17 = (9x1) + 8
    ```
- Relational

    The following Relational expressions are available:
    - = (equal to)
    - < (less than)
    - > (greater than)
    - <= (less than or equal to)
    - >= (greater than or equal to)
    - <> (not equal to)
    - IN (include in set)

    - Numeric comparisons - Numeric comparisons are clear; they compare on the numeric value.
    - String comparisons - Strings are compared with the Unicode date to determine which value comes first.
    - Date and time comparisons - The calendar is used to determine which value comes first.
    - Boolean comparisons - The false value will come before the true value.

    The Set Inclusion (with the IN operator) is a list of values:
    ```    
    5 IN [2,4,6,8,10] is FALSE
    5 IN [1..9,11..19] is TRUE
    5 IN [2,4..6,8,10] is TRUE
    10 IN [1..9,11..19] is FALSE
    'M' IN ['A'..'Z'] is TRUE
    ```

- Logical expresions
    
    The following logical expressions are available:
    - AND
    - OR
    - XOR 
    - NOT

## **Instructions**
- **Comment**

    //This is a comment    
    /* This is a comment */

    ///<'summary'>
    /// This property always returns a value &lt; 1.
    /// 
    ///<'/summary'>
    
## **Compoud**

    ```
    begin
        statement 1;
        statement 2;
        statement 3;
        ...
    end;
    ```
## **Conditional**

    ```
    if a > b then
        c := a - b;

    //Or:

    if a > b then begin
        c := a - b;
        Message('%1', c);
    end;
    ```

    - If-Else Sentence:

    ```
    if a > b then
        c := a - b
    else
        c := a + b;
    
    //Or:

    if a > b then begin
        c := a - b;
        Message('%1', c);
    end
    else begin
        c := a + b;
        Message('%1', c);
    end;
    ```
    - Nested If
    ```
    begin
    if Amount <> 0 then
        if Amount > 0 then
            Sales := Sales + Amount
        else
            if Reason = Reason::Return then
                if ReasonForReturn = ReasonForReturn::Defective then
                    Refund := Refund + Amount
                else
                    Credits := Credits + Amount
            else
                Sales := Sales - Amount;
    end;
    ```
    - Case Statement

    The case statement can use an else block that will be run when no other blocks are run. Because you can only run one statement for each block with a case statement, you have to use compound statements to run more statements simultaneously.   
    Depending on the value of Document Type the case statement will run some statements.
    ```
    var
        a: Integer;
    begin
        case "Document Type" of
            "Document Type"::Quote:
                a := 1 + 1;
            "Document Type"::Order:
                a := 2 + 1;
            "Document Type"::Invoice:
                begin
                    // Some statement 1;
                    // Some statement 2;
                    // Some statement 3;
                    a := 3 + 1;
                end;
            "Document Type"::"Return Order":
                if Reason = Reason::Return then begin
                    // Some statement 1;
                    // Some statement 2;
                    // Some statement 3;
                    a := 4 + 1;                
                end;
        else
            a := 5 + 1;//Last option 
        end;
    end;
    ```
    - Preprocessor Directives in AL

        The following conditional preprocessor directives are supported in AL.

        - #if - Specifies the beginning of a conditional clause. The #endif clause ends it. Compiles the code between the directives if the specified symbol being checked is defined.
        - #else - Specifies a compound conditional clause. If none of the preceding clauses evaluates to true, the compiler will evaluate code between #else and #endif.
        - #elif - Combines else and if. If #elif is true the compiler evaluates all code between #elif and the next conditional directive.
        - #endif - Specifies the end of a conditional clause that begins with #if.
        - #define - Defines a symbol that can be used to specify conditions for a compilation. For example, #define DEBUG. The scope of the symbol is the file that it was defined in.
        - #undef - Undefines a symbol.

        Symbols can be defined globally in the app.json file. A symbol can also be defined using the #define directive in code, but if symbols are defined in the **app.json** file, they can be used globally.
        ```
        "preprocessorSymbols": [ "DEBUG" ]
        ```

        al-code using DEBUG symbol
        ```
        #if DEBUG
            trigger OnOpenPage()
            begin
                Message('Only in debug versions');
            end;
        #endif
        ```

        There is a new suppressWarnings property in the app.json manifest so that you can suppress a comma-separated list of warning IDs when you compile the extension:

        ```
        "suppressWarnings": [Warning ID,Warning ID2,...]
        ```

        Local
        Directives is a new construct in the AL language that specifies how the AL compiler treats an enclosed section of code. The same concept is known in other languages. The specific directive instructions must be supported by the compiler. You can't create custom preprocessing instructions.

        One of the new directives is a warning pragma, which you can set around a code section to suppress a comma-separated list of warnings only in that enclosure.
        If no end pragma closure is provided, it will be the rest of the file.

        ```
        #pragma warning disable warning-list
        #pragma warning restore warning-list
        ```

## **Repetitive Sentences**

if you want to stop the cycle use the **break** expression
  - For-to-do

        
        var
            intCount: Integer;
            total: Integer;
        begin
            for intCount := 1 to 5 do
                total := total + 3;
        end;

        //Or:

        var
            intCount: Integer;
            numberOfLoops: Integer;
            total: Integer;
        begin
            numberOfLoops := 5;
            for intCount := 1 to numberOfLoops do
                total := total + 3;
        end;
        

- For-downto-do

        
        var
            intCount: Integer;
            totalSales: Integer;
            numberSales: Integer;
            sales: array[5] of Integer;
        begin
        GetSales(sales);

            for intCount := 5 downto 1 do begin
                totalSales := totalSales + sales[intCount];
                numberSales := numberSales + 1;
            end;
        end;
        
        
- Foreach-in-do


        var
            stringList: List of [Text[20]];
            stringItem: Text[20];
        begin
            foreach stringItem in stringList do
                Message(stringItem);
        end;


- While-do
        
        var
            index: Integer;
            totalSales: Integer;
            sales: array[5] of Integer;
        begin
            GetSales(sales);
            while totalSales < 8 do begin
                index := index + 1;
                totalSales := totalSales + sales[index];
            end;
        end;
        ```
- Repeat-until

    ```
    var
        index: Integer;
        totalSales: Integer;
        sales: array[5] of Integer;
    begin
        GetSales(sales);
        repeat
            index := index + 1;
            totalSales := totalSales + sales[index];
        until totalSales >= 8;
    end;

    //Or:

    var
        myTable: Record MyTable;
    begin
        myTable.FindSet();
        repeat
            myTable.Amount := 100;
        until myTable.Next() = 0;
    end;
    ```    

- With Statement

    This statement reduce the use of your recrod variables:
    ```
    var
        myTable: Record MyTable;
    begin
        myTable."No." := 1;
        myTable.Amount := 100;
        myTable.Credits := 10;
        myTable."Document Type" := myTable."Document Type"::Invoice;
        myTable.Reason := myTable.Reason::Return;
        myTable.Refund := 100;
    end;   

    //Instead you can write this (Not recomended use),
    var
        myTable: Record MyTable;
    begin
        with myTable do begin
            "No." := 1;
            Amount := 100;
            Credits := 10;
            "Document Type" := "Document Type"::Invoice;
            Reason := Reason::Return;
            Refund := 100;
        end;
    end;

    // Safe version
    codeunit 50140 MyCodeunit
    {
        procedure DoStuff()
        var
            Customer: Record Customer;
        begin
            // Do some work on the Customer record.
            Customer.Name := 'Foo';

            if IsDirty() then 
                Customer.Modify();
        end; 

        local procedure IsDirty(): Boolean;
        begin
            exit(false);
        end;
    }
    ``` 
**The procedures with the same name in differents files have priority??**

## **Pages**

    page 50143 ImplicitWith
    {
        SourceTable = Customer;

        layout
        {
            area(Content)
            {
                field("No."; "No.") { }
                field(Name; Name)
                {
                    trigger OnValidate()
                    begin
                        Name := 'test';
                    end;
                }
            }
        }

        trigger OnInit()
        begin
            if IsDirty() then Insert()
        end;

        local procedure IsDirty(): Boolean
        begin
            exit(Name <> '');
        end;
    }

## **Interaction functions**

- Message
    Is used to comunicate information to users

    ```
    Message(string [,Value1, ...]);
    Message('Hello World');

    //Or:

    var
        MyInt: Integer;
        TheValueOfTxt: Label 'The value of %1 is %2';
    begin
        MyInt := 5;
        Message(TheValueOfTxt, 'MyInt', MyInt);
        // Displays: The value of MyInt is 5
    end;
    ```
- Confirm

    You can use the Confirm function based on a string, which is generated from the question that you ask the user. The message is displayed with a Yes and a No button.
    ```
    Ok := Dialog.Confirm(string [,Default] [,Value1, ...]);

    //If clause:

    if Confirm('Are you sure you want to delete?') then
        Message('OK')
    else
        Message('Not OK');

    //No button have the default focus, add false as a parameter:

    if Confirm('Are you sure you want to delete?', false) then
        Message('OK')
    else
        Message('Not Ok');
    ```

- StrMenu

    Can be used to ask people for information and provide them with a selection of choices.

    ```
    OptionNumber := StrMenu(OptionString [,DefaultNumber] [,Instruction]);

    //The following example shows the StrMenu function being used
    var
        Days: Text[50];
        Selection: Integer;
    begin
        Days := 'Monday,Tuesday,Wednesday,Thursday,Friday';
        Selection := StrMenu(Days, 1, 'Which day is today ?');
        Message('You selected %1.', Selection); //Show the message and selection
    end;
    //If the user selects Wednesday, the system will display: You selected 3.
    ```
- Error

    If something goes wrong, or certain conditions aren't met while you are processing code, you can use the Error message to notify the user.
    ```
    Error(String [,Value1, ...]);
    //
    MESSAGE('1');
    MESSAGE('2');
    ERROR('OOPS !');
    MESSAGE('3');
    //After the error message, the system stops running code. The fourth message with the text 3 is never displayed.
    ```
## **String Functions**
AL supports a number of string functions, but it also supports the same functions that are available as the .NET string class.
You don't need .NET Interoperability to use these functions; they are built into AL language.

- StrPos and IndexOf

    With the StrPos function, you can find the position of a substring within a string.
    ```
    var 
        MyLongString: Text[50];    
    begin
        MyLongString := 'HelloWorldOfManyManyCharacters';
        Message('%1', StrPos(MyLongString, 'l'));  // Results in 3
    end;

    //Or:

    var 
        MyLongString: Text[50];    
    begin
        MyLongString := 'HelloWorldOfManyManyCharacters';
        Message('%1', MyLongString.IndexOf('l'));  // Results in 3
    end;
    ```
- CopyStr and Substring
    
    With the CopyStr function, you can copy a substring from text or code. The function has three parameters, where the last one is optional.
    ```
    var
        MyLongString: Text[50];
        newString: Text[10];
    begin
        MyLongString := 'HelloWorldOfManyManyCharacters';
        newString := CopyStr(MyLongString, 5, 10);
        Message('%1', newString);  // Results in 'oWorldOfMa'
    end;
    ```
- SelectStr and Split

    The SelectStr function returns a string from comma-separated text.
    ```
    var
        MyLongString: Text[50];
        newString: Text;
    begin
        MyLongString := 'This,is a comma,separated,string';
        newString := SelectStr(2, MyLongString);
        Message('%1', newString);  // Results in 'is a comma'
    end;

    //.NET Split():
    newString := MyLongString.Split(',').Get(2);
    Message('%1', newString);  // Results in 'is a comma'
    ```
- InsStr

    The InsStr function will insert a string to a certain position in an existing string.
    ```
    var
        MyLongString: Text[50];
        newString: Text;
    begin
        MyLongString := 'Press ENTER to continue.';
        newString := InsStr(MyLongString, 'or ESC ', 13);
        Message('%1', newString);  // Results in 'Press ENTER or ESC to continue.'
    end;
    ```
- StrLen and MaxStrLen

    The StrLen and MaxStrLen functions are used to determine the length of text fields and the maximum length of the text field.
    If you have a variable of type Text[50], the MaxStrLen will be 50, even though the content has only 10 characters. The StrLen will return 10.
    ```
    var
        MyLongString: Text[50];
        newString: Text[10];
    begin
        MyLongString := GetLongString();
        Message('STRLEN: %1', StrLen(MyLongString)); // Results in 30 
        Message('MAXSTRLEN: %1', MaxStrLen(MyLongString)); // Results in 50 
        newString := CopyStr(MyLongString, 5, MaxStrLen(newString));
        Message('%1', newString);  // Results in 'oWorldOfMa'
    end;
    ```
- LowerCase, UpperCase, ToLower, and ToUpper

    If you want to change the case of a text variable, you can use the LowerCase and UpperCase functions or the ToLower and ToUpper .NET functions.

- IncStr

    Is used to increment a number within a string. If that number is negative, it will be decreased by one.
    ```
    text000 := 'Account no. 99 does not balance.';

    Message(IncStr(text000));
    // Results in: 'Account no. 100 does not balance.'
    ```
## **Other .Net String Functions**
AL supports some string functions from the .NET string class:

- Contains - Checks if a string contains a character or substring.

- EndsWith - Checks if a string ends with a specific value.
- IndexOf - Gets the first index of a character or string. Returns zero if none is found.
- IndexOfAny - Gets the first index of any of the characters. Returns zero if none is found.
- LastIndexOf - Gets the last index of a character or string. Returns zero if none is found.
- PadLeft - Right-aligns the characters in the instance by padding them on the left for a specified total length. You can specify which character is used for padding.
- PadRight - Left-aligns the characters in the instance by padding them on the right for a specified total length. You can specify which character is used for padding.
- Remove - Removes a substring from a text.
- Replace - Replaces a substring from a text.
- Split - Splits text on one or more characters.
- StartsWith - Checks if a string starts with a specific value.
- Substring - Returns a part of the string, starting on a specific index with a certain length.
- ToLower - This function will change all characters to lowercase.
- ToUpper - This function will change all characters to uppercase.
- Trim - Removes all leading and trailing blank spaces.
- TrimEnd - Removes all trailing occurrences of a set of characters.
- TrimStart - Removes all leading occurrences of a set of characters.

## **Date Functions**

The **Today** and **Time** date functions return the current date and time. The **WorkDate** function returns the work date that is set in the application.
The frequently used date functions are:

- Date2DMY

    Helps you get specific parts out of a certain date.
    The What parameter specifies what the function should return.
    1 - Corresponds to Day (1-31)
    2 - Corresponds to Month (1-12)
    3 - Corresponds to Year

    ```
    // TODAY IS 04/17/2020
    Message('%1', Today()) ;
    // Displays : 04/17/2020

    MyDatePart := Date2DMY(Today(), 1) ;
    Message('%1', MyDatePart) ;
    // Displays : 17

    MyDatePart := Date2DMY(Today(), 2) ;
    Message('%1', MyDatePart) ;
    // Displays : 4
    ```
- Date2DWY

    The What parameter specifies what the function should return.
    1 - Corresponds to Day of the week (1-7, Monday = 1)
    2 - Corresponds to the Week number (1-53)
    3 - Corresponds to Year
    ```
    // TODAY IS 04/17/2020
    Message('%1', Today()) ;
    // Displays : 04/17/2020

    MyDatePart := Date2DWY(Today(), 1) ;
    Message('%1', MyDatePart) ;
    // Displays : 5

    MyDatePart := Date2DWY(Today(), 2) ;
    Message('%1', MyDatePart) ;
    // Displays : 16
    ```


- CalcDate

    Calculate new dates, starting from a certain date.
    In the DateExpression parameter, you can provide how many days (D), weeks (W), months (M), quarters (Q), or years (Y) that you want to add or subtract. 
    ```
    // TODAY IS 04/17/2020
    Message('%1', Today()) ;
    // Displays : 04/17/2020

    Message('%1', CalcDate('1W', Today())) ;
    // Displays : 04/24/2020
    ```

## **Numeric Functions**

Numeric functions include:

- Round

    The Round function helps you to round a number. As a parameter, you can provide the precision and the direction.

    The Direction parameter is a text data type, and can have these values:

    - '=' - Rounds up or down to the nearest value (default). Values of five or greater are rounded up; values less than five are rounded down.

    - '>' - Rounds up.

    - '<' - Rounds down.
    ```
    NewNumber := Round(1234.56789, 0.001, '>');
    Message('%1', NewNumber);
    // Displays : 1,234.568
    ```
- Abs 
    The Abs function will calculate the absolute value of a number. The absolute value of a number returns a positive numeric value or zero.
    ```    
    NewNumber := Abs(-10.235);
    Message(\'%1\', NewNumber);
    // Displays : 10.235
    ```

- Power

    The Power function is used to raise a number to a power. For example, you can use this function to square the number 2 to get a result of 4.

    ```
    NewNumber :=  System.Power(Number: Decimal, Power: Decimal)

    //Example:
    var
        Number1: Decimal;
        Power1: Decimal;
        Result1: Decimal;
        Text000: Label '%1 raised to the power of %2 = %3';
    begin
        Number1 := 64;   
        Power1 := 0.5;  
        Result1 := POWER(Number1, Power1);  
        MESSAGE(Text000, Number1, Power1, Result1);
    end;
    ```
- Random & Randomize

    The Random function is used to create a new random number.
    Before running the Random function, you can also run the Randomize function, with a seed value.
    If you don't specify a seed value, it will use the data from the system clock as a seed value.

    The Random function takes a parameter that specifies the largest acceptable number. It will return a number between one and the MaxNumber value. If MaxNumber is zero, this function will always return 1.

    ```
    Randomize([Seed])
    Number := Random(MaxNumber);
    ```

## **Array functions**

- ArrayLen

    ``` 
    SaleAmount[1] := 1;
    SaleAmount[2] := 2;
    SaleAmount[3] := 3;
    SaleAmount[1] := 10;

    Length := ArrayLen (SaleAmount);
    Message('%1', Length);
    // Displays : 3 
    ```
- CompressArray

    he CompressArray function moves all non-empty strings in an array to the beginning of the array.

    ```
    MyArray: array[4] of Text[20];

    MyArray[1] := 'Paris';
    MyArray[2] := 'Rome';
    MyArray[3] := '';
    MyArray[4] := 'New York City';
    CompressArray(MyArray);

    /* Results :
    MyArray[1] = 'Paris';
    MyArray[2] = 'Rome';
    MyArray[3] = 'New York City';
    MyArray[4] = ''; 
    */
    ```
*/
- CopyArray

    This will create a new array based on an existing one.
    You can provide a starting position and, optionally, a length.
    // CopyArray(NewArray, Array, Position [, Length]);
    ```
    MyArray1: array[10] of Integer;
    MyArray2: array[5] of Integer;

    MyArray1[1] := 1;
    MyArray1[2] := 2;
    MyArray1[3] := 3;
    MyArray1[4] := 4;
    MyArray1[5] := 5;
    MyArray1[6] := 6;
    MyArray1[7] := 7;
    MyArray1[8] := 8;
    MyArray1[9] := 9;
    MyArray1[10] := 10;

    CopyArray(MyArray2, MyArray1, 6, 5);//Arayy copy, array original, start position, length.

    /* Results :
    MyArray2[1] = 6;
    MyArray2[2] = 7;
    MyArray2[3] = 8;
    MyArray2[4] = 9;
    MyArray2[5] = 10;
    */
    ```
## **List functions**

- Add(X)

    Adds an item X to the end of the list.

    ``` 
    myIntegerList.Add(5);  
    ```

- Contains(X) 
    
    Checks if an item X exists in the list    

    ``` 
    exists: Boolean;
    exists := myIntegerList.Contains(5);
    ```

- Get(index)

    Gets an item from the list by a certain index and returns that item.

    ``` 
    myInteger := myIntegerList.Get(3);
    ```

- Set(index, X)

    Updates an item in the list by a certain index.

    ``` 
    myTextList.Set(2, 'DYNAMICS 365 ');
    ``` 
     

- Insert(index, X)

    Inserts an item in the list on a certain index. 

    ```
    myTextList.Insert(3, '365 ');
    ```

- Remove(X)
    
    Removes the first occurrence of an item in the list based on the value of X.
    This function returns a Boolean value.
    ```
    if myTextList.Remove('HELLO ') then
        Message('HELLO WAS REMOVED');
    ```

- RemoveAt(index)
    Function removes the item on a certain index. This function returns a Boolean value.
    ```
    if myTextList.RemoveAt(2) then
        Message('Item at index 2 is removed.');
    ```

- Count(index)

    This function returns the number of items in a list.

    ```
    myTextList.Count();
    ```

- AddRange(X, [X], [X], ...)

    Adds multiple items to the list at the same time.

    ```
    myTextList.AddRange('HELLO ', 
    'DYNAMICS 365 ', 
    'BUSINESS ', 
    'CENTRAL'); 
    ```

- GetRange(index, count, List of [X])

    Retrieves a number of items (count), starting on a certain index.
    The result is a List of [X].
    ```
    myTextList.AddRange('HELLO ', 'DYNAMICS 365 ', 'BUSINESS ', 'CENTRAL');
    myNewTextList := myTextList.GetRange(2,2);
    // myNewTextList: 'DYNAMICS 365 ', 'BUSINESS '
    ```


- RemoveRange(index, count)

    Removes multiple items (count), starting on a certain index. This function returns a Boolean value.
    ```
    if myTextList.RemoveRange(2,2) then
        Message('Items removed.');
    ```

- IndexOf(X)

    Returns the index of the first occurrence of an item based on the value of X.
    ```
    index := myIntegerList.IndexOf(5);
    ```

- LastIndexOf(X)

    Returns the last index of an item based on the value of X.
    ```
    index := myIntegerList.LastIndexOf(5);
    ```

- Reverse
    Reverses the order of the elements in the list.
    ```
    myTextList.AddRange('HELLO ', 'DYNAMICS 365 ', 'BUSINESS ', 'CENTRAL');
    myTextList.Reverse();
    // myTextList: 'CENTRAL', 'BUSINESS ', 'DYNAMICS 365 ', 'HELLO '
    ```

# **System functions**

- UserID

    You can use the UserId function to know who is running code. 

    ```
    <Text> := UserId();
    ```
- CompanyName

   If you want to figure out the name of the company that the code is running in, you can use the CompanyName function.
    
    ```
    <Text> := CompanyName;
    ```
- Today

    Is another date function that you can use to get the current date from the operating system.
    ```
    <Date> := Today();
    ```
- Time

    Returns the current time from the operating system.
    ```
    <Time> := Time();
    ```

- WorkDate

    You can get or set the work date for the current session.
    ```
    <Date> := WorkDate();   // Get the work date
    WorkDate(<Date>);       // Set the work date
    ```

# **Variable Functions**

- Clear

    This function will reinitialize the default value to the variable.
    ```
    var
        myText: Text[20];
        myText := UserId;
    Clear(myText);      // Sets the variable myText to an empty string.
    ```

- ClearAll

    The ClearAll function resets all variables (except the Rec variable) to their default values. It also clears all keys and filters that have been set.

- Evaluate function
    Can use the Evaluate function to convert a variable of data type text (code or text) to another data type (that is not text).

- Format Function

    The Format function converts a data type to a text data type.
    ```
    var
        myText: Text[20];
        myInteger: Integer;

    myInteger := 3;
    myText := Format(myInteger);
    ```

# **Handle errors by using try methods**

A method that is designated as a try method has a Boolean return value (true or false), and has the OK:= MyTrymethod construction. 
A try method can't have a user-defined return value.

If a try method call doesn't use the return value, the try method will operate like an ordinary method and errors will be exposed as usual.

If a try method call uses the return value in an OK:= statement or a conditional statement such as if-then, errors will be caught. The try method will return as true if no error occurs and false if an error occurs.

- GetLastErrorText get errors generated by Business Central.

    To create a try method, you can add a method in the AL code of an object, such as a codeunit as usual, and then set the TryFunction Attribute.

 - **Try method**
 ```
 codeunit 50101 TryMethods
 {
    trigger OnRun()
    begin
        if MyTryMethod() then
            message('Everything went well');
        else
            message('Everything went wrong');
    end;

    [TryFunction]
    local procedure MyTryMethod()
    begin
        error('An error ocurred during the operation');
    end;
 }
 ```

 - **Collect errors**

    AL includes several methods, properties, and attributes that are designed specifically for the collectable errors feature.

- ErrorInfo.Create(String [, Boolean] [, var Record] [, Integer] [, Integer] [, String] [, Verbosity] [, DataClassification] [, Dictionary of [Text, Text]]) - Creates a new ErrorInfo object.

- ErrorInfo.Callstack() - Specifies a call stack where the ErrorInfo object was collected.

- ErrorInfo.Collectible([Boolean]) - Specifies whether the error is collectible by using ErrorBehavior.Collect.

- ErrorInfo.CustomDimensions([Dictionary of [Text, Text]]) - A set of dimensions, specified as a dictionary that relates to the error.

- ErrorInfo.FieldNo([Integer]) - Specifies the field ID that the error relates to.

- ErrorInfo.PageNo([Integer]) - Specifies the page number that the error relates to.

- ErrorInfo.RecordId([RecordId]) - Specifies the record ID of the record that the error relates to.

- ErrorInfo.SystemId([Guid]) - Specifies the system ID of the record that the error relates to.

- ErrorInfo.TableId([Integer]) - Specifies the table ID that the error relates to.


    The following methods are available on the System data type for handling collected errors. You can invoke these methods by using property access syntax.

- System.HasCollectedErrors() - Gets a value that indicates whether errors have been collected in the current error collection scope.

- System.GetCollectedErrors([Boolean]) - Gets all collected errors in the current collection scope.

- System.ClearCollectedErrors() - Clears all collected errors from the current collection scope.

**The ErrorBehavior attribute specifies the behavior of collectable errors inside the method scope. Adding [ErrorBehavior(ErrorBehavior.Collect)] to a procedure makes it possible to collect and handle errors that are raised in the scope of the procedure.**

# **Custom functions**
To create a new custom function, use the tprocedure snippet.

- GuiAllowed

    You can use this function to determine when certain parts of your code should be run, depending on whether a graphical user interface (GUI) is available or not.
    Using the GuiAllowed function, you can test if a GUI is available or not before requesting user input.

    This function is used in Business Central when your function can be called through the API service.
    ```
    if GuiAllowed then
        Message('Hello');
    ```
- local / global

    ```
    //Global, Available all public functions
    procedure MyFunction()

    //Local, This only is available from the same object
    local procedure MyFunction()

    //Internal, only access it from within the same extension
    internal procedure MyFunction()

    //Protected, only access it from within the defining object and host object
    protected procedure MyFunction()
    ```

# **Parameters**

To define a function with parameters, you need to separate all parameters with a semicolon in the function definition.

```
procedure MyFunction(Param1: Integer; Param2: Text[50])
```

- **Return of Function**

When you create a function, and the function has finished running its code, if you want your function to return something, you can use the exit statement.
```
exit(<expression>);

exit(param * param);

//Or

local procedure MyFunction() : Integer
var 
   myResult: Integer
begin
   myResult := Power(2, 3);
   exit(myResult);
end;
```

## **Parameter by Value**
```
trigger OnRun()
var
    myInteger : Integer;
    myResult : Integer;
begin
    myInteger := 23;
    myResult := MyFunction(myInteger);

    Message('myInteger: %1', myInteger);  // Displays 23
    Message('myResult: %1', myResult);    // Displays 17
end;

procedure MyFunction(paramA : Integer) : Integer
begin
  paramA := 17;
  Exit(paramA);
end;
```

## **Parameter by Reference**
*change his values by the function (**include VAR word before the parameter**)
```
trigger OnRun()
var
    myInteger : Integer;
    myResult : Integer;
begin
    myInteger := 23;
    myResult := MyFunction(myInteger);

    Message('myInteger: %1', myInteger);  // Displays 17
    Message('myResult: %1', myResult);    // Displays 17
end;

procedure MyFunction(var paramA : Integer) : Integer
begin
  paramA := 17;
  exit(paramA);
end;
```
- **Complex type return**
```
procedure GetCustomerByName(Name: Text): record Customer;
var
    Customer: record Customer;
begin
    Customer.SetFilter(Name, '@' + Name + '*');
    Customer.FindFirst();
    exit(Customer);
end;
```

# **Codeunits**

You can use the Access property on the codeunit to specify your codeunit as public or internal. 
A codeunit contains the following elements:
- Triggers
- Functions
- Variables 
- Properties
- Statements

### A codeunit contains only one trigger:  **OnRun**
This trigger is always available and is implemented when you run a codeunit.

**Subtype property**
The Subtype property has five available values:
- **Normal** The default value for every new codeunit. This subtype is a regular codeunit. It has only one trigger: OnRun.
- **Install** This type of codeunit will only be run during the installation of the extension package. This subtype provides access to two extra triggers.
- **Upgrade** This type of codeunit will only be run during the upgrade process of an extension package. This subtype gives access to five extra triggers.
- **Test** This subtype enables you to write unit test functions. You don't create normal functions in this codeunit because it can only run during unit testing.
- **TestRunner** This subtype will run one or more Test codeunits.

### **Basic strct codeunit**
```
codeunit 50100 MyCodeunit
{
    Access = Public;
    Subtype = Normal;

    trigger OnRun()
    begin
        
    end;

    procedure MyFunction(Param1: Integer; Param2: Text[50]) : Boolean
    begin 

    end;
}
```

### **Access to codeunit functions**

Need to create a var codeunit type:
```
codeunit 50101 MyCodeunit2
{
    trigger OnRun()
    var
        //The complex types of a custom function need be referenced (MyCodeunit)
        MyCodeUnit1: Codeunit MyCodeunit;
        Result: Boolean;
    begin
        Result := MyCodeUnit1.MyFunction(5, 'Test');
    end;
}
```

You can also access a codeunit from within a page by using the RunObject property on an action.
If you use the **RunObject** property, you can only run the **OnRun** trigger, not the other functions within the codeunit.

```
//To access the other functions, you can use the OnAction trigger.

actions
{
    area(Processing)
    {
        action(ActionName)
        {
            ApplicationArea = All;
            Image = NewSum;
            RunObject = codeunit MyCodeunit;

            trigger OnAction()
            var 
                MyCodeunit1: Codeunit MyCodeunit;
            begin 
                MyCodeunit1.MyFunction(2, 'Test 2');
            end;
        }
    }
}
```

# Triggers

## Table Triggers

- **OnInsert**

    Run before the data is stored in the database.

- **OnModify**

    Run when a record in the database is modified

- **OnDelete**

    Run before the data is deleted in the database.

- **OnRename**

     If you modify the primary key of a record, then OnRename is triggered.

### **Triggers in field level**
- OnValidate

    Is used to run extra validation when a user enters data into a certain field.
    The OnValidate trigger will be called before the data is stored in the database. 

- OnLookup
    
    OnLookup is triggered when you perform a lookup to another table.
    By default, a lookup is created by setting the TableRelation property on the field. This setting will create a drop-down control on the page. 

### **Triggers in a page commonly used**

- **OnInit** Use when the page is loaded but before the controls are available.

- **OnOpenPage** Use when the page is initialized and the controls are available.

- **OnAfterGetRecord** Use when a record has been retrieved but not yet displayed.

- **OnAfterGetCurrRecord** Use after the current record is retrieved from the table.

### **Triggers on a field in a page**

- **OnAssistEdit** Triggered when someone uses the Assist Edit button. Typically, this trigger is used with No. Series to select another number series.

- **OnDrillDown** Triggered when a user selects a control that acts as a drill-down control. This trigger is typically used with FlowFields. When you select a FlowField, it will display the records that make up the calculation for the FlowField.

- **OnLookup** Triggered when a user selects a drop-down control that performs a lookup. This trigger has the same behavior as the OnLookup trigger on the table. We recommend that you put the code on the table level as much as possible.

- **OnValidate** Triggered when a user enters a value in a field and then leaves the field. This trigger has the same behavior as the OnValidate trigger on the table level.


**If the RunObject property and the OnAction trigger are used simultaneously, both will be run, which can lead to conflicts. Be careful to use either the RunObject property or the OnAction trigger, but not both.**

## **Events**

**Shift + Alt + E** Show a list with all events.

With events, it's possible to connect to the core application without needing to modify the existing code. When an event occurs, you can react with your own code to these events.
The three participants that are involved in events are:

- **The event**

    The three types of events are:

    - **Business**

        Business events are custom events that define a formal contract. This contract promises that the signature of this event does not change in future releases. It's published by solution ISVs, including Microsoft.

    - **Integration**

        Integration events are custom events that do not carry the same promise. They can change over time.

    - **Trigger**

        Trigger events are pre-defined events and raised by the system when it performs database table operations.

- A publisher

    The object that contains the event publisher function is called the publisher. It declares and exposes the event in the application where people can subscribe on.

- A subscriber

    A subscriber listens for and handles a published event.

## **Interface**

```
interface IAddressProvider
{
    procedure GetAddress(): Text;
}
```
**Implement Interface**
```
codeunit 65100 CompanyAddressProvider implements IAddressProvider
{
    procedure GetAddress(): Text;
    begin
        exit('Company address \ Denmark 2800')
    end;
}

//Us
trigger OnAction()
var
    iAddressProvider: Interface IAddressProvider;
begin
    AddressproviderFactory(iAddressProvider);
    Message(iAddressProvider.GetAddress());
end;
```

- **The Intarface doesn't not an object id**
- **One codeunit can implements multiple interface split by comma (,), the codeunit must implements all interface methods**


## **Recover data from database**

Data access functions:

- **Get**

    The Get function retrieves a record based on the primary key. If your table has a primary key of one field, you need to provide one parameter to the Get function.

    ```
    var 
        customer: Record Customer;
    begin  
        customer.Get('30000');
        if customer.Get('10000') then
            Message('%1', customer)
        else      
            Error('Not found');
    end;
    ```

    Record.Get is optimized for getting a single record based on primary key values.

- **Find, FindFirst, FindLast**

    Recover the first and the last result
    ```
    var 
    customer: Record Customer; 

    begin

    customer.FindFirst();
    // SELECT TOP 1 * FROM Customer
    Message('%1', customer.Name);

    customer.FindLast();
    // SELECT TOP 1 * FROM Customer Order By No. Desc
    Message('%1', customer.Name);

    customer.FindSet();
    // SELECT * FROM Customer
    ```

    **Use 'FindSet' To retrieve all records (or a filtered set of records)**

- **Next**

    The Next statement is used to get the next record in a record set. Typically, you would use the Next statement in a repeat until statement.
    ```
    customer.FindSet();
    // SELECT * FROM Customer
    repeat
        // process record
        Message(customer.Name);
    until customer.Next() = 0;
    ```

- **IsEmpty**

    If you want to check if a record exists, but you don't want to retrieve that record.

- **SetCurrentKey**

    To sort records, use the SetCurrentKey function, where you can specify the field (or fields) that you want to sort by.
    ```
    var
        customer: Record Customer;
    begin
        customer.SetCurrentKey(City);
        customer.FindFirst();
        Message('%1', customer);
    ```

- **SetRange Function**

    With the SetRange function, you can specify a start and end value for a specific field. However, you can't use the SetRange function to search for records where the field value is larger or smaller than a specific value.

    ```
    //Omitting the ToValue function means that you will have to search for all records where Field equals the FromValue.

    //customer.SetRange(field, fromValue, toValue)
    customer.SetRange("No.", '10000', '40000');
    customer.FindSet();
    repeat
        Message('%1', customer);
    until customer.Next() = 0;
    ```

- **SetFilter Function**

    he SetFilter function accepts a string value, where you can specify your filtering conditions, such as:
- '>'
- <
- < >
- <=
- '>='
- '*'
- .. (range)
- & (and)
- | (or) and more in this filter condition

```
//all customers where the No. field is larger than 10000 and different from 20000.

//SQL: SELECT * FROM CUSTOMER WHERE No. > 10000 AND No <> 20000

AL: customer.SetFilter("No.", '> 10000 & <> 20000');

//Alternatively, you can use placeholders:
value1 := '10000';
value2 := '20000';        
customer.SetFilter("No.", '>%1&<>%2', value1, value2);
```
EXAMPLE:


1.- CUSTOMER BETWEEN 10,000 AND 90,000.

2.- CITY START WITH 'B' LETTER AND SPECIFIES CASE NO-SENSITIVE.

3.- COUNTRY/REGION CODE STARTS WITH 'B' LETTER. 
```
customer.SetRange("No.", '10000', '90000');
customer.SetFilter(City, '@B*');
customer.SetFilter("Country/Region Code", 'B*');
customer.FindSet();
repeat
    Message('%1', customer);
until customer.Next() = 0;
```
The following example shows an "or" (|) filter being used.
```
customer.SetFilter("No.", '10000|20000|30000');
```

You can use the filter statements with the IsEmpty statement to check if any records match your filters.

```
DocumentNo := '10000';

SalesLine.SetRange("Document No.", DocumentNo);
if (SalesLine.IsEmpty()) then
    Message('No sales line records found for document %1', DocumentNo);
```

### **Insert statement**

Before you can insert data, you need to set the values for each field that you want to store. The Insert command, in addition to the modify and delete commands, accept the RunTrigger Boolean parameter. By default, the parameter value is false.
```
var
    customer: Record Customer;
begin
    customer.Init();
    customer."No." := '4711';
    customer.Name := 'John Doe';
    customer.Insert(true);
```

### **Modify statement**

- Modify

To change values of an existing record, you first need to retrieve the record. Then, you can update the values and use the Modify function to store the changes in the database.
```
customer.Get('4711'); // 1.- Get the record.
customer.Name := 'Richard Roe';// 2.- Set the value.
customer.Modify(); // 3.- Confirm.
```

- ModifyAll 

If you want to update multiple records simultaneously, you can use the ModifyAll function. The ModifyAll function accepts the RunTrigger parameter as the third parameter of the function.

```
customer.SetRange("Salesperson Code", 'PS');
customer.ModifyAll("Salesperson Code", 'JR');
```

### **Delete statement**
As with the Modify function, you need to retrieve a record from the database before you can delete a record. The Delete and DeleteAll functions accept the RunTrigger parameter.
```
customer.Get('4711');
customer.Delete(true);

//Delete all is applied in multiple records

customer.SetRange("Salesperson Code", 'PS');
customer.DeleteAll();
```

## **Field functions in AL**

- CalcFields

    By using the CalcFields function, you can specify which FlowFields need to be calculated during the implementation of your code.

    In the following example, only the Balance and Net Change FlowFields are calculated. Outside the repeat until statement, the FlowFields are no longer calculated, only within their scope.
    ```
    customer.SetRange("Date Filter", 0D, Today());

    // Using CALCFIELDS
    if customer.FindSet() then
        repeat
            customer.CalcFields(Balance, "Net Change");
            // Do some additional processing
        until customer.Next() = 0;
    ```

- CalcSums

    The CalcSums function is used to calculate a total for a specific field, based on the filters of the dataset.
    ```
    salesInvoiceHeader.SetCurrentKey("Bill-to Customer No.");
    salesInvoiceHeader.SetRange("Bill-to Customer No.", '10000', '50000');
    salesInvoiceHeader.SetRange("Document Date", 0D, Today());
    salesInvoiceHeader.CalcSums(Amount);

    Message('The total is %1', salesInvoiceHeader.Amount);
    ```

- FieldError

    The FieldError function stops implementation of the code, causing a run-time error, and creates an error message for a specific field.
    The field will display a red border, indicating that an error has occurred with the value of this field.
    ```
    if item."Unit Price" < 10 then
    item.FieldError("Unit Price", 'must be greater than 10');
    ```

- Init

    The best approach is to start by using the Init command on the record. This action will initialize all fields on the record.

    ```
    customer.Init();
    customer.Name := 'John Doe';
    customer."E-Mail" := 'john.doe@contoso.com';
    customer.Insert(true);
    ```

- TestField

    With the TestField function, you can check if a field has a value or if it is blank. If the field is empty, the TestField function will generate a run-time error.
    ```
    customer.TestField("Salesperson Code");
    ```

    Also you can use to test whether a field contains a specific value or not. If it doesn't, the field will generate an error.
    ```
    customer."Salesperson Code" := 'DK';
    customer.TestField("Salesperson Code", 'ZX');
    ```

- Validate

    When you assign a value to a field, the OnValidate trigger of that field isn't run. If you want to run the OnValidate trigger, use the Validate function.
    ```
    Customer."Phone No." := '1234567891234'
    customer.Validate("Phone No.");

    //You can also use the Validate function to assign a value and run 
    //the OnValidate trigger.

    customer.Validate("Phone No.", '1234567891234');
    ```

## **Multilanguage development**

To add a new language to the extension that you have built, you must first enable the generation of XML Localization Interchange File Format (XLIFF) files. 

### **TranslationFile feature**

1. XLIFF files are XML-based files that you can use for defining your translation.
2. You will need to create an XLIFF file for each language that you want to support.
3. The XLIFF file extension is .xlf.
4. To enable the generation of XLIFF files, you need to enable a setting in the app.json file (*TranslationFile*), This setting is the Features setting, which is an array of possible features.
5. When you run the *build command* in Visual Studio Code, a Translations folder will be generated and .xlf files are created based on the labels, caption, and tooltip properties.
6. Visual Studio Code will generate a .g.xlf file, which is recreated with every build command. Make sure that you rename this file before starting to translate; otherwise, the file will be overwritten, format: extensionname.language.xlf.
7. Only one .xlf file can exist for each language.
```
"dependencies": [
...
...
...
],
"features": ["TranslationFile"],
"runtime": "4.0"
```

### **GenerateCaptions feature**
Automatically generate captions based on the object names of tables, pages, fields, and so on

https://www.microsoft.com/en-us/videoplayer/embed/RE4vBLN?postJsllMsg=true


### **Multilingual App Toolkit**
This tool enables you to open and read .xlf files.<br>
Also has a Microsoft Azure Translator Text integration, which allows you to get translations or suggestions for translations directly in the editor tool.
https://learn.microsoft.com/es-mx/windows/apps/design/globalizing/multilingual-app-toolkit-editor-downloads

### **Azure Translator Text**
https://learn.microsoft.com/en-us/training/modules/manage-multilanguage-development/3-automate


# **Tables**
The four types of tables with a different technical implementation are:

- Database tables - are the type of table that you typically see. You will have rights to read and write on database tables. Examples include the customer table, vendor table, and item table.

- System tables - System tables are unique because these tables and their data are necessary for the system to function. System tables are saved in the database and they will have object numbers above two million. Examples include the company table, profile table, and permission table.

- Virtual tables - You can find the definition of a virtual table in the database, but the data is created at runtime, so it's not stored in the database. You as a developer will not have rights to write to virtual tables. The active session table is an example.

- Temporary tables - A temporary table only exists in the memory of a client. It keeps an image or a copy of another database table. It has no data and is frequently used in posting routines and document reports.

## Table Properties

- **Id**, must be within the microsoft ids numbers by partners, this guarantees that no object has the same id.
- **Name**, is the table name for identify.
- **Caption**, it is showed in the title bar.
- **DataCaptionFields**, combination of id and title showed in the top of page.
- **DataPerCompany**, choose to administer more than one company in a database, the DataPerCompany property is set to Yes by default. However, if you change this property to No, it can result in significant consequences. Your data will be available for all companies in the same database.
- **DataClassification**,  sets the classification of the data in a table.
Microsoft provides this DataClassification property as a matter of convenience only
    - The default value is **ToBeClassified**, which indicates content that has not yet been given a classification.
    - Data about customer billing information will be classified as **AccountData**.
    - User data, such as an IP address or user principle name, will be classified as **EndUserIdentifiableInformation**.
- **LookupPageId**, When a table is called from a lookup, which means that when a table is asked to show its (filtered) records (might be all its records, or might be a record set), it will use the LookupPageId property to run a page.
- **DrillDownPageId**, you can select the Country/Region Code drop-down list, where you can open another table in the lookup. In this case, you are able to open tables for countries and regions.

```
table 50100 Car
{
    Caption = 'Car';
    DrillDownPageId = "Car List";
    LookupPageId = "Car List";
}
```

- **ObsoleteState**, marks whether the object or element is or will become obsolete (deprecated).
- **ObsoleteReason**, specifies why the object or element has been marked as Pending or Obsolete in the ObsoleteState property.
- **ObsoleteTag**, specify additional information which can be valuable to other developers.

```
page 10141 "Deposit Subform"
{    
    Caption = 'Lines';    
    PageType = ListPart;
    SourceTable = "Gen. Journal Line";
    ObsoleteReason = 'Replaced by new Bank Deposits extension';
    ObsoleteState = Pending;
    ObsoleteTag = '20.0';
```

## Table Relations
Property that is used to establish a relation between two tables, lets you establish lookups into other tables. This property will show a drop-down menu on pages, where a user can select a value from the linked table.

- **Regular Relation:**
    Is a simple relationship between two tables.
    If you specify the table, you will automatically link to the primary key of that table.

    ```
    field(4; "Country/Region Code"; Code[10])
    {
        Caption = 'Contry region';
        TableRelation = "Country/Region";
    }
    ```

- **Filtered Relation:**
    Limit the records that are displayed by using one or more filters on the table records.
    ```
    /*In the following example, the Country/Region code is filtered to show only countries where the EU Country/Region Code field is not blank*/

    field(4; "Country/Region Code"; Code[10])
    {
        Caption = 'Contry region';
        TableRelation = "Country/Region" where ("EU Contry/Region Code" = filter(<>''));
    }
    ```
- **Conditional Relation:**
    is a dynamic table relationship because it's not fixed to one table. The link depends on a condition; therefore, depending on the evaluation of a condition, you might relate to one or another table.
    ```
    /*No. field is linked to other tables, dependent on the Type field value. This conditional table relation is also using a number of filtered table relations*/

    field(6; "No."; Code[20])
    {
        Caption = 'No.';
        TableRelation = 
        if (Type = const(" ")) "Standard Text"
        else if (Type = const("G/L Account"), "System-Created Entry" = const(false)) "G/L" Account where("Direct POsting" = const(true), 
        "Acount Type" = const(Posting), 
        Blocked = const(false))
        else if (Type = const("G/L Account"), "System-Created Entry" = const(true)) "G/L Account"
        else if (Type = const(Resource)) Resource

        etc...
    }
    ```
## **Primary Keys**
Make records unique and to optimize the performance of the database when you search or filter table data.
- The primary key is always the first in the list. It's always active, and it makes records unique.
- Every table has a primary key, and there can only be one primary key per table.
- Table extension objects inherit the primary key of the table object they extend.
- You can have up to 40 keys for each table, and each key can consist of a maximum of 20 fields.
- the first key defined in a table object is the primary key.
- A key definition includes the Unique property that you can use to create a unique constraint on the table in SQL Server. A unique key ensures that records in a table don't have identical field values.

### **Secondary Keys**
- Create indexes in SQL.
- You can define multiple secondary keys for a single table object and table extension
- **Unique** property to create a unique constraint on the table in SQL Server
- **Best practice: limit to 5 the secondary keys**
- **IncludedFields** add fields that aren't part of the key itself, In SQL server, these non-key fields correspond to what are called included columns.
- Non-clustered columnstore indexes (sometimes referred to as NCCIs) are supported on tables.
- **ColumnStoreIndex** create a non-clustered columnstore index on the table in SQL server.
- Up to 40 keys can be associated with a table.

- To illustrate, here's a simple example of replacing two SIFT keys with a single non-clustered columnstore index. Suppose you already have implemented two SIFT keys:

    - Key1: "WareHouseId, Color" SumField: "OnStock"

    - Key2: "WareHouseId, ItemId, Size" SumField: "OnStock"

### **Clustered and non-clustered keys**
- A key definition includes the Clustered property that you use to create a clustered index. 
- Based on the key value, records are sorted in ascending order.
- Using a clustered key can speed up the retrieval of records.
- There can be only one clustered index per table. By default the primary is configured as a clustered key.

### **Key modifications**
When developing a new version of an extension, be aware of the following restrictions to avoid schema synchronization errors that prevent you from publishing the new version:

- Don't delete primary keys.
- Don't add or remove primary key fields, nor change their order.
- Don't change properties of existing primary keys.
- Don't add more unique keys.
- Don't add more clustered keys.
- Don't add keys that are fields of the base table.

## DropDown

Is a list created for relationship of tables to select the key from another table.

## Brick Fieldgroup
Is used to display a list in tiles.

The six possible field positions are shown in the following table:
- Field 1 - Small font
- Field 2 - Large font
- Field 3 - Large font and right-aligned
- Field 4 - Secondary field
- Field 5 - Secondary field and right-aligned
- Field 6 - Secondary field

Set the fieldgroups under the keys section:
```
fields
{
}
keys
{
}
fieldgroups
{
    fieldgroup(DropDown; "No.", Name, City, "Post Code", "Phone No.", Contact)
    {

    }
    fieldgroup(Brick; "No.", Name, "Balance (LCY)", Contact, "Balance Due (LCY)", Image)
    {
        
    }
}
```

## **Calculate fields**
Calculated fields are fields where the value is calculated instead of stored in the database, implemented by using a special field property, the FieldClass property.
You must define the FieldClass property for each field in the table.

The FieldClass property can be one of three values:

- **Normal**: (default) is stored in database.

- **FlowField**: isn't stored in a table, but it is calculated, 
You can have different types of calculation formulas:

```
//Example
field(1; Balance; Decimal)
{
    CalcFormula = Sum("Sales Info".Sale where ("Customer Type" = 1))    
    FieldClass = FlowField;
}
```

    - Sum - The sum of a specified set in a column in a table (data type: decimal)

    - Lookup - Looks up a value in a column in another table (data type: any)

    - Count - The number of records in a specified set in a table (data type: integer)

    - Exist - Indicates whether any records exist in a specified set in a table (data type: Boolean)

    - Average - The average value of a specified set in a column in a table (data type: decimal)

    - Min - The minimum value in a column in a specified set in a table (data type: any)

    - Max - The maximum value in a column in a specified set in a table (data type: any)

- **FlowFilter**: is designed to be used in the calculation formula of a FlowField, allows the end user to provide a value that is then used in the calculation



# Upgrade Codeunit Extension

Change the version number in app.json
```
"version": "1.0.0.0"
//Major.Minor.Build.Revision
```

# **Data synchronization**

inside the launch.json 

Synchronize is the defaul mode, which means that every time you publish an extension to the development server, the data you entered previously stays
```
"schemaUpdateMode" : "Synchronize"
//Or:
"schemaUpdateMode" : "ForceSync"
//Or:
"schemaUpdateMode" : "Recreate"
```

# **Custom Report**

When developers create reports, they complete the following tasks to establish the report description:

- Assign the report name and ID number
- Specify data items
- Design the layout of the report

The report description contains the following components:
- Properties
- Triggers
- Controls
- Data items
- Columns
- Request page
- Labels
- Layout

There are two types of report layout
- Client report definition (RDLC) layout
- Microsoft Word layouts


**Basic struct of a report:**
```
report Id MyReport
{
    UsageCategory = Administration;
    ApplicationArea = All;

    dataset
    {
        dataitem(DataItemName; SourceTableName)//This dataitem can be one or more columns
        {
            column(ColumnName; SourceFieldName)
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions //this is inside request page
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        myInt: Integer;
}
```

To make a custom report must follow two steps:

* Data Model

    This mean select the correct tables and data source, table relations, keys order, filter, data element, group data, flow fields.

* Report Layout Design 

- **A Data Element it is a Table**
- **A column can be a table field, variable, expression, const**

You can set a dataitem inside another dataitem, so the report reads all records in the dataitem parent and all records of dataitem indented, including filters and links, in that case the tables are joined.
This work as a FOR Cycle, where the report read the firs customer and all their sales lines, then the next customer and all their sales lines again.
Example below:
```
dataset
    {
        dataitem(Customer;Customer)
        {
            dataitem("Sales Line";"Sales Line")
            {
                DataItemLinkReference = Customer;
                DataItemLink =  "Bill-to Customer No." = field("No.");
            }
        }
    }
```
Each data item has the DataItemLinkReference and the DataItemLink properties. These properties define a master/detail relationship between two tables.

## **Dataitem Properties:**

- DataItemLinkReference, 
- DataItemLink, especify a field of each dataitem on wich to base the link.
- PrintOnlyIfDetail (true/false), especify if print the data in report for the primary when the secondary has not results. (correlates to a left or inner join).
    - true = inner join.
    - false = left join.

- DataItemTableView, set a filter to show a result limited
```
dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            DataItemTableView = where(Blocked=filter(false));
        }
```

The following example fetches the No., Name, City, and Balance LCY columns from the Customer table:
```
dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(City; City)
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
        }
```
The next example demonstrates two data items that are not linked or indented,
so this example has no relation.
```
dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.")
            {
            }
            column(CustomerName; Name)
            {
            }
        }
        dataitem(Vendor; Vendor)
        {
            column(VendorNo; "No.")
            {
            }
            column(VendorName; Name)
            {
            }
        }
```

The next example demonstrates two data items that are indented, so this example shows all data related by No.
So the customer can be repeated with the same data by each entry in the  "Cust. Ledger Entry" of that customer.
```
dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true; //Show only customer with entries in the "Cust. Ledger Entry" table
            column(CustomerNo; "No.")
            {
            }
            column(CustomerName; Name)
            {
            }
            dataitem(CustomerLedgers;"Cust. Ledger Entry")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Customer No." = field("No.");
                column(CustomerLedgersCustomerNo;"Customer No.")
                {
                }
                column(CustomerLedgersAmountLCY;"Amount (LCY)")
                {
                }
            }
        }
    }
```
## **Report layout design**
A report can only have one built-in RDLC report layout and one built-in Word report layout. By default, the built-in RDLC report layout is used when the report is run in the client, unless only a built-in Word report layout exists, in which case, the built-in Word report layout is used.

- **Report definition language (RDL)**

    To create an RDLC layout report, you need to use 
    Visual Studio Report Designer or Microsoft SQL Server Reporting Services Report Builder.

The system requirements for Business Central list the supported versions:

Report Builder for SQL Server 2016

Visual Studio 2017 or 2019 with Microsoft RDLC Report Designer for Visual Studio or Word.

## Headers and footers in client report definition (RDLC) report layouts have the following limitations:

- From the header, you can't refer to group-specific information in the body.

- You can have only one report header, one body, and one report footer in a report.

- You can have group headers and footers and table headers and footers.


**Report Example**
```
dataset
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.")
            {
            }
            column(CustomerName; Name)
            {
            }
            column(City; City)
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
        }
    }
```

Report properties **RDLCLayout** example:
```
report 50105 Example_RDLCLayout
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'Example_RDLCLayout.rdl';
    DefaultLayout = RDLC;
```

Report properties **WORDLayout** example:
```
report 50105 Example_WORDLayout
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    WordLayout = 'Example_WORDLayout.docx';
    DefaultLayout = Word;
```
- The **RDLCLayout** property sets the file name and the RDLC layout that is used on a report. The RDLC file will be created in the same folder as the AL object.
- The **DefaultLayout** property specifies whether the report uses the built-in RDLC or Word report layout by default.

## **Request page**

To launch a Request page is defaul unless the property  **UseRequestPage** has been established in false.
A Request page always show the next buttons; 'Send to', 'Print', 'Preview', 'Canel'.

You can design the filters on request pages using the following report properties:

- RequestFilterHeading

    This report property sets a caption for the request page tab that is related to a report's data item or an XMLport's table element.

- RequestFilterHeadingML

    This report property sets the text used as a RequestFilterHeading property for a request page tab.

- RequestFilterFields

    This report property specifies which fields are automatically included on the tab of the request page that is related to a report's data item or an XMLport's table element. The user can set filters on these fields.

    ```
    dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
            ...
    ```
    It is recommend that you add fields that end users of the   report will frequently set filters on.

- UseRequestPage

    Sets whether a request page is presented to the user. If UseRequestPage is false, then a request page isn't shown. The user can't choose a sort order or set any filters.

    You can create you own request page, and has the following syntax:
    ```
    requestpage
    {
        SaveValues = true; // this save the values that user enters on the request page for the next time.
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    ```

## **UsageCategory**

In AL code, you would make a page or report searchable from Tell Me by setting the UsageCategory property
```
report 50102 Example_DataItems_Join
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    AdditionalSearchTerms = 'Customer and Ledgers Report';//This property helps to fin a object more specifically
}
```
Additionale can use:
- AccessByPermission.
- ApplicationArea.
- AdditionalSearchTermsML.

## **Report Triggers**

- OnInitReport - Runs when the report is loaded.
- OnPreReport - Runs before the report is run but after the RequestPage has been run.
- OnPostReport - Runs after the report has run but not if the report was stopped manually or by the QUIT method.

These triggers apply to each data item on the report:
- OnPreDataItem - Runs before the data item is processed but after the associated variable has been initialized.
- OnAfterGetRecord - Runs when a record has been retrieved from the table.
- OnPostDataItem - Runs when the data item has been iterated for the last time.



# Snippets
* ttable -> basic struct for a table.
* tpage -> basic struct for a page.
* tpagefield -> basic struct for a field page.
* tpageext -> basic struct for a extension page.
* tcodeunit -> basic struct for a codeunit.
* tprocedure -> create a custom function.
* treport -> create a basic struct to a report.
* tdataitem -> add a data element to a report.
* tcolumn -> add a column to data element.
* tinterface -> create a basic struct for a interface.


# Commands
- Comment selection (Ctrl + K + C)
- Uncomment selection (Ctrl + K + U)
- AL: Package (Ctrl + Shift + B)
- Show a list with all events (Shift + Alt + E)

# Links
- Shortcuts VS CODE | https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf |

# Doubts
With Statement Symbols Search |
https://learn.microsoft.com/es-mx/training/modules/al-statements/4-repetitive |

# Git

- **pwd** -> show path
- **cd** -> move to folder
- **ls** -> show files
- **git init** -> start project .git.
- **git status** -> changes to be committed.
- **git log** -> show commits hist.
- **git config --global user.email** "email" -> log in email.
- **git config --global user.name** "alias" -> log in alias.
- **git commit** -> add commits and take a snapshot form code.
    - Add to one line: **git commit -m "Message"**
    - Add with code editor:
    1. **i** -> to start to insert (enter to finish).
    2. **ESC + ':wq'** to end commits.

- **git checkout -- 'fileName'** -> discard changes in workspace.
- **git add 'fileName'** -> to update what will be committed.
    - **git add .** -> add all files.
- **git diff 'fileName'** -> to show changes.

## Branches

- **git branch** -> show branches.
- **git branch 'nameBranch'** -> create new branch.
- **git checkout 'nameBranch'** -> move to branch.
## Ignore files and folders
To ingore create new file called .gitignore and add folders and files inside to ignore changes.


