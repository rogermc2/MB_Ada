
package Exceptions is

   type Exception_Code is
     (EXCEP_IRQ,       --  interrupt
      EXCEP_AdEL,      --  address error exception (load or ifetch)
      EXCEP_AdES,      --  address error exception (store)
      EXCEP_IBE,       --  bus error (ifetch)
      EXCEP_DBE,       --  bus error (load/store)
      EXCEP_Sys,       --  syscall
      EXCEP_Bp,        --  breakpoint
      EXCEP_RI,        --  reserved instruction
      EXCEP_CpU,       --  coprocessor unusable
      EXCEP_Overflow,  --  arithmetic overflow
      EXCEP_Trap,      --  trap (possible divide by zero)
      EXCEP_IS1,       --  implementation specfic 1
      EXCEP_CEU,       --  CorExtend Unuseable
      EXCEP_C2E);

private

   for Exception_Code use (EXCEP_IRQ => 0,
                           EXCEP_AdEL => 4,
                           EXCEP_AdES => 5,
                           EXCEP_IBE => 6,
                           EXCEP_DBE => 7,
                           EXCEP_Sys => 8,
                           EXCEP_Bp => 9,
                           EXCEP_RI => 10,
                           EXCEP_CpU => 11,
                           EXCEP_Overflow => 12,
                           EXCEP_Trap => 13,
                           EXCEP_IS1 => 14,
                           EXCEP_CEU => 15,
                           EXCEP_C2E => 16);

end Exceptions;
