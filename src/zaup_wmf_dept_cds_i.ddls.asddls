@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AlteaUp - Department - CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAUP_WMF_DEPT_CDS_I as select from zaup_wmf_t_dept {
    key werks as Werks,
    key dept as Dept,
    descr as Descr
}
