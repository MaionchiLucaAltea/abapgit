@EndUserText.label: 'AlteaUp - CID / JOB - CDS - Consumption'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZAUP_WMF_CID_JOB_CDS_C
  as projection on ZAUP_WMF_CID_JOB_CDS_I as Job
{
  key Ciduuid,
  key Jobuuid,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZAUP_WMF_WERKS_CDS_I', element: 'Werks' }}]
      @Search.defaultSearchElement: true    
      Werks,  
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZAUP_WMF_JOB_I', element: 'Job' },
                                           additionalBinding: [{localElement: 'Werks', element: 'Werks' }]}]
      @ObjectModel.text.element: ['Descr']
      @Search.defaultSearchElement: true        
      Job,
      Descr,      
      CreatedBy,
      CreatedAt,
      /* Associations */
      _Cid: redirected to parent ZAUP_WMF_CID_CDS_C
}
