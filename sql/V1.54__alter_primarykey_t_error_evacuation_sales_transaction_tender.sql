ALTER TABLE scm.t_error_evacuation_scm_transaction_tender
 DROP CONSTRAINT t_error_evacuation_scm_transaction_tender_pk,
 ADD CONSTRAINT t_error_evacuation_scm_transaction_tender_pk PRIMARY KEY(transaction_id,order_sub_number,scm_transaction_id,tender_group,tender_id,tender_sub_number);
