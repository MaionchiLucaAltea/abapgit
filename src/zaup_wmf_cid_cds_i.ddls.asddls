@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'AlteaUp - CID - CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZAUP_WMF_CID_CDS_I
  as select from zaup_wmf_cid as Cid

  /* Associations */
  composition [0..*] of ZAUP_WMF_CID_JOB_CDS_I as _Job //      on  $projection.Ciduuid = _Job.Ciduuid
  association [0..1] to ZAUP_WMF_COUNT_CDS_I   as _Country     on  $projection.BirthCountry = _Country.Country
  association [0..1] to ZAUP_WMF_CTZN_CDS_I    as _Citizenship on  $projection.Citizenship = _Citizenship.Citizenship
  association [0..1] to ZAUP_WMF_DEPT_CDS_I    as _Department  on  $projection.Dept  = _Department.Dept
                                                               and $projection.Werks = _Department.Werks
  association [0..1] to ZAUP_WMF_KOSTL_CDS_I   as _Kostl       on  $projection.KostCenter = _Kostl.KostCenter
                                                               and $projection.Werks      = _Kostl.Werks
  association [0..1] to ZAUP_WMF_PAREA_CDS_I   as _PersArea    on  $projection.PersArea = _PersArea.PersArea
  association [0..1] to ZAUP_WMF_WERKS_CDS_I   as _Plant       on  $projection.Werks = _Plant.Werks
  association [0..1] to ZAUP_WMF_DOMA_GEND_I   as _Gender      on  $projection.Gender = _Gender.Code
{
  key ciduuid         as Ciduuid,
      werks           as Werks,
      pers_area       as PersArea,
      dept            as Dept,
      pernr_sap       as PernrSap,
      begda           as Begda,
      enda            as Enda,
      name            as Name,
      surname         as Surname,
      full_name       as FullName,
      date_hire       as DateHire,
      date_fire       as DateFire,
      birth_date      as BirthDate,
      birth_city      as BirthCity,
      birth_district  as BirthDistrict,
      birth_state     as BirthState,
      birth_country   as BirthCountry,
      citizenship     as Citizenship,
      language        as Language,
      fiscal_code     as FiscalCode,
      gender          as Gender,
      status          as Status,
      type            as Type,
      kost_center     as KostCenter,
      
      concat_with_space(Cid.surname, Cid.name, 1) as TitleCid,

      case Cid.status
      when 'C' then 'sap-icon://status-completed'
      when 'W' then 'sap-icon://status-critical'
      when 'E' then 'sap-icon://status-error'
      else  'sap-icon://status-critical'
      end             as StatusIcon,

      case Cid.status
      when 'C' then 3
      when 'W' then 2
      when 'E' then 1
      else  2
      end             as StatusCriticality,
      
      case Cid.status
      when 'C' then 'Active'
      when 'W' then 'Inactive'
      when 'E' then 'Error'
      else  'Inactive'
      end             as StatusDescr,

      /*-- Admin data --*/
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,


      /* Public associations */
      _Job,
      _Country,
      _Citizenship,
      _Department,
      _Kostl,
      _PersArea,
      _Plant,
      _Gender

}
