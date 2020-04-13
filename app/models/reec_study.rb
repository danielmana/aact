class ReecStudy < StudyRelationship

  def attribs
    eudract_id=get_reec('identificador')
    if eudract_id.blank?
      nil
    else
      {
        :eudract_id => eudract_id,
        :acronimo => get_reec('acronimo'),
        :enfermedad_rara => get_reec('enfermedadRara'),
      }
    end
  end

end
