@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AlteaUp - Domain List - Gender'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #XL,
    dataClass: #MIXED
}
define view entity ZAUP_WMF_DOMA_GEND_I
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE( p_domain_name: 'ZAUFP_WMF_D08' )
    join         DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZAUFP_WMF_D08' ) on  DDCDS_CUSTOMER_DOMAIN_VALUE.domain_name    = DDCDS_CUSTOMER_DOMAIN_VALUE_T.domain_name
                                                                                 and DDCDS_CUSTOMER_DOMAIN_VALUE.value_position = DDCDS_CUSTOMER_DOMAIN_VALUE_T.value_position
{
      @Search.defaultSearchElement: true
      @EndUserText.label: 'Code'
  key DDCDS_CUSTOMER_DOMAIN_VALUE.value_low as Code,
      DDCDS_CUSTOMER_DOMAIN_VALUE_T.text    as Text



}
