@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for My Expenses'
@Metadata.ignorePropagatedAnnotations: false


//// Analytical 
@Analytics.dataCategory: #CUBE
////@Analytics.query: true
//
//
//@UI.selectionPresentationVariant: [{
//
//    qualifier: 'Default',
//
//    presentationVariantQualifier: 'Default',
//
//    selectionVariantQualifier: 'Default'   
//
// }]
// 
// 
// @UI.presentationVariant: [{
//
//    qualifier: 'Default',
//
//    visualizations: [{
//
//        type: #AS_CHART,
//
//        qualifier: 'ChartDefault'
//
//    }]
//
// }]
//
//@UI.selectionVariant: [{
//
//    qualifier: 'Default',
//
//    text: 'Default'
//
// }]
// 
// 
// 
// @UI.chart: [{
//
//    qualifier: 'ChartDefault',
//
//    chartType: #DONUT,
//
//    dimensions: ['Category'],
//
//    measures: ['Amount'],
//
//    dimensionAttributes: [{
//
//        dimension: 'Category',
//
//        role: #CATEGORY
//
//     }
////     ,{
////
////        dimension: 'ExpenseMonth',
////
////        role: #CATEGORY
////
////     }
//     ],
//
//    measureAttributes: [{
//
//        measure: 'Amount',
//
//        role: #AXIS_1
//
//     }]
//
//  }]

define view entity ZIMYEXP as select from zmy_expenses

association [0..1] to ZI_Category_Text as _Text
on $projection.Category = _Text.Category
and _Text.Language = $session.system_language

association [0..1] to I_CalendarDate as _CalendarDate
on $projection.PostingDate = _CalendarDate.CalendarDate

{

     @UI:{

        lineItem: [{ position: 10 }],selectionField: [{ position: 10 }]

    }
      doc_id as DocId,
    
     @UI:{

        lineItem: [{ position: 20 }],selectionField: [{ position: 20 }]

    }
            @ObjectModel.foreignKey.association: '_CalendarDate'
    
    posting_date as PostingDate,
    
    @Aggregation.default: #SUM
      @UI:{

        lineItem: [{ position: 30 }],selectionField: [{ position: 30 }]

    }
    unitprice as Amount,

//    @Aggregation.default: #NONE
    unitprice_currencycode as UnitpriceCurrencycode,

    @ObjectModel.text.association: '_Text'
    
     @UI:{

        selectionField: [{position: 40 }],

        lineItem: [{ position: 40 }]

    }   
    
        @AnalyticsDetails.query.display: #KEY_TEXT
    
    category as Category,

   @UI:{

        selectionField: [{position: 50 }],
        lineItem: [{ position: 50 }]

    } 
   
    _CalendarDate.CalendarYear as ExpenseYear,
     @UI:{

        selectionField: [{position: 60 }],
                lineItem: [{ position: 60 }]
        

    }    
    _CalendarDate.YearMonth as ExpenseMonth,
     _Text,
    _CalendarDate,
    _CalendarDate._CalendarYear,
    _CalendarDate._YearMonth
}
