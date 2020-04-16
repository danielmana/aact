class EuctrInformation < StudyRelationship

  def self.create_all_from(opts)
    euctr_hash=opts[:euctr_hash]
    if !euctr_hash.nil?
      col=[]
      eudract_id=euctr_hash['a2_eudract_number']
      opts[:eudract_id]=eudract_id
      opts[:locale]='en'
      col << create_from(opts)
      opts[:locale]='es'
      col << create_from(opts)
      import(col.compact)
    end
  end

  def get_value(locale, key)
    if locale == 'en'
      get_euctr(key)
    else
      get_euctr("#{key}_es")
    end
  end

  def attribs
    locale=get_opt(:locale)
    {
      :eudract_id => get_opt(:eudract_id),
      :locale => locale,
      :a3_full_title_of_the_trial => get_value(locale, 'a3_full_title_of_the_trial'),
      :a31_title => get_value(locale, 'a31_title_of_the_trial_for_lay_people_in_easily_understood_ie_nontechnical_language'),
      :e11_medical_conditions_being_investigated => get_value(locale, 'e11_medical_conditions_being_investigated'),
      :e111_medical_condition => get_value(locale, 'e111_medical_condition_in_easily_understood_language'),
      :e21_main_objective_of_the_trial => get_value(locale, 'e21_main_objective_of_the_trial'),
      :e22_secondary_objectives_of_the_trial => get_value(locale, 'e22_secondary_objectives_of_the_trial'),
      :e3_principal_inclusion_criteria => get_value(locale, 'e3_principal_inclusion_criteria'),
      :e4_principal_exclusion_criteria => get_value(locale, 'e4_principal_exclusion_criteria'),
      :e51_primary_end_points => get_value(locale, 'e51_primary_end_points'),
      :e511_timepoints => get_value(locale, 'e511_timepoints_of_evaluation_of_this_end_point'),
      :e52_secondary_end_points => get_value(locale, 'e52_secondary_end_points'),
      :e521_timepoints => get_value(locale, 'e521_timepoints_of_evaluation_of_this_end_point'),
      :e6131_other_scope_of_the_trial_description => get_value(locale, 'e6131_other_scope_of_the_trial_description'),
    }
  end

end
