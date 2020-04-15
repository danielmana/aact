class EuctrStudy < StudyRelationship

  def attribs
    eudract_id=get_euctr('a2_eudract_number')
    if eudract_id.blank?
      nil
    else
      {
        :eudract_id => eudract_id,
        :x4_clinical_trial_type => get_euctr('x4_clinical_trial_type'),
        :x5_trial_status => get_euctr('x5_trial_status'),
        :x6_date_first_entered_in_the_eudract_database => get_euctr('x6_date_on_which_this_record_was_first_entered_in_the_eudract_database'),
        :record_last_import => get_euctr('record_last_import'),
        :ctrname => get_euctr('ctrname'),
        :a1_member_state_concerned => get_euctr('a1_member_state_concerned'),
        :a41_sponsors_protocol_code_number => get_euctr('a41_sponsors_protocol_code_number'),
        :e112_therapeutic_area => get_euctr('e112_therapeutic_area'),
      }
    end
  end

end
