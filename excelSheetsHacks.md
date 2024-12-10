# Excel Hacks

## Drop down
* Data Validation
* Range (X1:Z1) - horizontal or vertical

## Get value for specific cell
* goes from outward in

```
* Example: =IF(B3="some text",$J$1,0) # where 0 would be the false value
=(IF(B3=IF(ISBLANK(J3),"'",J3),$J$1,0))
=(IF(B3=IF(ISBLANK(I3),"'",I3),$I$1,IF(B3=IF(ISBLANK(J3),"'",J3),$J$1,0)))
=(IF(B3=IF(ISBLANK(H3),"'",H3),$H$1,IF(B3=IF(ISBLANK(I3),"'",I3),$I$1,IF(B3=IF(ISBLANK(J3),"'",J3),$J$1,0))))
=(IF(B3=IF(ISBLANK(G3),"'",G3),$G$1,IF(B3=IF(ISBLANK(H3),"'",H3),$H$1,IF(B3=IF(ISBLANK(I3),"'",I3),$I$1,IF(B3=IF(ISBLANK(J3),"'",J3),$J$1,0)))))
=(IF(B3=IF(ISBLANK(F3),"'",F3),$F$1,IF(B3=IF(ISBLANK(G3),"'",G3),$G$1,IF(B3=IF(ISBLANK(H3),"'",H3),$H$1,IF(B3=IF(ISBLANK(I3),"'",I3),$I$1,IF(B3=IF(ISBLANK(J3),"'",J3),$J$1,0))))))
=(IF(B3=IF(ISBLANK(E3),"'",E3),$E$1,IF(B3=IF(ISBLANK(F3),"'",F3),$F$1,IF(B3=IF(ISBLANK(G3),"'",G3),$G$1,IF(B3=IF(ISBLANK(H3),"'",H3),$H$1,IF(B3=IF(ISBLANK(I3),"'",I3),$I$1,IF(B3=IF(ISBLANK(J3),"'",J3),$J$1,0))))))
```
