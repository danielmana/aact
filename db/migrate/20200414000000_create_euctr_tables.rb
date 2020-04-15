class CreateEuctrTables < ActiveRecord::Migration

  def change

    create_table "ctgov.euctr_studies", force: :cascade do |t|
      t.string  "nct_id"
      t.string  "eudract_id"
      t.string  "x4_clinical_trial_type"
      t.string  "x5_trial_status"
      t.string  "x6_date_first_entered_in_the_eudract_database"
      t.string  "record_last_import"
      t.string  "ctrname"
      t.string  "a1_member_state_concerned"
      t.string  "a41_sponsors_protocol_code_number"
      t.text    "e112_therapeutic_area"
    end

    create_table "ctgov.euctr_informations", force: :cascade do |t|
      t.string  "nct_id"
      t.string  "eudract_id"
      t.string  "locale"
      t.text    "a3_full_title_of_the_trial"
      t.text    "a31_title"
      t.text    "e11_medical_conditions_being_investigated"
      t.text    "e111_medical_condition"
      t.text    "e21_main_objective_of_the_trial"
      t.text    "e22_secondary_objectives_of_the_trial"
      t.text    "e3_principal_inclusion_criteria"
      t.text    "e4_principal_exclusion_criteria"
      t.text    "e51_primary_end_points"
      t.text    "e511_timepoints"
      t.text    "e52_secondary_end_points"
      t.text    "e521_timepoints"
      t.text    "e6131_other_scope_of_the_trial_description"
    end

    create_table "ctgov.euctr_sponsors", force: :cascade do |t|
      t.string  "nct_id"
      t.string  "eudract_id"
      t.text    "b11_name_of_sponsor"
      t.text    "b134_country"
      t.text    "b31_and_b32_status_of_the_sponsor"
      t.text    "b51_name_of_organisation"
      t.text    "b52_functional_name_of_contact_point"
      t.text    "b531_street_address"
      t.string  "b532_town_city"
      t.string  "b533_post_code"
      t.string  "b534_country"
      t.string  "b54_telephone_number"
      t.string  "b55_fax_number"
      t.string  "b56_email"
    end

  end

end
