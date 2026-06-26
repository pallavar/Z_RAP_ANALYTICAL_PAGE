@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text Category'
@Metadata.ignorePropagatedAnnotations: true


// Analytical 
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'category'

define view entity ZI_Category_Text as select from zexcategorytext
{
    @ObjectModel.text.element: ['Text']
    key category as Category,
        @Semantics.language: true
    key language as Language,
        @Semantics.text: true
    text as Text
}
