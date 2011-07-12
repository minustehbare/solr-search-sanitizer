module SolrSearchSanitizer
  module Sanitizer
    BOOLEAN_STRING_OPERATOR_REGEXP = /(\b(AND)\b|\b(OR)\b|\b(NOT)\b)/
    BOOLEAN_SYMBOL_OPERATOR_REGEXP = /\B(&&)\B|\B(!)\B|\B(\|\|)\B/
    BRACKET_REGEXP = /((\()|(\))|(\{)|(\})|(\[)|(\]))/
    WILDCARD_REGEXP = /((\*)|(\?))/
    #FUZZY_REGEXP = /[\w|\"](~)[\d]?/
    FUZZY_REGEXP = /(~)/
    #BOOST_REGEXP = /[\w|\"](\^)[\d]?/
    BOOST_REGEXP = /(\^)/
    #BOOLEAN_MODIFIER_REGEXP = /((\+)|(-))[(\w+(\b))|(\".+\")]/
    BOOLEAN_MODIFIER_REGEXP = /((\+)|(-))/
    MISC_REGEXP = /(\")|(:)/
    
    ####################
    #
    # All REGEXP definitions match characters or keywords that are part of the Apache Lucene Query Parser Sytntax
    #
    # BOOLEAN_OPERATOR_REGEXP => matches boolean operators on multiple search terms
    #
    # BRACKET_REGEXP => matches parentheses and brackets and braces that group search clauses or define range searches
    #
    # WILDCARD_REGEXP => matches ? or * characters in the search that act as single or multiple character wildcards within a search term
    #
    # FUZZY_REGEXP => matches the ~ character at the end of a search term or phrase
    #
    # BOOST_REGEXP => matches the ^ character at the end of a search term or phrase
    #
    # BOOLEAN_MODIFIER_REGEXP => matches + or - characters at the start of search terms/phrases
    #
    # MISC_REGEXp => matches (currently) : and " characters that are used for defining phrases or field values
    #
    ####################
    
    def escape_boolean_operators(query)
      new_query = query.gsub(BOOLEAN_SYMBOL_OPERATOR_REGEXP, '&&' => '\\&\\&', '||' => '\\|\\|', '!' => '\\!')
      new_query = new_query.gsub(BOOLEAN_STRING_OPERATOR_REGEXP, 'AND' => 'and', 'NOT' => 'not', 'OR' => 'or')
    end
    
    def remove_boolean_operators(query)
      new_query = query.gsub(BOOLEAN_STRING_OPERATOR_REGEXP.union(BOOLEAN_SYMBOL_OPERATOR_REGEXP), '')
    end
    
    def escape_brackets(query)
      new_query = query.gsub(BRACKET_REGEXP, '\\\\\1')
    end
    
    def remove_brackets(query)
      new_query = query.gsub(BRACKET_REGEXP, '')
    end
    
    def escape_wildcards(query)
      new_query = query.gsub(WILDCARD_REGEXP, '\\\\\1')
    end
    
    def remove_wildcards(query)
      new_query = query.gsub(WILDCARD_REGEXP, '')
    end
    
    def escape_fuzzy(query)
      new_query = query.gsub(FUZZY_REGEXP, '\\\\\1')
    end
    
    def remove_fuzzy(query)
      new_query = query.gsub(FUZZY_REGEXP, '')
    end
    
    def escape_boost(query)
      new_query = query.gsub(BOOST_REGEXP, '\\\\\1')
    end
    
    def remove_boost(query)
      new_query = query.gsub(BOOST_REGEXP, '')
    end
    
    def escape_boolean_modifiers(query)
      new_query = query.gsub(BOOLEAN_MODIFIER_REGEXP, '\\\\\1')
    end
    
    def remove_boolean_modifiers(query)
      new_query = query.gsub(BOOLEAN_MODIFIER_REGEXP, '')
    end
    
    def escape_misc(query)
      new_query = query.gsub(MISC_REGEXP, '"' => '\\"', ':' => '\\:')
    end
    
    def remove_misc(query)
      new_query = query.gsub(MISC_REGEXP, '')
    end
    
    def escape_special_characters(query)
      new_query = escape_boolean_operators(query)
      new_query = escape_brackets(new_query)
      new_query = escape_fuzzy(new_query)
      new_query = escape_boost(new_query)
      new_query = escape_boolean_modifiers(new_query)
      new_query = escape_misc(new_query)
    end
  end
end
