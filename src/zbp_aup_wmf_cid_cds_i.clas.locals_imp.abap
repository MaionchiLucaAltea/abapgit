CLASS lhc_Cid DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF cid_status,
        active   VALUE 'A',
        inactive VALUE 'I',
        susp     VALUE 'S',
        waiting  VALUE 'W',
      END OF cid_status.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Cid RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Cid RESULT result.

    METHODS calcFiscalCode FOR MODIFY
      IMPORTING keys FOR ACTION Cid~calcFiscalCode RESULT result.

    METHODS checkFiscalCode FOR MODIFY
      IMPORTING keys FOR ACTION Cid~checkFiscalCode.

    METHODS setActiveCID FOR MODIFY
      IMPORTING keys FOR ACTION Cid~setActiveCID RESULT result.

    METHODS setInactiveCID FOR MODIFY
      IMPORTING keys FOR ACTION Cid~setInactiveCID RESULT result.

    METHODS setInitialStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Cid~setInitialStatus.

    METHODS calculateCID FOR DETERMINE ON SAVE
      IMPORTING keys FOR Cid~calculateCID.

    METHODS checkDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR Cid~checkDate.

    METHODS checkScreen FOR VALIDATE ON SAVE
      IMPORTING keys FOR Cid~checkScreen.


ENDCLASS.

CLASS lhc_Cid IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD calcFiscalCode.
  ENDMETHOD.

  METHOD checkFiscalCode.
  ENDMETHOD.

  METHOD setActiveCID.
    "Set Valore ACITVE
    MODIFY ENTITIES OF zaup_wmf_cid_cds_i IN LOCAL MODE
    ENTITY Cid
      UPDATE FIELDS ( Status )
      WITH VALUE #( FOR key IN keys (
                         %key      = key-%tky
                         Status = cid_status-active ) )
      FAILED DATA(t_failed)
      REPORTED DATA(t_reported).

    "Read Entities
    READ ENTITIES OF zaup_wmf_cid_cds_i IN LOCAL MODE
    ENTITY Cid
      ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(t_cid).

    result = VALUE #( FOR cid IN t_cid ( %tky   = cid-%tky
                                         %param = cid ) ).
  ENDMETHOD.

  METHOD setInactiveCID.
    "Set Valore INACITVE
    MODIFY ENTITIES OF zaup_wmf_cid_cds_i IN LOCAL MODE
    ENTITY Cid
      UPDATE FIELDS ( Status )
      WITH VALUE #( FOR key IN keys (
                         %key      = key-%tky
                         Status = cid_status-inactive ) )
      FAILED DATA(t_failed)
      REPORTED DATA(t_reported).

    "Read Entities
    READ ENTITIES OF zaup_wmf_cid_cds_i IN LOCAL MODE
    ENTITY Cid
      ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(t_cid).

    result = VALUE #( FOR cid IN t_cid ( %tky   = cid-%tky
                                         %param = cid ) ).


  ENDMETHOD.

  METHOD setInitialStatus.
  ENDMETHOD.

  METHOD calculateCID.
  ENDMETHOD.

  METHOD checkDate.
  ENDMETHOD.

  METHOD checkScreen.
    "Read Entities
    READ ENTITIES OF zaup_wmf_cid_cds_i IN LOCAL MODE
    ENTITY Cid
      ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(t_cid).

    DATA t_country TYPE SORTED TABLE OF zaup_wmf_count_cds_i WITH UNIQUE KEY country.
    " Optimization of DB select: extract distinct non-initial customer IDs
    t_country = CORRESPONDING #( t_cid DISCARDING DUPLICATES MAPPING country = BirthCountry EXCEPT * ).
    DELETE t_country WHERE country IS INITIAL.
    CHECK t_country IS NOT INITIAL.

    " Check if customer ID exist
    SELECT FROM zaup_wmf_t_count FIELDS  country
      FOR ALL ENTRIES IN @t_country
      WHERE country = @t_country-country
      INTO TABLE @DATA(t_country_db).

    " Raise msg for non existing customer id
    LOOP AT t_cid INTO DATA(s_cid).
      IF s_cid-BirthCountry IS NOT INITIAL AND NOT line_exists( t_country_db[ country = s_cid-BirthCountry ] ).
        APPEND VALUE #(  %tky = s_cid-%tky ) TO failed-cid.
        APPEND VALUE #(  %tky = s_cid-%tky
                         %msg      = new_message( id       = 'ZAUP_WMF'
                                                  number   = '002'
                                                  v1       = s_cid-BirthCountry
                                                  severity = if_abap_behv_message=>severity-error )
                         %element-BirthCountry = if_abap_behv=>mk-on ) TO reported-cid.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
