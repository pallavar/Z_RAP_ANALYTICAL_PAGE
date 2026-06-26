@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Query view for ZIMYEXP'
@Metadata.ignorePropagatedAnnotations: false

//@Analytics.dataCategory: #CUBE

//@Analytics.query: true


@UI.selectionPresentationVariant: [

    {
        qualifier: 'Default',
        presentationVariantQualifier: 'VisualChartFilter',
        selectionVariantQualifier: 'Default'
    },
    {
        qualifier: 'YearMonthVariant',
        presentationVariantQualifier: 'VisualChartYearMonth',
        selectionVariantQualifier: 'YearMonthSelection'
    }
]


@UI.presentationVariant:
[
   {

   qualifier: 'VisualChartFilter',
   visualizations: [{

                       type: #AS_CHART,
                       qualifier: 'ChartDefault'

                   }]
   },
   {
   qualifier: 'VisualChartYearMonth',

   visualizations: [{

                       type: #AS_CHART,
                       qualifier: 'ChartYearMonth'

                    }]
   }
]



@UI.selectionVariant: 
[
    {

            qualifier: 'Default',
            text: 'Default'

    },
    {
        qualifier: 'YearMonthSelection',
        text: 'Expense Trend by Month'
    }
]



@UI.chart: 
[
    {
       qualifier: 'ChartDefault',
    
       chartType: #COLUMN_STACKED,
    
       description: 'Expense Trend by Category',
    
       dimensions: ['Category'],
    
       measures: ['Amount'],
       
       dimensionAttributes: [{
    
                                   dimension: 'Category',
                            
                                   role: #CATEGORY

                            }],


        measureAttributes:  [{

                               measure: 'Amount',
                        
                               role: #AXIS_1

                            }]
 },

 {
 qualifier: 'ChartYearMonth',
 chartType: #COLUMN,
 description: 'Expense Trend by Year-Month',

 dimensions: ['ExpenseMonth'],

 measures: ['Amount'],

 dimensionAttributes: [{
   dimension: 'ExpenseMonth',
   role: #CATEGORY
 }],

 measureAttributes: [{
   measure: 'Amount',
   role: #AXIS_1
 }]
}





 ]


define view entity ZC_MYEXPENSES_CUBE
  //provider contract analytical_query
  as projection on ZIMYEXP

  //as select from ZIMYEXP
{
  //    DocId,
  //        @ObjectModel.foreignKey.association: '_CalendarDate'
  //    PostingDate,

  @DefaultAggregation: #SUM
  @Semantics.amount.currencyCode: 'UnitpriceCurrencycode'
  Amount,
  UnitpriceCurrencycode,
  //        @ObjectModel.text.association: '_Text'
  @UI.selectionField: [{ position: 10 }]
  Category,
  @Semantics.calendar.yearMonth: true
  @UI.selectionField: [{ position: 30 }]
  ExpenseMonth,
  @Semantics.calendar.year: true
  @UI.selectionField: [{ position: 20 }]
  ExpenseYear,
  /* Associations */
  //    _CalendarDate,
  _Text
}
