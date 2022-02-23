@EndUserText.label: 'AlteaUp - CID - CDS - Consumption'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZAUP_WMF_CID_CDS_C
  as projection on ZAUP_WMF_CID_CDS_I as Cid
{
  key Ciduuid,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZAUP_WMF_WERKS_CDS_I', element: 'Werks' }}]
      @ObjectModel.text.element: ['DescrPlant']
      @Search.defaultSearchElement: true
      Werks,
      _Plant.Descr       as DescrPlant,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZAUP_WMF_PAREA_CDS_I', element: 'PersArea' }}]
      @ObjectModel.text.element: ['DescrPersArea']
      @Search.defaultSearchElement: true
      PersArea,
      _PersArea.Descr    as DescrPersArea,
      
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZAUP_WMF_DEPT_CDS_I', element: 'Dept' },
                                                 additionalBinding: [{localElement: 'Werks', element: 'Werks' }]}]
      @ObjectModel.text.element: ['DescrDept']
      @Search.defaultSearchElement: true
      Dept,
      _Department.Descr  as DescrDept,
      @Search.defaultSearchElement: true
      PernrSap,
      Begda,
      Enda,
      Name,
      @Search.defaultSearchElement: true
      Surname,
      FullName,
      DateHire,
      DateFire,
      @Search.defaultSearchElement: true
      BirthDate,
      BirthCity,
      BirthDistrict,
      BirthState,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZAUP_WMF_COUNT_CDS_I', element: 'Country' }}]
      @ObjectModel.text.element: ['DescrCountry']
      @Search.defaultSearchElement: true
      BirthCountry,
      _Country.Descr     as DescrCountry,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZAUP_WMF_CTZN_CDS_I', element: 'Citizenship' }}]
      Citizenship,
      _Citizenship.Descr as DescrCitizenship,
      Language,
      FiscalCode,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZAUP_WMF_DOMA_GEND_I', element: 'Code' }}]
      @ObjectModel.text.element: ['DescrGender']
      @Search.defaultSearchElement: true
      Gender,
      _Gender.Text       as DescrGender,
      @Search.defaultSearchElement: true
      Status,
      StatusIcon,
      StatusCriticality,
      StatusDescr,
      TitleCid,
      @Search.defaultSearchElement: true
      Type,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZAUP_WMF_KOSTL_CDS_I', element: 'KostCenter' },
                                                 additionalBinding: [{localElement: 'Werks', element: 'Werks' }]}]
      @ObjectModel.text.element: ['DescrKostl']
      @Search.defaultSearchElement: true
      KostCenter,
      _Kostl.Descr       as DescrKostl,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Citizenship,
      _Country,
      _Department,
      _Job : redirected to composition child ZAUP_WMF_CID_JOB_CDS_C,
      _Kostl,
      _PersArea,
      _Plant,
      _Gender
}
