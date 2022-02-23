@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AlteaUp - CID / JOB - CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZAUP_WMF_CID_JOB_CDS_I
  as select from zaup_wmf_cid_job as Job
    join         zaup_wmf_job on  Job.Job = zaup_wmf_job.Job
                              and Job.Werks = zaup_wmf_job.Werks
  association to parent ZAUP_WMF_CID_CDS_I as _Cid on $projection.Ciduuid = _Cid.Ciduuid

{
  key Job.ciduuid        as Ciduuid,
  key Job.jobuuid        as Jobuuid,
      zaup_wmf_job.job   as Job,
      zaup_wmf_job.werks as Werks,
      zaup_wmf_job.descr as Descr,
      Job.created_by     as CreatedBy,
      Job.created_at     as CreatedAt,

      /* Public associations */
      _Cid

}
