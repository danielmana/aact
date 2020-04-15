class EuctrInformation < StudyRelationship
  self.table_name = 'euctr_informations'

  def self.get(hash, key)
    val=hash && hash[key]
    return val && val.force_encoding('iso8859-1').encode('utf-8')
  end

  def self.create_all_from(opts)
    nct_id=opts[:nct_id]
    hash=opts[:euctr_hash]
    if !hash.nil?
      eudract_id=hash['a2_eudract_number']
      col=[]
      col << new({
        :nct_id => nct_id,
        :eudract_id => eudract_id,
        :locale => 'en',
        :a3_full_title_of_the_trial => get(hash, 'a3_full_title_of_the_trial'),
        :a31_title => get(hash, 'a31_title_of_the_trial_for_lay_people_in_easily_understood_ie_nontechnical_language'),
        :e11_medical_conditions_being_investigated => get(hash, 'e11_medical_conditions_being_investigated'),
        :e111_medical_condition => get(hash, 'e111_medical_condition_in_easily_understood_language'),
        :e21_main_objective_of_the_trial => get(hash, 'e21_main_objective_of_the_trial'),
        :e22_secondary_objectives_of_the_trial => get(hash, 'e22_secondary_objectives_of_the_trial'),
        :e3_principal_inclusion_criteria => get(hash, 'e3_principal_inclusion_criteria'),
        :e4_principal_exclusion_criteria => get(hash, 'e4_principal_exclusion_criteria'),
        :e51_primary_end_points => get(hash, 'e51_primary_end_points'),
        :e511_timepoints => get(hash, 'e511_timepoints_of_evaluation_of_this_end_point'),
        :e52_secondary_end_points => get(hash, 'e52_secondary_end_points'),
        :e521_timepoints => get(hash, 'e521_timepoints_of_evaluation_of_this_end_point'),
        :e6131_other_scope_of_the_trial_description => get(hash, 'e6131_other_scope_of_the_trial_description'),
      })
      col << new({
        :nct_id => nct_id,
        :eudract_id => eudract_id,
        :locale => 'es',
        :a3_full_title_of_the_trial => get(hash, 'a3_full_title_of_the_trial_es'),
        :a31_title => get(hash, 'a31_title_of_the_trial_for_lay_people_in_easily_understood_ie_nontechnical_language_es'),
        :e11_medical_conditions_being_investigated => get(hash, 'e11_medical_conditions_being_investigated_es'),
        :e111_medical_condition => get(hash, 'e111_medical_condition_in_easily_understood_language_es'),
        :e21_main_objective_of_the_trial => get(hash, 'e21_main_objective_of_the_trial_es'),
        :e22_secondary_objectives_of_the_trial => get(hash, 'e22_secondary_objectives_of_the_trial_es'),
        :e3_principal_inclusion_criteria => get(hash, 'e3_principal_inclusion_criteria_es'),
        :e4_principal_exclusion_criteria => get(hash, 'e4_principal_exclusion_criteria_es'),
        :e51_primary_end_points => get(hash, 'e51_primary_end_points_es'),
        :e511_timepoints => get(hash, 'e511_timepoints_of_evaluation_of_this_end_point_es'),
        :e52_secondary_end_points => get(hash, 'e52_secondary_end_points_es'),
        :e521_timepoints => get(hash, 'e521_timepoints_of_evaluation_of_this_end_point_es'),
        :e6131_other_scope_of_the_trial_description => get(hash, 'e6131_other_scope_of_the_trial_description_es'),
      })
      import(col)
    end
  end

end
