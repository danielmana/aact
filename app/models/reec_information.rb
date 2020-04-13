class ReecInformation < StudyRelationship

  def attribs
    eudract_id=get_reec('identificador')
    if eudract_id.blank?
      nil
    else
      hash=get_reec('informacion')
      {
        :eudract_id => eudract_id,
        :titulo_publico => hash['tituloPublico'],
        :titulo_publico_en => hash['tituloPublico_en'],
        :titulo_cientifico => hash['tituloCientifico'],
        :titulo_cientifico_en => hash['tituloCientifico_en'],
        :indicacion_publica => hash['indicacionPublica'],
        :indicacion_publica_en => hash['indicacionPublica_en'],
        :indicacion_cientifica => hash['indicacionCientifica'],
        :indicacion_cientifica_en => hash['indicacionCientifica_en'],
        :criterios_inclusion => hash['criteriosInclusion'],
        :criterios_inclusion_en => hash['criteriosInclusion_en'],
        :criterios_exclusion => hash['criteriosExclusion'],
        :criterios_exclusion_en => hash['criteriosExclusion_en'],
        :variables_principales => hash['variablesPrincipales'],
        :variables_principales_en => hash['variablesPrincipales_en'],
        :variables_secundarias => hash['variablesSecundarias'],
        :variables_secundarias_en => hash['variablesSecundarias_en'],
        :objetivo_principal => hash['objetivoPrincipal'],
        :objetivo_principal_en => hash['objetivoPrincipal_en'],
        :objetivo_secundario => hash['objetivoSecundario'],
        :objetivo_secundario_en => hash['objetivoSecundario_en'],
        :momentos_principales => hash['momentosPrincipales'],
        :momentos_principales_en => hash['momentosPrincipales_en'],
        :momentos_secundarios => hash['momentosSecundarios'],
        :momentos_secundarios_en => hash['momentosSecundarios_en'],
        :justificacion => hash['justificacion'],
        :justificacion_en => hash['justificacion_en']
      }
    end
  end

end
