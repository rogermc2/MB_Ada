
with Ada.Containers.Vectors;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Configuration;

package GUI is

   type S_Ctrl_Data is record
      Display_Page   : Unbounded_String;
      Ref            : Unbounded_String;
      Ctrl_Type      : Integer := 0;
      State          : Unbounded_String;
      X1             : Integer := 0;
      Y1             : Integer := 0;
      X2             : Integer := 0;
      Y2             : Integer := 0;
      Fore_Colour    : Integer := 0;
      Back_Colour    : Integer := 0;
      Caption_Colour : Integer := 0;
      Value          : Configuration.MMFLOAT;
      Min            : Configuration.MMFLOAT;  --  Spin box min
      Max            : Configuration.MMFLOAT;  --  Spin box max
      Increment      : Configuration.MMFLOAT;  --  Spin box increment

      Caption        : Unbounded_String;
      Format         : Unbounded_String;
   end record;

   package GUI_Controls_Package is new
     Ada.Containers.Vectors (Positive, S_Ctrl_Data);
   subtype Controls_Vector is GUI_Controls_Package.Vector;

end GUI;
