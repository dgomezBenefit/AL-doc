procedure RemoveUnwantedCharacters(InputString: Text; SpecialCharactersAllowed: Text) OutputString: Text
    var
        AlphanumericChars: Text;
    begin
        AlphanumericChars := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        OutputString := DelChr(InputString, '=', DelChr(InputString, '=', AlphanumericChars + SpecialCharactersAllowed));
    end;

Use:
exit(CopyStr(RemoveUnwantedCharacters(InputVendorName, ' @´%!¡$.&,'), 1, GetVendorNameLength()));
