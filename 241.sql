Declare

V_SELL_ORDER_CLIENT_ID Number ;

V_SELL_ORDER_DATE date;

V_SELL_ORDER_TOTAL Number;

V_CLIENT_NAME varchar2(200);

cursor S_ITEMS is

  SELECT *

  FROM S_SELL_ORDER_ITEMS

  where SELL_ORDER_ID	 = :P12_SELL_ORDER_ID; 

Begin 

select SELL_ORDER_CLIENT_ID , SELL_ORDER_DATE , SELL_ORDER_TOTAL ,CLIENT_NAME

into V_SELL_ORDER_CLIENT_ID ,V_SELL_ORDER_DATE ,V_SELL_ORDER_TOTAL ,V_CLIENT_NAME

from S_SELL_ORDER ,S_CLIENT

where 

S_SELL_ORDER.SELL_ORDER_CLIENT_ID =S_CLIENT.CLIENT_ID and 

SELL_ORDER_ID	 = :P12_SELL_ORDER_ID	; 

htp.p('

 

  <div>Client : <b> '||V_CLIENT_NAME|| ' </b></div>

 

  <div> Date: <b> '||V_SELL_ORDER_DATE||'</b></div>

 

   

 <br>  '

);

htp.p('

  

<table>

 <tr>

  <th>Product Name </th>

  <th>Price </th>

  <th>Quantity </th>

  <th>Total</th> 

 </tr>

 

   

   '

);

 FOR SI in S_ITEMS

 LOOP

 htp.p

('

    <tr>

  <td>'||SI.PRODUCT_ID|| '</td>

  <td>'||SI.PRODUCT_PRICE||'</td>

  <td>'||SI.PRODUCT_QUANTITY||' </td>

  <td>'||SI.PRODUCT_TOTAL||' </td>

 </tr>

 '); 

 END LOOP;

 htp.p('

  <tr>

  <th colspan="3">Total</th>

  <th>'||V_SELL_ORDER_TOTAL||' </th>

 </tr>

    </table>

    ');

htp.p('

   <style>

table {

 font-family: arial, sans-serif;

 border-collapse: collapse;

 width: 100%;

}

td, th {

 border: 1px solid #dddddd;

 text-align: left;

 padding: 8px;

}

tr:nth-child(even) {

 background-color: #dddddd;

}

</style>

   ');

 

end;