
with Command_And_Token_Tables; use Command_And_Token_Tables;

package Tokenizer is

   procedure Tokenize (Token_Buffer : out String_Buffer;
                       From_Console : Boolean);

end Tokenizer;
