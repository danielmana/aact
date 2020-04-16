class ReecInformation < StudyRelationship

  def self.create_all_from(opts)
    reec_hash=opts[:reec_hash]
    if !reec_hash.nil?
      col=[]
      eudract_id=reec_hash['identificador']
      hash=reec_hash['informacion']
      opts[:eudract_id]=eudract_id
      opts[:reec_hash]=hash
      opts[:locale]='en'
      col << create_from(opts)
      opts[:locale]='es'
      col << create_from(opts)
      import(col.compact)
    end
  end

  def get_value(locale, key)
    if locale == 'en'
      get_reec("#{key}_en")
    else
      get_reec(key)
    end
  end

  def attribs
    locale=get_opt(:locale)
    {
      :eudract_id => get_opt(:eudract_id),
      :locale => locale,
      :titulo_publico => get_value(locale, 'tituloPublico'),
      :titulo_cientifico => get_value(locale, 'tituloCientifico'),
      :indicacion_publica => get_value(locale, 'indicacionPublica'),
      :indicacion_cientifica => get_value(locale, 'indicacionCientifica'),
      :criterios_inclusion => get_value(locale, 'criteriosInclusion'),
      :criterios_exclusion => get_value(locale, 'criteriosExclusion'),
      :variables_principales => get_value(locale, 'variablesPrincipales'),
      :variables_secundarias => get_value(locale, 'variablesSecundarias'),
      :objetivo_principal => get_value(locale, 'objetivoPrincipal'),
      :objetivo_secundario => get_value(locale, 'objetivoSecundario'),
      :momentos_principales => get_value(locale, 'momentosPrincipales'),
      :momentos_secundarios => get_value(locale, 'momentosSecundarios'),
      :justificacion => get_value(locale, 'justificacion'),
    }
  end

end
