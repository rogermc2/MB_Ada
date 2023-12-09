
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Console;
with Timers;

package body IO_Support is

   type Prev_Chars_Data is record
      State          : Boolean := False;
      Prev_Character : Character := Character'Val (0);
   end record;

   type Prev_Array is array (1 .. 4) of Prev_Chars_Data;

   Null_Char  : constant Character := Character'Val (0);
   Esc_Image  : constant Unbounded_String :=
                  To_Unbounded_String (Esc_Char'Image);
   Up         : constant String3 := (Esc_Char,  '[', 'A');
   Down       : constant String3 := (Esc_Char,  '[', 'B');
   Right      : constant String3 := (Esc_Char,  '[', 'C');
   Left       : constant String3 := (Esc_Char,  '[', 'D');

   --     function Page_Keys (aChar : Character) return Unbounded_String;

   Prev_Chars :  Prev_Array;

   function Arrow_Keys (aChar : Character) return Unbounded_String is
      Arrow_Key : String3 := (others => Null_Char);
   begin
      if aChar = 'A' then
         Arrow_Key := Up;    --  Up
      elsif aChar = 'B' then
         Arrow_Key := Down;  --  Down
      elsif aChar = 'C' then
         Arrow_Key := Right;  --  Right
      elsif aChar = 'D' then
         Arrow_Key := Left;   --  Left
      elsif aChar < '1' then
         null;
      end if;

      if Arrow_Key (1) = Null_Char then
         return Null_Unbounded_String;
      else
         return To_Unbounded_String (Arrow_Key);
      end if;

   end Arrow_Keys;

   procedure Char_Wait (OK       : in out Boolean; aChar : in out Character;
                        MS_Delay : Natural) is
   begin
      Timers.Inkey_Timer := 0;
      while OK and then Timers.Inkey_Timer < MS_Delay and then
        aChar = Null_Char loop
         Timers.Inkey_Timer := Timers.Inkey_Timer + 1;
         OK := Console.Get_Console (aChar);
      end loop;
   end Char_Wait;


   --        UB_String : Unbounded_String := Null_Unbounded_String;
   --        OK        : Boolean := True;
   --     begin
   --        if aChar /= 'O' then
   --           --  Delay o allow the final characters to arrive even at 1200 baud.
   --           Char_Wait (OK, aChar, 50);
   --
   --           if aChar = 'P' then
   --              aChar := Character'Val (241);  --  F1
   --           elsif aChar = 'Q' then
   --              aChar := Character'Val (242);  --  F2
   --           elsif aChar = 'R' then
   --              aChar := Character'Val (243);  --  F3
   --           elsif aChar = 'S' then
   --              aChar := Character'Val (244);  --  F4
   --           else
   --               Prev_Chars (1).State := True;
   --                    Prev_Chars (1).Prev_Character := 'O';
   --               Prev_Chars (2).State := True;
   --                    Prev_Chars (1).Prev_Character := aChar;
   --              aChar := Esc_Char;  --  escape character
   --           end if;
   --        end if;
   --
   --        return OK;
   --
   --     end Linux;

   function MM_Inkey (OK : in out Boolean) return String is
      aChar     : Character := Null_Char;
      T_Char    : Character := Null_Char;
      TT_Char   : Character := Null_Char;
      UB_String : Unbounded_String := Null_Unbounded_String;
   begin
      --  Check if there are discarded chars from a previous sequence.
      if Prev_Chars (1).State then
         Prev_Chars (1) := Prev_Chars (2);
         Prev_Chars (2) := Prev_Chars (3);
         Prev_Chars (3) := Prev_Chars (4);
         Prev_Chars (4).State := False;
         Prev_Chars (4).Prev_Character := Null_Char;
      end if;

      OK := Console.Get_Console (aChar);
      if OK then
         if aChar = Character'Val (27) then
            --  Escape character
            Timers.Inkey_Timer := 0;
            --  get the second character with a delay of 30mS to allow the next
            --  character to arrive.
            Char_Wait (OK, aChar, 30);

            --              if OK then
            --                 OK := Linux (aChar, Out_String);
            --              end if;

            if OK then
               if aChar /= '[' then
                  Prev_Chars (1).State := True;
                  Prev_Chars (1).Prev_Character := aChar;
                  UB_String := Esc_Image;  --  escape character;
               else
                  --  Get the third character after delay
                  Char_Wait (OK, aChar, 50);
                  UB_String := Arrow_Keys (aChar);

                  if UB_String = Null_Unbounded_String then
                     if aChar < '1' or else aChar < '6' then
                        Prev_Chars (1).State := True;
                        Prev_Chars (1).Prev_Character := '[';
                        Prev_Chars (2).State := True;
                        Prev_Chars (2).Prev_Character := aChar;
                        UB_String := Esc_Image;
                     else
                        --  allow the final chars to arrive, even at 1200 baud
                        Char_Wait (OK, T_Char, 70);
                        UB_String := To_Unbounded_String (T_Char'Image);
                        if T_Char = '~' then
                           UB_String := Null_Unbounded_String;
                           --   UB_String := Page_Keys (T_Char);
                           Prev_Chars (1).State := True;
                           Prev_Chars (1).Prev_Character := '[';
                           Prev_Chars (2).State := True;
                           Prev_Chars (2).Prev_Character := aChar;
                           Prev_Chars (3).State := True;
                           Prev_Chars (3).Prev_Character := T_Char;
                           UB_String := Esc_Image;
                        else  --  get the fifth character
                           Char_Wait (OK, TT_Char, 90);
                           if T_Char = '~' then
                              if aChar = '1' or aChar = '2' then
                                 UB_String := Null_Unbounded_String;
                           --   UB_String := Function_Keys (T_Char);
                              end if;
                           else
                              UB_String := Esc_Image;
                           end if;
                        end if;
                     end if;
                  end if;
               end if;
            end if;
         end if;

         return To_String (UB_String);
      else
         return aChar'Image;
      end if;

   end MM_Inkey;

   --  function Page_Keys (aChar : Character) return Unbounded_String is
   --        Page_Key : String3 := (others => Null_Char);
   --     begin
   --        if aChar = '1' then
   --           Page_Key := Home;    --  Home
   --        elsif aChar = '2' then
   --           Page_Key := Insert;  --  Insert
   --        elsif aChar = '3' then
   --           Page_Key := Del;  --  Del
   --        elsif aChar = '4' then
   --           Page_Key := End_Key; --  End
   --        elsif aChar = '5' then
   --           Page_Key := Page;   --  Page Up
   --        elsif aChar = '6' then
   --           Page_Key := Page_Down;   --  Page Down
   --        end if;

   --        if Page_Key (1) = Null_Char then
   --           return Null_Unbounded_String;
   --        else
   --           return To_Unbounded_String (Page_Key);
   --        end if;
   --
   --     end Page_Keys;

end IO_Support;
