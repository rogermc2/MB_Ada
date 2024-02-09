
with Interfaces.C; use Interfaces.C;

with Command_And_Token_Tables; use Command_And_Token_Tables;

package Memory is

   --  In the PIC32 the following four variables are set by the linker:
   Stack                  : unsigned;  --  virtual address of the top of stack
   Splim                  : unsigned;  --  virtual address of top of heap
   Heap                   : unsigned;  --  virtual address of the top of heap
   Min_Stack_Size         : unsigned;  --  number of bytes allocated to stack

   Temp_Memory_Is_Changed : Boolean := False;

   procedure Clear_Temp_Memory;
   function Get_Temp_Memory (Num_Bytes : Long_Integer) return Byte_Array;

   --    The RAM memory map looks like this:
   --    |--------------------|    <<<   0xA0002000  (Top of RAM)
   --    |  Functions in RAM  |
   --    |--------------------|    <<<   (unsigned char *)&_stack
   --    |                    |
   --    | Stack (grows down) |
   --    |                    |
   --    |--------------------|    <<<   (unsigned char *)&_stack - (unsigned int)&_min_stack_size
   --    |                    |
   --    |                    |
   --    |     Free RAM       |
   --    |                    |
   --    |                    |
   --    |--------------------|   <<<   (unsigned char *)&_splim
   --    |                    |
   --    | Heap (if allocated)|
   --    |                    |
   --    |--------------------|   <<<   (unsigned char *)&_heap
   --    |                    |
   --    |                    |
   --    |                    |
   --    |  Static RAM Vars   |
   --    |                    |
   --    |                    |
   --    |                    |
   --    |--------------------|    <<<   0xA0000000
   --
   --    The variables must be defined to the C Compiler before using them.  Eg:
   --        extern unsigned int _stack;
   --        extern unsigned int _splim;
   --        extern unsigned int _heap;
   --        extern unsigned int _min_stack_size;

end Memory;
