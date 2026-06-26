@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Consumption view for ZC_MYEXPENSES_CUBE'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [#ANALYTICAL_QUERY]


define view entity ZI_MYEXPEN_PROJ
as select from ZIMYEXP




//as projection on ZC_MYEXPENSES_CUBE
{
    DocId,
    PostingDate,
    Amount,
    UnitpriceCurrencycode,
    Category,
    ExpenseMonth,
    ExpenseYear,
    /* Associations */
    _CalendarDate,
    _Text
}
