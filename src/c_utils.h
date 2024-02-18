
#define PPSInput(grp,fn,pin) \
IN_FN_PPS##grp##_##fn = IN_PIN_PPS##grp##_##pin
#define PPSOutput (grp,pin,fn) \
 OUT_PIN_PPS##grp##_##pin = OUT_FN_PPS##grp##_##fn
