module EventsHelper
  def is_property_safe(property)
    return true if !property

    ['host', 'port', 'path_part_1', 'created_at'].include?(property)
  end

  def is_relation_safe(relation)
    return true if !relation

    ['url'].include?(relation)
  end

  def filter_query(query, filter)
    parameter, operator, value = process_filter(filter)

    relation, property = parameter.split(':')

    if !property
      property = relation
      relation = nil
    end

    raise "Attempted to filter by unrecognised parameter \"#{parameter}\"" if !is_relation_safe(relation) || !is_property_safe(property)

    if is_relation_safe(relation) && is_property_safe(property)
      if relation
        query = query.joins(relation.to_sym)
      else 
        relation = 'events'
      end

      query = query.where(:url => {property => value}) if operator == '='
      query = query.where("#{relation}.#{property} LIKE ?", "%#{value}%") if operator == '*='
      query = query.where("#{relation}.#{property} LIKE ?", "#{value}%") if operator == '^='
      query = query.where("#{relation}.#{property} LIKE ?", "%#{value}") if operator == '$='
      query = query.where("#{relation}.#{property} ~ ?", value) if operator == '~='
      query = query.where("#{relation}.#{property} > ?", value) if operator == '>'
      query = query.where("#{relation}.#{property} < ?", value) if operator == '<'
    end

    query
  end

  def process_filter(filter)
    match = /^(?<parameter>[\w\d\:]*)(?<operator>[~^$*]?=|>|<)(?<value>.*)/.match(filter)

    raise "Improperly formatted filter \"#{filter}\"" if !match

    [match[:parameter], match[:operator], match[:value]]
  end
end
