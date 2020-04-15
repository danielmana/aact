class ReecSponsor < StudyRelationship

  def attribs
    eudract_id=get_reec('identificador')
    if eudract_id.blank?
      nil
    else
      hash=get_reec('organismo')
      {
        :eudract_id => eudract_id,
        :promotor => hash['promotor'],
        :domicilio => hash['domicilio'],
        :telefono => hash['telefono'],
        :fax => hash['fax'],
        :mail => hash['mail'],
        :persona_contacto => hash['personaContacto'],
        :financiador => hash['financiador']
      }
    end
  end

end
