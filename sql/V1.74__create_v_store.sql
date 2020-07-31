CREATE
OR REPLACE VIEW scm.v_store(
 lot_number,
 eai_update_date,
 eai_update_type,
 eai_send_status,
 eai_send_date,
 store_code,
 store_name,
 store_name_kana,
 store_addr1,
 store_addr2,
 store_city,
 county,
 state_code,
 system_country_code,
 postal_code,
 fax_number,
 phone_number,
 store_type_code,
 open_date,
 close_date,
 renewal_open_date,
 vat_region_code,
 channel_id,
 area_code,
 order_start_date,
 order_end_date,
 currency_code,
 language_code,
 shipment_logistics_district_code,
 store_scale_pattern_code,
 existing_store_type_code,
 inventory_object_type_code,
 register_cat_interlock_type_code,
 ss_store_manager_store_type_code,
 renewal_before_close_date,
 open_term_number,
 store_inspection_start_date,
 store_inspection_end_date,
 close_type_code,
 direct_management_fc_store_type_code,
 consignment_store_type_code,
 system_machine_removal_date,
 sale_channel_type_code,
 transfer_out_control_exclude_flag,
 system_business_code,
 code
) AS (
 SELECT
  w_store.lot_number,
  w_store.eai_update_date,
  w_store.eai_update_type,
  w_store.eai_send_status,
  w_store.eai_send_date,
  w_store.store_code,
  w_store.store_name,
  w_store.store_name_kana,
  w_store.address1 store_addr1,
  w_store.address2 store_addr2,
  w_store.store_city,
  w_store.county,
  w_store.state_code,
  w_store.system_country_code,
  w_store.postal_code,
  w_store.fax_number,
  w_store.phone_number,
  w_store.store_type store_type_code,
  w_store.store_open_date open_date,
  w_store.store_close_date close_date,
  w_store.renewal_open_date,
  w_store.vat_region_code,
  w_store.channel_id,
  w_store.area_code,
  w_store.order_start_days order_start_date,
  w_store.order_end_days order_end_date,
  w_store.currency_code,
  w_store.language_code,
  w_store.shipment_logistics_district_code,
  w_store.store_scale_pattern_code,
  w_store.existing_store_type_code,
  w_store.inventory_object_type_code,
  w_store.register_catinterlock_typecode register_cat_interlock_type_code,
  w_store.ss_store_manager_store_type_code,
  w_store.renewal_previous_close_date renewal_before_close_date,
  w_store.open_term_number,
  w_store.store_inspection_start_date,
  w_store.store_inspection_end_date,
  w_store.close_type_code,
  w_store.direct_management_fc_store_type_code,
  w_store.consignment_store_type_code,
  w_store.system_machine_removal_date,
  w_store.sale_channel_type_code,
  CAST(w_store.tsf_out_control_exclusion_type AS boolean) transfer_out_control_exclude_flag,
  w_store.system_business_code,
  m_store_general_purpose.code
 FROM
  scm.w_store,
  scm.m_store_general_purpose
 WHERE
  w_store.store_code = m_store_general_purpose.store_code
  AND m_store_general_purpose.general_purpose_type = 'time_zone'
)
;

GRANT SELECT,INSERT,UPDATE,DELETE,TRUNCATE ON ALL TABLES IN SCHEMA scm TO scmuser;
GRANT SELECT ON ALL TABLES IN SCHEMA scm TO scmview;
