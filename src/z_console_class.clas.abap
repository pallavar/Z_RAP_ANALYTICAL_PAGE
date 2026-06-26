CLASS z_console_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Z_CONSOLE_CLASS IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

DATA: lt_expenses_table TYPE TABLE OF zmy_expenses.

          lt_expenses_table = value #(
                           ( client = '080' doc_id = 'DOC10' category = '01' posting_date = '20260101' unitprice = '2313' unitprice_currencycode = 'USD' )
                           ( client = '080' doc_id = 'DOC20' category = '02' posting_date = '20230201' unitprice = '3411' unitprice_currencycode = 'USD' )
                           ( client = '080' doc_id = 'DOC30' category = '03' posting_date = '20230301' unitprice = '6855' unitprice_currencycode = 'USD' )
                           ( client = '080' doc_id = 'DOC40' category = '04' posting_date = '20230401' unitprice = '1221' unitprice_currencycode = 'USD' )
                           ( client = '080' doc_id = 'DOC50' category = '05' posting_date = '20230501' unitprice = '800'  unitprice_currencycode = 'USD' )




        ).

        OUT->write( SY-DBCNT ).
         MODIFY zmy_expenses FROM TABLE @lt_expenses_table.
         OUT->write( SY-DBCNT ).


*DATA: lt_category_table TYPE TABLE OF zexcategorytext.
*
*          lt_category_table = value #(
*                                            ( client = '080' category = '01' language = 'E' text = 'Rent' )
*                                            ( client = '080' category = '02' language = 'E' text = 'Electricity' )
*                                            ( client = '080' category = '03' language = 'E' text = 'Food' )
*                                            ( client = '080' category = '04' language = 'E' text = 'Transportation' )
*                                            ( client = '080' category = '05' language = 'E' text = 'Gas' )
*        ).
*
*        OUT->write( SY-DBCNT ).
*         MODIFY zexcategorytext FROM TABLE @lt_category_table.
*         OUT->write( SY-DBCNT ).
*


 ENDMETHOD.
ENDCLASS.
