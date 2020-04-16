class ReecSponsor < StudyRelationship

  def self.create_all_from(opts)
    reec_hash=opts[:reec_hash]
    if !reec_hash.nil?
      col=[]
      eudract_id=reec_hash['identificador']
      hash=reec_hash['organismo']
      opts[:eudract_id]=eudract_id
      opts[:reec_hash]=hash
      col << create_from(opts)
      import(col.compact)
    end
  end

  def attribs
    {
      :eudract_id => get_opt(:eudract_id),
      :promotor => get_reec('promotor'),
      :domicilio => get_reec('domicilio'),
      :telefono => get_reec('telefono'),
      :fax => get_reec('fax'),
      :mail => get_reec('mail'),
      :persona_contacto => get_reec('personaContacto'),
      :financiador => get_reec('financiador')
    }
  end

end
