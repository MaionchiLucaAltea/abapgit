CLASS zaup_wmf_mess DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .
    INTERFACES if_abap_behv_message.

    CONSTANTS:
      BEGIN OF date_error,
        msgid TYPE symsgid VALUE 'ZAUP_WMF',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'BIRTHDATE',
        attr2 TYPE scx_attrname VALUE 'BIRTHDATE',
        attr3 TYPE scx_attrname VALUE 'BIRTHDATE',
        attr4 TYPE scx_attrname VALUE 'BIRTHDATE',
      END OF date_error.

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAUP_WMF_MESS IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
          if_t100_message~t100key = if_t100_message=>default_textid.
        ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
*    me->if_abap_behv_messagem_severity~m_severity
  ENDMETHOD.
ENDCLASS.
