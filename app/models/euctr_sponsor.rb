class EuctrSponsor < StudyRelationship

  def self.create_all_from(opts)
    euctr_hash=opts[:euctr_hash]
    if !euctr_hash.nil?
      col=[]
      eudract_id=euctr_hash['a2_eudract_number']
      nodes=euctr_hash['b1_sponsor']
      nodes.each{|hash|
        opts[:eudract_id]=eudract_id
        opts[:euctr_hash]=hash
        col << create_from(opts)
      }
      import(col.compact)
    end
  end

  def attribs
    {
      :eudract_id => get_opt(:eudract_id),
      :b11_name_of_sponsor => get_euctr('b11_name_of_sponsor'),
      :b134_country => get_euctr('b134_country'),
      :b31_and_b32_status_of_the_sponsor => get_euctr('b31_and_b32_status_of_the_sponsor'),
      :b51_name_of_organisation => get_euctr('b51_name_of_organisation'),
      :b52_functional_name_of_contact_point => get_euctr('b52_functional_name_of_contact_point'),
      :b531_street_address => get_euctr('b531_street_address'),
      :b532_town_city => get_euctr('b532_town_city'),
      :b533_post_code => get_euctr('b533_post_code'),
      :b534_country => get_euctr('b534_country'),
      :b54_telephone_number => get_euctr('b54_telephone_number'),
      :b55_fax_number => get_euctr('b55_fax_number'),
      :b56_email => get_euctr('b56_email'),
    }
  end

end
