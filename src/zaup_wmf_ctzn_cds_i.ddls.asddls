@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'AlteaUp - Citizen - CDS'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAUP_WMF_CTZN_CDS_I as select from zaup_wmf_t_ctzn {
    key citizenship as Citizenship,
    descr as Descr
}
