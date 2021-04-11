/*Specifies all areas within the bridge area*/

area(bridge, b1).
area(bridge, b2).
area(bridge, b3).
area(bridge, b4).
area(bridge, b5).
area(bridge, b6).
area(bridge, b7).

/*Specifies all connections within the bridge area*/
connected(b1, b2).
connected(b1, b7).
connected(b2, b3).
connected(b3, b4).
connected(b4, b5).
connected(b3, b5).
connected(b5, b6).
connected(b6, b7).