@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AlteaUp -  Cost Center - CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAUP_WMF_KOSTL_CDS_I as select from zaup_wmf_t_kostl {
    key werks as Werks,
    key kost_center as KostCenter,
    descr as Descr
}
